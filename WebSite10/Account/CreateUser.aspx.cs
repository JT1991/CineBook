using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Default2 : System.Web.UI.Page

{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CreateUser_OnClick(object sender, EventArgs e)
   {
       MembershipCreateStatus status;
       string passwordQuestion = "";
       string passwordAnswer = "";

       if (Membership.RequiresQuestionAndAnswer)
       {
           passwordQuestion = PasswordQuestionTextbox.Text;
           passwordAnswer = PasswordAnswerTextbox.Text;
       }

       try
       {
           MembershipUser newUser = Membership.CreateUser(UsernameTextbox.Text, PasswordTextbox.Text,
                                                          EmailTextbox.Text, passwordQuestion,
                                                          passwordAnswer, true, out status);
           if (newUser == null)
           {
               Msg.Text = GetErrorMessage(status);
           }
           else
           {

               Roles.AddUserToRole(UsernameTextbox.Text, "customer");
               Response.Redirect("Login.aspx");
           }
       }
       catch
       {
           Msg.Text = "An exception occurred creating the user.";
       }
   }

    public string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Username already exists. Please enter a different user name.";

            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that e-mail address already exists. Please enter a different e-mail address.";

            case MembershipCreateStatus.InvalidPassword:
                return "The password provided is invalid. Please enter a valid password value.";

            case MembershipCreateStatus.InvalidEmail:
                return "The e-mail address provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidAnswer:
                return "The password retrieval answer provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidQuestion:
                return "The password retrieval question provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.InvalidUserName:
                return "The user name provided is invalid. Please check the value and try again.";

            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
        }
}
    }

