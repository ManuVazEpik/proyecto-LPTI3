<%-- 
    Document   : SesionAdmin
    Created on : 5/01/2021, 07:00:00 PM
    Author     : bocal
--%>

<%@page import="Clases.Cuentas"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
String priv=(String)sesionOk.getAttribute("privilegio");
System.out.println("aqui va un nuevo sout   "+priv);
if (sesionOk.getAttribute("usuario") == null ) {
%>
<jsp:forward page="IniciarSesion.jsp">
<jsp:param name="error" value="Es obligatorio identificarse"/>
</jsp:forward>
<%
} else if("2".equals(priv)){
    response.sendRedirect("Sesion.jsp");
} else {
    usuario = (String)sesionOk.getAttribute("usuario");
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SesionAdmin</title>
    </head>
    <body>
        <h1>Sesion Administrador</h1>
        <h3>Cafeterias por autorizar</h3>
        <%
        Cuentas operC=new Cuentas();
        ArrayList<Cuentas> listaNoAut=operC.getCafeteriasNoAutorizadas();
        %>
        <table>
            <th>Id_caf</th>
            <th>Nombre_caf</th>
            <th>Direccion_caf</th>
            <th>Id Usuario</th>
            <th>Autorizar</th>
    <%
        for(Cuentas c:listaNoAut){
    %>
            <tr>
                <td><%=c.getId_caf()%></td>
                <td><%=c.getNom_caf()%></td>
                <td><%=c.getDir_caf()%></td>
                <td><%=c.getId_usu()%></td>
                <td><form action="Autorizar" method="POST">
                    <input type="hidden" name="id_usu" value="<%=c.getId_usu()%>"/>
                    <input type="submit" value="Autorizar"/>
                </form></td>
            </tr>
    <%
        }
    %>
        </table>
        
        <h3>Cafeterias Autorizadas</h3>
        <%
        ArrayList<Cuentas> listaAut=operC.getCafeteriasAutorizadas();
        %>
        <table>
            <th>Id_caf</th>
            <th>Nombre_caf</th>
            <th>Direccion_caf</th>
            <th>Id Usuario</th>
            <th>Eliminar</th>
    <%
        for(Cuentas c:listaAut){
    %>
            <tr>
                <td><%=c.getId_caf()%></td>
                <td><%=c.getNom_caf()%></td>
                <td><%=c.getDir_caf()%></td>
                <td><%=c.getId_usu()%></td>
                <td><form action="EliminarUsu" method="POST">
                    <input type="hidden" name="id" value="<%=c.getId_caf()%>"/>
                    <input type="hidden" name="tipo" value="3"/>
                    <input type="submit" value="Eliminar"/>
                </form></td>
            </tr>
    <%
        }
    %>
        </table>
        
        <h3>Cafeterias Autorizadas</h3>
        <%
        ArrayList<Cuentas> listaUsu=operC.getUsuarios();
        %>
        <table>
            <th>Id_usu</th>
            <th>Nombre_usu</th>
            <th>Appat_usu</th>
            <th>Apmat_usu</th>
            <th>Email</th>
            <th>Contraseña</th>
            <th>Telefono</th>
            <th>Eliminar</th>
    <%
        for(Cuentas c:listaUsu){
    %>
            <tr>
                <td><%=c.getId_usu()%></td>
                <td><%=c.getNom_usu()%></td>
                <td><%=c.getAppat_usu()%></td>
                <td><%=c.getApmat_usu()%></td>
                <td><%=c.getEmail_usu()%></td>
                <td><%=c.getPass_usu()%></td>
                <td><%=c.getTel_usu()%></td>
                <td><form action="EliminarUsu" method="POST">
                    <input type="hidden" name="id" value="<%=c.getId_usu()%>"/>
                    <input type="hidden" name="tipo" value="2"/>
                    <input type="submit" value="Eliminar"/>
                </form></td>
            </tr>
    <%
        }
    %>
        </table>
        
        <a href="CerrarSesion">Cerrar Sesion</a>
    </body>
</html>
