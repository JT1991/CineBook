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
using System.Data.SqlClient;

/// <summary>
/// Summary description for DAL
/// </summary>
public class DAL
{
	public DAL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    static SqlConnection con;
    static SqlCommand cmd;
    static DataSet ds;
    static SqlDataAdapter da;
    public static string GetConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
    }
    public static int ExecuteNonQuery(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters)
    {
        try
        {
            con = new SqlConnection(connectionString);
            cmd = new SqlCommand(commandText, con);
            cmd.CommandType = commandType;
            foreach (SqlParameter p in parameters)
            {
                if (p.Value == null)
                {
                }
                cmd.Parameters.Add(p);
            }
            con.Open();
            return cmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            throw new ArgumentException(ex.Message);
        }
        finally { con.Close(); }
    }
    public static DataSet ExecuteDataSet(string connectionString, CommandType commandType, string commandText, SqlParameter[] parameters)
    {
        try
        {
            con = new SqlConnection(connectionString);
            cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = commandText;
            cmd.CommandType = commandType;
            if (parameters == null)
            {
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
            else
            {
                foreach (SqlParameter p in parameters)
                {
                    if ((p.Direction == ParameterDirection.InputOutput) && (p.Value == null))
                    {
                    }
                    //if (p.Value != null)
                    //{
                    cmd.Parameters.Add(p);
                    //}
                }
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                return ds;
            }
        }
        catch (SqlException ex)
        {
            throw new ArgumentException(ex.Message);
        }
    }   
}
