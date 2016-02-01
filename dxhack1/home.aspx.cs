using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var inStock=9;
        using (SqlConnection connection = new SqlConnection("Server=tcp:uxtmvjthdj.database.windows.net,1433;Database=ASADBoutput;User ID=sagar@uxtmvjthdj;Password=Dxhack!123;Trusted_Connection=False;Encrypt=True;Connection Timeout=30; "))
        {
            SqlCommand command = new SqlCommand();
            command.CommandText = @"SELECT Light FROM asaoutput";
            command.Connection = connection;
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();
            try
            {
                while (reader.Read())
                {
                    inStock = reader.GetInt32(0);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                reader.Close();
            }
        }

        if (inStock==0)
        txtValueA.Text = "No";
        else if(inStock==1)
        txtValueA.Text = "Yes";
        else
        txtValueA.Text = "Data unavailable";
    }
}