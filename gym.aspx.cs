using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CEntidad;
using CNegocio;
using System.Data;

namespace ProyectoGimnasio
{
    public partial class gym : System.Web.UI.Page
    {
        CNgym ONgym = new CNgym();
        CEgym OEgym = new CEgym();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TxtId_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnConsultar_Click(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            OEgym.Id1 = Convert.ToInt32(TxtId.Text);
            ds = ONgym.ConsultarRutina(OEgym);
            if (ds.Tables[0].Rows.Count == 0)
            {
                lblRespuesta.Text = "RUTINA NO ENCONTRADA";
                Response.Redirect("gym.aspx");
            }
            else
            {
                TxtId.Text = ds.Tables[0].Rows[0]["Id"].ToString();
                TxtM.Text = ds.Tables[0].Rows[0]["Musculos"].ToString();
                TxtR.Text = ds.Tables[0].Rows[0]["Ejercicios"].ToString();
                TxtReps.Text = ds.Tables[0].Rows[0]["Repeticiones"].ToString();
                TxtS.Text = ds.Tables[0].Rows[0]["Series"].ToString();
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            OEgym.Id1 = Convert.ToInt32(TxtId.Text);
            OEgym.Musculos1 = Convert.ToString(TxtM.Text);
            OEgym.Rutina1 = Convert.ToString(TxtR.Text);
            OEgym.Repeticiones1 = Convert.ToInt32(TxtReps.Text);
            OEgym.Series1 = Convert.ToInt32(TxtS.Text);
            if (ONgym.GuardarRutina(OEgym))
            {
                lblRespuesta.Text = "Rutina Guardada con exito";
                Response.Redirect("gym.aspx");
            }
            else
            {
                lblRespuesta.Text = "¡Ups!, ha ocurrido un error al guardar";
            }
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            OEgym.Id1 = Convert.ToInt32(TxtId.Text);
            if (ONgym.EliminarRutina(OEgym))
            {
                lblRespuesta.Text = "Rutina eliminada ";
                Response.Redirect("gym.aspx");
            }
            else
            {
                lblRespuesta.Text = "¡Ups!, ha ocurrido un error al eliminar";
            }
        }
    }
}