using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppReservasULACIT.Controllers;
using AppReservasULACIT.Models;

namespace AppReservasULACIT
{
    public partial class Registrar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtNombre_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnMostrarCal_Click(object sender, EventArgs e)
        {
            calFechaNac.Visible = true;
        }

        protected void calFechaNac_SelectionChanged(object sender, EventArgs e)
        {
            calFechaNac.Visible = false;
        }

        async protected void brnRegistrar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario()
            {
                USU_NOMBRE = txtNombre.Text,
                USU_IDENTIFICACION = txtIdentificacion.Text,
                USU_EMAIL = txtEmail.Text,
                USU_ESTADO = "A",
                USU_FEC_NAC = calFechaNac.SelectedDate,
                USU_TELEFONO = txtTelefono.Text,
                USU_PASSWORD = txtPassword.Text
            };
            UsuarioManager usuarioManager = new UsuarioManager();

            Usuario usuarioRegistrado = await usuarioManager.Registrar(usuario);

            if (!string.IsNullOrEmpty(usuarioRegistrado.USU_NOMBRE))
                Response.Redirect("Login.aspx");
            else
            {
                lblResultado.Text = "No se registro el usuario";
                lblResultado.ForeColor = Color.Maroon;
                lblResultado.Visible = true;

            }
        }
    }
}