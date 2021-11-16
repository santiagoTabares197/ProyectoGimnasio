using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace Cdatos
{
    public class conexion
    {
        public SqlConnection conectar(string CNX)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationSettings.AppSettings[CNX].ToString());
                conn.Open();
                return conn;


            }
            catch (Exception err)
            {
                throw new Exception(err.Message);
            }
        }
    }
}
