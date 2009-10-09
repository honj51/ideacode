#region Using directives

using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.SqlServer.Replication.BusinessLogicSupport;

#endregion

namespace Microsoft.Samples.SqlServer
{
	public class CustomBusinessLogicHandler : BusinessLogicModule, IDisposable
	{
		// Track whether Dispose has been called.
		private bool disposed;

		private SqlConnection connection = new SqlConnection();
		private SqlCommand checkInventoryQuery;
		
		private static string checkInventoryProcedure
            = @"[dbo].[uspCheckProductInventory]";
		
		public CustomBusinessLogicHandler()
		{
		}

		public override void Dispose()
		{
			// Close the open connections.
			connection.Close();
			
			base.Dispose();

			Dispose(true);

			// This object will be cleaned up by the Dispose method.
			// Therefore, you should call GC.SupressFinalize to
			// take this object off the finalization queue 
			// and prevent finalization code for this object
			// from executing a second time.
			GC.SuppressFinalize(this);
		}

		// Dispose(bool disposing) executes in two distinct scenarios.
		// If disposing equals true, the method has been called directly
		// or indirectly by a user's code. Managed and unmanaged resources
		// can be disposed.
		// If disposing equals false, the method has been called by the 
		// runtime from inside the finalizer and you should not reference 
		// other objects. Only unmanaged resources can be disposed.
		private void Dispose(bool disposing)
		{
			// Check to see if Dispose has already been called.
			if (!this.disposed)
			{
				// If disposing equals true, dispose all managed 
				// and unmanaged resources.
				if (disposing)
				{
					// Dispose managed resources.
                    connection.Dispose();
				}
			}

			disposed = true;
		}

		// Implement the Initialize method to get publication 
		// and subscription information.
		public override void Initialize(
			string publisher, 
			string subscriber, 
			string distributor, 
			string publisherDB, 
			string subscriberDB, 
			string articleName)
		{
			SqlConnectionStringBuilder pubString = new SqlConnectionStringBuilder();
			pubString.InitialCatalog = publisherDB;
			pubString.DataSource = publisher;
			pubString.IntegratedSecurity = true;
			
			// Create a connection to the Publisher.
			connection = new SqlConnection(pubString.ToString());

			try
			{
				// Open the connection to the Publisher.
				connection.Open();
			}
			catch (Exception ex)
			{
				throw new ApplicationException(Properties.Resources.PublisherConnectFailure,ex);
			}
		}

		// Implement the InsertHandler method to check inventory on insert.
		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
		public override ActionOnDataChange InsertHandler(
			SourceIdentifier insertSource,
			DataSet insertedDataSet,
            ref DataSet customDataSet,
            ref int historyLogLevel,
            ref string historyLogMessage)
		{
			if (insertSource == SourceIdentifier.SourceIsSubscriber)
			{
				// Get the the product ID and quantity for this row. 
				int productID
					= Convert.ToInt32(insertedDataSet.Tables[0].Rows[0].ItemArray[4],
					System.Globalization.CultureInfo.InvariantCulture);
				int orderQuantity
					= Convert.ToInt32(insertedDataSet.Tables[0].Rows[0].ItemArray[3],
					System.Globalization.CultureInfo.InvariantCulture);
				int salesOrderID
					= Convert.ToInt32(insertedDataSet.Tables[0].Rows[0].ItemArray[0],
					System.Globalization.CultureInfo.InvariantCulture);

				// Check the inventory for this item.
				checkInventoryQuery
					= new SqlCommand(checkInventoryProcedure,
					connection);
				checkInventoryQuery.CommandType = CommandType.StoredProcedure;
				checkInventoryQuery.Parameters.AddWithValue(@"@ProductID", productID);
                checkInventoryQuery.Parameters.AddWithValue(@"@SalesOrderID", salesOrderID);
                checkInventoryQuery.Parameters.AddWithValue(@"@OrderQuantity", orderQuantity);

				try
				{
                    Object logMessage = checkInventoryQuery.ExecuteScalar();

                    // If a message is returned, write it to the log.
                    if (logMessage != null)
                    {
                        historyLogMessage = (string)logMessage;
                        historyLogLevel = 3;
					}
				}
				catch (Exception ex)
				{
					// Rethrow an exception or the Merge Agent will continue.
					throw new ApplicationException(Properties.Resources.ErrorCheckInventory,
ex);
				}
			}

			return ActionOnDataChange.AcceptData;
		}

		[System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1031:DoNotCatchGeneralExceptionTypes")]
		public override ActionOnDataChange UpdateHandler(
			SourceIdentifier updateSource,
			DataSet updatedDataSet,
            ref DataSet customDataSet,
            ref int historyLogLevel,
            ref string historyLogMessage)
		{
			if (updateSource == SourceIdentifier.SourceIsSubscriber)
			{
                // Get the the product ID and quantity for this row. 
                int productID
                    = Convert.ToInt32(updatedDataSet.Tables[0].Rows[0].ItemArray[4],
                    System.Globalization.CultureInfo.InvariantCulture);
                int orderQuantity
                    = Convert.ToInt32(updatedDataSet.Tables[0].Rows[0].ItemArray[3],
                    System.Globalization.CultureInfo.InvariantCulture);
                int salesOrderID
                    = Convert.ToInt32(updatedDataSet.Tables[0].Rows[0].ItemArray[0],
                    System.Globalization.CultureInfo.InvariantCulture);

                // Check the inventory for this item.
                checkInventoryQuery
                    = new SqlCommand(checkInventoryProcedure,
                    connection);
                checkInventoryQuery.CommandType = CommandType.StoredProcedure;
                checkInventoryQuery.Parameters.AddWithValue(@"@ProductID", productID);
                checkInventoryQuery.Parameters.AddWithValue(@"@SalesOrderID", salesOrderID);
                checkInventoryQuery.Parameters.AddWithValue(@"@OrderQuantity", orderQuantity);

                try
                {
                    Object logMessage = checkInventoryQuery.ExecuteScalar();

                    // If a message is returned, write it to the log.
                    if (logMessage != null)
                    {
                        historyLogMessage = (string)logMessage;
                        historyLogLevel = 3;
                    }
				}
				catch (Exception ex)
				{
					// Rethrow exception or the Merge Agent will continue.
					throw new ApplicationException(Properties.Resources.ErrorCheckInventory,ex);
				}
			}

			return ActionOnDataChange.AcceptData;
		}

		public override ChangeStates HandledChangeStates
		{
			get
			{
				return ChangeStates.SubscriberInserts
					| ChangeStates.SubscriberUpdates;
			}
		}
	}
}
