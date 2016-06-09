using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BOL
/// </summary>
public class BOL
{
	public BOL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int AddScreen(string screenName)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ScreenName", screenName);
            return DAL.ExecuteNonQuery(DAL.GetConnectionString(),
                                  CommandType.StoredProcedure, "sp_AddScreen", p);
        }
        catch (ArgumentException ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }

    public DataSet GetScreens()
    {
        try
        {
            SqlParameter[] p = new SqlParameter[0];
            return DAL.ExecuteDataSet(DAL.GetConnectionString(),
                               CommandType.StoredProcedure, "sp_GetScreens", p);
        }
        catch (Exception)
        {

            throw;
        }
    }

    public string AddScreenLayout(string rowName, int screenId,  string one, string two, string three, string four, string five, string six, string seven, string eight, string nine, string ten, string eleven, string twelve, string thirteen, string fourteen, string fifteen, string sixteen, string seventeen, string eighteen, string nineteen, string twenty, string twentyone, string twentytwo, string twentythree, string twentyfour, string twentyfive, string twentysix, string twentyseven, string twentyeight, string twentynine, string thirty)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[33];
            p[0] = new SqlParameter("@RowName", rowName);
            p[1] = new SqlParameter("@ScreenId", screenId);
            p[3] = new SqlParameter("@1", one);
            p[4] = new SqlParameter("@2", two);
            p[5] = new SqlParameter("@3", three);
            p[6] = new SqlParameter("@4", four);
            p[7] = new SqlParameter("@5", five);
            p[8] = new SqlParameter("@6", six);
            p[9] = new SqlParameter("@7", seven);
            p[10] = new SqlParameter("@8", eight);
            p[11] = new SqlParameter("@9", nine);
            p[12] = new SqlParameter("@10", ten);
            p[13] = new SqlParameter("@11", eleven);
            p[14] = new SqlParameter("@12", twelve);
            p[15] = new SqlParameter("@13", thirteen);
            p[16] = new SqlParameter("@14", fourteen);
            p[17] = new SqlParameter("@15", fifteen);
            p[18] = new SqlParameter("@16", sixteen);
            p[19] = new SqlParameter("@17", seventeen);
            p[20] = new SqlParameter("@18", eighteen);
            p[21] = new SqlParameter("@19", nineteen);
            p[22] = new SqlParameter("@20", twenty);
            p[23] = new SqlParameter("@21", twentyone);
            p[24] = new SqlParameter("@22", twentytwo);
            p[25] = new SqlParameter("@23", twentythree);
            p[26] = new SqlParameter("@24", twentyfour);
            p[27] = new SqlParameter("@25", twentyfive);
            p[28] = new SqlParameter("@26", twentysix);
            p[29] = new SqlParameter("@27", twentyseven);
            p[30] = new SqlParameter("@28", twentyeight);
            p[31] = new SqlParameter("@29", twentynine);
            p[32] = new SqlParameter("@30", thirty);
            p[2] = new SqlParameter("@Message", SqlDbType.VarChar, 150);
            p[2].Direction = ParameterDirection.Output;
            DAL.ExecuteDataSet(DAL.GetConnectionString(), CommandType.StoredProcedure, "sp_AddScreenLayout", p);
            return Convert.ToString(p[2].Value);
        }
        catch (ArgumentException ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
    public DataSet GetScreenLayout(int screenId)
    {
        try
        {
            SqlParameter[] p = new SqlParameter[1];
            p[0] = new SqlParameter("@ScreenId", screenId);
            return DAL.ExecuteDataSet(DAL.GetConnectionString(),
                               CommandType.StoredProcedure, "sp_GetScreenLayout", p);
        }
        catch (ArgumentException ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }
}
