using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Items : System.Web.UI.Page
{
    
    ///<summary>
    /// Fills the TreeView Control if not a postback
    /// On postbacks: Updates the TreeView to selected category
    /// and displays EITHER: CategoryPanel if the currently selected 
    /// category has child categories; OR: ItemsPanel if the currently 
    /// selected category doesn't have chile categories.
    /// Selected category is determined from query string
    ///</summary>
    protected void Page_Load()
    {
        if (!IsPostBack )
        {
            // populate the TreeView from scratch
            TreeViewCategories.Nodes.Clear();
            List<Category> rootCategories = Catalog.GetChildCategories(String.Empty); // get root level ones
            foreach (Category c in rootCategories)
            {
                TreeNode newNode = new TreeNode(c.Title, c.Id);
                newNode.SelectAction = TreeNodeSelectAction.SelectExpand;
                newNode.NavigateUrl = "Items.aspx?catId=" + c.Id;  
                TreeViewCategories.Nodes.Add(newNode);
                populateCategoryNode(newNode);
            }

            //  Restore the state of the treeview
            //
            if (Session["treeview"] != null)
            {
                bool[] nodeExpandedState = (bool[])Session["treeview"];
                int i=0;
                foreach (TreeNode n in TreeViewCategories.Nodes)
                {
                    if (nodeExpandedState[i++])
                        n.Expand();
                }
                Session.Remove("treeview");
            }
            
        }
        
        
        string categoryId = Request.QueryString["catId"];

        // update TreeView by expanding to the selected category node
        if (categoryId == null)
        {
            categoryId = String.Empty;
        }   
        else
        {
            TreeNode n = findNode(categoryId, TreeViewCategories.Nodes);
            LabelCurrentCategory.Text = n.Text; // page title
            while (n != null)
            {
                n.Expand();
                n = n.Parent;
            }
        }

        // now display the correct panel (categories or items)
        List<Category> categories = Catalog.GetChildCategories(categoryId); 
        if (categories.Count == 0) 
        {
            PanelItems.Visible = true;
            PanelCategories.Visible = false;
            GridViewItems.DataBind();
        }
        else
        {
            PanelItems.Visible = false;
            PanelCategories.Visible = true;
            GridViewCategories.DataBind();
        }
    }



    ///<summary>
    /// Saves the expanded state of the TreeView
    ///</summary>
    protected void Page_PreRender()
    {
        bool[] nodeExpandedState = new bool[TreeViewCategories.Nodes.Count];
        int i = 0;
        foreach (TreeNode node in TreeViewCategories.Nodes)
        {
            nodeExpandedState[i++] = node.Expanded.HasValue && node.Expanded.Value;
        }
        Session["treeview"] = nodeExpandedState;
    }

    ///<summary>
    /// Hides rows that have 'invisible' attribute set to false
    ///</summary>
    protected void GridViewItems_RowCreated(object source, GridViewRowEventArgs e)
    {
        if (e.Row == null) return;

        if (e.Row.RowType == DataControlRowType.DataRow && e.Row.DataItem != null)
        {
            bool visible = (bool)DataBinder.Eval(e.Row.DataItem, "Visible");
            e.Row.Visible = visible;
        }
    }


    ///<summary>
    /// Using DFS: find node in the collection 'nodes' that matches the 'value'
    ///</summary>
    private TreeNode findNode(string value, TreeNodeCollection nodes)
    {
        foreach (TreeNode n in nodes)
        {
            if (n.Value == value)
            {
                return n;
            }
            else // search n's child nodes
            {
                TreeNode nChild = findNode(value, n.ChildNodes);
                if (nChild != null)
                    return nChild;
            }
        }
        return null;
    }


    ///<summary>
    /// Recursively populates the node n with child category nodes.
    /// This function is recursive.
    ///</summary>
    private void populateCategoryNode(TreeNode n)
    {
        List<Category> categories = Catalog.GetChildCategories(n.Value);
        if (categories.Count == 0) // base case: leaf category 
        {
            return;
        }
        else //  recursive case : expand to show sub-categories
        {
            foreach (Category c in categories)
            {
                TreeNode newNode = new TreeNode(c.Title, c.Id);
                newNode.SelectAction = TreeNodeSelectAction.SelectExpand;
                newNode.NavigateUrl = "Items.aspx?catId=" + c.Id; 
                n.ChildNodes.Add(newNode);
                populateCategoryNode(newNode);
            }
        }
    }
}
