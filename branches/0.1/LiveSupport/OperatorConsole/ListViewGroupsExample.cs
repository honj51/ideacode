﻿using System;
using System.Collections;
using System.Windows.Forms;

namespace VisualAsterisk.Test.Temp
{    
    public class ListViewGroupsExample : Form
    {
        private ListView lstVisitors;

        // Determine whether Windows XP or a later
        // operating system is present.
       // private bool isRunningXPOrLater =
         //   OSFeature.Feature.IsPresent(OSFeature.Themes);

        // Declare a Hashtable array in which to store the groups.
        private Hashtable[] groupTables;

        // Declare a variable to store the current grouping column.
        int groupColumn = 0;

        public ListViewGroupsExample()
        {
            // Initialize lstVisitors.
            lstVisitors = new ListView();
            lstVisitors.Dock = DockStyle.Fill;
            lstVisitors.View = View.Details;
            lstVisitors.Sorting = SortOrder.Ascending;

            // Create and initialize column headers for lstVisitors.
            ColumnHeader columnHeader0 = new ColumnHeader();
            columnHeader0.Text = "Title";
            columnHeader0.Width = -1;
            ColumnHeader columnHeader1 = new ColumnHeader();
            columnHeader1.Text = "Author";
            columnHeader1.Width = -1;
            ColumnHeader columnHeader2 = new ColumnHeader();
            columnHeader2.Text = "Year";
            columnHeader2.Width = -1;

            // Add the column headers to lstVisitors.
            lstVisitors.Columns.AddRange(new ColumnHeader[] { columnHeader0, columnHeader1, columnHeader2 });

            // Add a handler for the ColumnClick event.
            lstVisitors.ColumnClick +=
                new ColumnClickEventHandler(myListView_ColumnClick);

            // Create items and add them to lstVisitors.
            ListViewItem item0 = new ListViewItem(new string[] 
            {"Programming Windows", 
            "Petzold, Charles", 
            "1998"});
            ListViewItem item1 = new ListViewItem(new string[] 
            {"Code: The Hidden Language of Computer Hardware and Software", 
            "Petzold, Charles", 
            "2000"});
            ListViewItem item2 = new ListViewItem(new string[] 
            {"Programming Windows with C#", 
            "Petzold, Charles", 
            "2001"});
            ListViewItem item3 = new ListViewItem(new string[] 
            {"Coding Techniques for Microsoft Visual Basic .NET", 
            "Connell, John", 
            "2001"});
            ListViewItem item4 = new ListViewItem(new string[] 
            {"C# for Java Developers", 
            "Jones, Allen & Freeman, Adam", 
            "2002"});
            ListViewItem item5 = new ListViewItem(new string[] 
            {"Microsoft .NET XML Web Services Step by Step", 
            "Jones, Allen & Freeman, Adam", 
            "2002"});
            lstVisitors.Items.AddRange(
                new ListViewItem[] { item0, item1, item2, item3, item4, item5 });

           // if (isRunningXPOrLater)
          //  {
                // Create the groupsTable array and populate it with one 
                // hash table for each column.
                groupTables = new Hashtable[lstVisitors.Columns.Count];
                for (int column = 0; column < lstVisitors.Columns.Count; column++)
                {
                    // Create a hash table containing all the groups 
                    // needed for a single column.
                    groupTables[column] = CreateGroupsTable(column);
                }

                // Start with the groups created for the Title column.
                SetGroups(0);
           // }

            // Initialize the form.
            this.Controls.Add(lstVisitors);
            this.Size = new System.Drawing.Size(550, 330);
            this.Text = "ListView Groups Example";
        }

        // Groups the items using the groups created for the clicked 
        // column.
        private void myListView_ColumnClick(
            object sender, ColumnClickEventArgs e)
        {
            // Set the sort order to ascending when changing
            // column groups; otherwise, reverse the sort order.
            if (lstVisitors.Sorting == SortOrder.Descending ||
                (//isRunningXPOrLater && 
                (e.Column != groupColumn)))
            {
                lstVisitors.Sorting = SortOrder.Ascending;
            }
            else
            {
                lstVisitors.Sorting = SortOrder.Descending;
            }
            groupColumn = e.Column;

            // Set the groups to those created for the clicked column.
           // if (isRunningXPOrLater)
            //{
                SetGroups(e.Column);
            //}
        }

        // Sets lstVisitors to the groups created for the specified column.
        private void SetGroups(int column)
        {
            // Remove the current groups.
            lstVisitors.Groups.Clear();

            // Retrieve the hash table corresponding to the column.
            Hashtable groups = (Hashtable)groupTables[column];

            // Copy the groups for the column to an array.
            ListViewGroup[] groupsArray = new ListViewGroup[groups.Count];
            groups.Values.CopyTo(groupsArray, 0);

            // Sort the groups and add them to lstVisitors.
            Array.Sort(groupsArray, new ListViewGroupSorter(lstVisitors.Sorting));
            lstVisitors.Groups.AddRange(groupsArray);

            // Iterate through the items in lstVisitors, assigning each 
            // one to the appropriate group.
            foreach (ListViewItem item in lstVisitors.Items)
            {
                // Retrieve the subitem text corresponding to the column.
                string subItemText = item.SubItems[column].Text;

                // For the Title column, use only the first letter.
                if (column == 0)
                {
                    subItemText = subItemText.Substring(0, 1);
                }

                // Assign the item to the matching group.
                item.Group = (ListViewGroup)groups[subItemText];
            }
        }

        // Creates a Hashtable object with one entry for each unique
        // subitem value (or initial letter for the parent item)
        // in the specified column.
        private Hashtable CreateGroupsTable(int column)
        {
            // Create a Hashtable object.
            Hashtable groups = new Hashtable();

            // Iterate through the items in lstVisitors.
            foreach (ListViewItem item in lstVisitors.Items)
            {
                // Retrieve the text value for the column.
                string subItemText = item.SubItems[column].Text;

                // Use the initial letter instead if it is the first column.
               if (column == 0)
                {
                    subItemText = subItemText.Substring(0, 1);
                }

                // If the groups table does not already contain a group
                // for the subItemText value, add a new group using the 
                // subItemText value for the group header and Hashtable key.
                if (!groups.Contains(subItemText))
                {
                    groups.Add(subItemText, new ListViewGroup(subItemText,
                        HorizontalAlignment.Left));
                }
            }

            // Return the Hashtable object.
            return groups;
        }

        // Sorts ListViewGroup objects by header value.
        private class ListViewGroupSorter : IComparer
        {
            private SortOrder order;

            // Stores the sort order.
            public ListViewGroupSorter(SortOrder theOrder)
            {
                order = theOrder;
            }

            // Compares the groups by header value, using the saved sort
            // order to return the correct value.
            public int Compare(object x, object y)
            {
                int result = String.Compare(
                    ((ListViewGroup)x).Header,
                    ((ListViewGroup)y).Header
                );
                if (order == SortOrder.Ascending)
                {
                    return result;
                }
                else
                {
                    return -result;
                }
            }
        }

    }
}
