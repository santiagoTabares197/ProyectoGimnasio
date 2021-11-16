using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Cdatos;
using CEntidad;
using System.Data;

namespace CNegocio
{
    public class CNgym
    {
        CDgym odgym = new CDgym();
        public bool GuardarRutina(CEgym oentgym)
        {
            return odgym.GuardarRutina(oentgym);
        }
        public bool EliminarRutina(CEgym oentgym)
        {
            return odgym.EliminarRutina(oentgym);
        }
        public DataSet ConsultarRutina(CEgym oentgym)
        {
            return odgym.ConsultarRutina(oentgym);
        }
    }
}
