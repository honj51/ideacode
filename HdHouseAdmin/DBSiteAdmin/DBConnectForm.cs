using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using Microsoft.SqlServer.Replication;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.MessageBox;
using Microsoft.SqlServer.Management.Smo.Wmi;

namespace DBSiteAdmin
{
    public partial class DBConnectForm : Form
    {
        public ServerConnection Connection
        {
            get { return connection; }
        }

        ServerConnection connection;
        ManagedComputer localServer;

        public DBConnectForm()
        {
            InitializeComponent();
        }

        private void cbxLoginMode_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool enable = true;
            if (cbxLoginMode.SelectedIndex == 0)
            {
                enable = false;
            }

            txtName.Enabled = enable;
            txtPassword.Enabled = enable;
        }

        private void DBConnectForm_Load(object sender, EventArgs e)
        {
            cbxLoginMode.SelectedIndex = 0;

            // Get available local instance names.
            localServer = new ManagedComputer(Environment.MachineName);

            foreach (ServerInstance instance in localServer.ServerInstances)
            {
                // Display the default server instance as the machine name.
                string instanceName = (instance.Name == "MSSQLSERVER" ?
                    instanceName = Environment.MachineName :
                    instanceName = Environment.MachineName + "\\" + instance.Name);

                // Add the instance to the list.

                cbxDatabase.Items.Add(instanceName);
            }

            // Set to the first item to load available subscriptions.
            cbxDatabase.SelectedIndex = 0;
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            if (cbxLoginMode.SelectedIndex == 0)
            {
                connection = new ServerConnection(cbxDatabase.SelectedItem.ToString());
            }
            else
            {
                connection = new ServerConnection(cbxDatabase.SelectedItem.ToString(),txtName.Text,txtPassword.Text);
            }
            connection.Connect();
        }
    }
}
