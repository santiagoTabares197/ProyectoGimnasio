using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CEntidad;



namespace Cdatos
{
    public class CDgym
    {
        conexion oconexion = new conexion();
        SqlCommand ocmd = new SqlCommand();

        public bool GuardarRutina(CEgym ogym)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("Gimnasio");
                ocmd.CommandText = "GuardarRutina";
                ocmd.Parameters.Add("@Id",ogym.Id1);
                ocmd.Parameters.Add("@Musculos",ogym.Musculos1);
                ocmd.Parameters.Add("@Ejercicios",ogym.Rutina1);
                ocmd.Parameters.Add("@Repeticiones",ogym.Repeticiones1);
                ocmd.Parameters.Add("@Series",ogym.Series1);
                ocmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception err)
            {
                throw new Exception(err.Message);
            }

           
              
        }
        public DataSet ConsultarRutina(CEgym ogym)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("Gimnasio");
                ocmd.CommandText = "ConsultarRutina";
                ocmd.Parameters.Add("@Id",ogym.Id1);
                SqlDataAdapter da = new SqlDataAdapter(ocmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                return ds;
            }catch(Exception err)
            {
                throw new Exception(err.Message);
            }

        }
        public bool EliminarRutina(CEgym ogym)
        {
            try
            {
                ocmd.CommandType = CommandType.StoredProcedure;
                ocmd.Connection = oconexion.conectar("Gimnasio");
                ocmd.CommandText = "EliminarRutina";
                ocmd.Parameters.Add("@Id",ogym.Id1);
                ocmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception err)
            {
                throw new Exception(err.Message);
            }

        }

    }
    }

