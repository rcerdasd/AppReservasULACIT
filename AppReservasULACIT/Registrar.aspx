<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="Registrar.aspx.cs" Inherits="AppReservasULACIT.Registrar" UnobtrusiveValidationMode="None" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registro de usuario</title>
    <style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 3px solid #f1f1f1;}

input[type=text], input[type=password] {
width: 100%;
padding: 12px 20px;
margin: 8px 0;
display: inline-block;
border: 1px solid #ccc;
box-sizing: border-box;
}

.button {
background-color: #243054;
color: white;
padding: 14px 20px;
margin: 8px 0;
border: none;
cursor: pointer;
width: 100%;
}

button:hover {
opacity: 0.8;
}

.cancelbtn {
width: 100%;
padding: 10px 18px;
color: white;
background-color: #898989;
}

.imgcontainer {
text-align: center;
margin: 24px 0 12px 0;
}

img.avatar {
width: 10%;
border-radius: 10%;
}

/* Clear floats */
.clearfix::after {
content: "";
clear: both;
display: table;
}

.container {
padding: 16px;
}

span.psw {
float: right;
padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
span.psw {
display: block;
float: none;
text-align: left;
}
.cancelbtn {
width: 100%;
}
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Registro</h1>
            <p>Complete el siguiente formulario para registrarse</p>
            <!-- Nombre -->
            <asp:TextBox runat="server" Placeholder="Ingrese su nombre" id="txtNombre" CssClass="form-control" OnTextChanged="txtNombre_TextChanged"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre" runat="server" ControlToValidate="txtNombre" CssClass="text-danger" ErrorMessage="El nombre es obligatorio" />
            
            <!-- Identificacion -->
            <asp:TextBox ID="txtIdentificacion" runat="server" Placeholder="Ingrese su identificacion" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorId" runat="server" ErrorMessage="La identificacion es obligatoria" ControlToValidate="txtIdentificacion" />
            
            <!-- Email -->
            <asp:TextBox ID="txtEmail" runat="server" Placeholder="Ingrese su correo electronico" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ErrorMessage="El correo electronico es obligatorio" ControlToValidate="txtEmail" />
            
            <!-- Telefono -->
            <asp:TextBox ID="txtTelefono" runat="server" Placeholder="Ingrese su telefono" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefono" runat="server" ErrorMessage="El telefono es obligatorio" ControlToValidate="txtTelefono" />
            
            <!-- Fecha nacimiento -->
            <asp:Label ID="lblFecNac" runat="server" Text="Seleccione su fecha de nacimiento"></asp:Label>
            <br />
            <asp:Button ID="btnMostrarCal" runat="server" Text="Mostrar calendario" OnClick="btnMostrarCal_Click" CausesValidation="False" />
            <br />
            <asp:Calendar Visible="false" ID="calFechaNac" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="calFechaNac_SelectionChanged" >
                <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                <TodayDayStyle BackColor="#CCCCCC" />
            </asp:Calendar>

            <!-- Password -->
            <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Placeholder="Ingrese su password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="El password es obligatorio" ControlToValidate="txtPassword" />
            
            <!-- Confirmar password -->
            <asp:TextBox TextMode="Password" ID="txtPasswordConfir" runat="server" Placeholder="Confirme su password" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassConf" runat="server" ErrorMessage="La confirmacion es necesaria" ControlToValidate="txtPasswordConfir" />
            <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ErrorMessage="Los passwords no coinciden" ControlToValidate="txtPassword" ControlToCompare="txtPasswordConfir"></asp:CompareValidator>

        <br />
            <br />
            <asp:Button ID="brnRegistrar" runat="server" Text="Registrar" CssClass="button" OnClick="brnRegistrar_Click"/>
            <asp:Label Visible="false" ID="lblResultado" runat="server" Text="Label"></asp:Label>
        </div>
        
    </form>
</body>
</html>
