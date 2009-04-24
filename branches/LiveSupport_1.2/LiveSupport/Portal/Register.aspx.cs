﻿using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using LiveSupport.BLL;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        CreateUserWizard wiz = sender as CreateUserWizard;
        AccountsManager.Provider.CreateAccount(wiz.UserName);
    }
}
