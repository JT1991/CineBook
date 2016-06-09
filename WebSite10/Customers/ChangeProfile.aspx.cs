using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Profile.IsAnonymous == false)
            {
                if (Profile.FirstName != "" && Profile.LastName != "")
                {
                    txtFName.Text = Profile.FirstName;
                    txtLName.Text = Profile.LastName;
                    txtDOB.Text = Convert.ToString(Profile.DateOfBirth);
                    pnlDisplay.Visible = true;
                    lblMessage.Text = "Welcome back " + Profile.FirstName;
                }
                else
                {
                    pnlDisplay.Visible = true;
                    lblMessage.Text = "Welcome. Please enter details";
                }
            }
            else
            {
                this.pnlDisplay.Visible = false;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
    }

    protected void btnSave_Click1(object sender, EventArgs e)
    {

        Profile.FirstName = txtFName.Text;
        Profile.LastName = txtLName.Text;
        Profile.DateOfBirth = Convert.ToDateTime(txtDOB.Text);
        Profile.Save();
        lblMessage.Text = "Welcome " + txtFName.Text;
        lblMessage.Visible = true;
        pnlDisplay.Visible = false;
    }
}
