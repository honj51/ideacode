//-----------------------------------------------------------------------
//  This file is part of the Microsoft Code Samples.
// 
//  Copyright (C) Microsoft Corporation.  All rights reserved.
// 
//  This source code is intended only as a supplement to Microsoft
//  Development Tools and/or on-line documentation.  See these other
//  materials for detailed information regarding Microsoft code samples.
// 
//  THIS CODE AND INFORMATION ARE PROVIDED AS IS WITHOUT WARRANTY OF ANY
//  KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A
//  PARTICULAR PURPOSE.
//-----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace DBSiteAdmin
{
    public partial class AboutBoxSalesOrders : Form
    {
		public AboutBoxSalesOrders()
        {
            InitializeComponent();

			// Load the text from the resources file.
			rtbAboutText.Text = Properties.Resources.AboutDescription;
			lDisclaimerText.Text = Properties.Resources.AboutDisclaimer;
        }
    }
}