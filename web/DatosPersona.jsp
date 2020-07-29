<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Persona</title>
        <link href="css/Estilosparatabla.css" rel="stylesheet" type="text/css"/>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idpersona;
            String s_nombre;
            String s_apellidos;
            String s_direccion;
            String s_telefono;
            String s_dni;
            String s_estado;
            
        %>
    </head>
    <body>
        <%
            try{
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();
                
                s_accion = request.getParameter("f_accion");
                s_idpersona = request.getParameter("f_idpersona");
                
                if(s_accion!=null && s_accion.equals("M1")){
                    consulta = "    select Nombre, Apellido, Dirección, Telefono, DNI, Estado  "
                                + " from persona "
                                + " where"
                                + " IdPersona = " + s_idpersona + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>
        <br>
        <form name="EditarPersonaForm" action="DatosPersona.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Editar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Apellido: </td>
                        <td><input type="text" name="f_apellidos" value="<% out.print(rs.getString(2)); %>" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Dirección: </td>
                        <td><input type="text" name="f_direccion" value="<% out.print(rs.getString(3)); %>" maxlength="40" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Telefono:</td>
                        <td><input type="text" name="f_telefono" value="<% out.print(rs.getString(4)); %>" maxlength="9" size="11"/></td>
                    </tr>
                    <tr>
                        <td>DNI: </td>
                        <td><input type="text" name="f_dni" value="<% out.print(rs.getString(5)); %>" maxlength="8" size="11"/></td>
                    </tr>
                    <tr>
                        <td>Estado: </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(6)); %>" maxlength="1" size="2"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            
                            <button type="submit" value="" name="f_editar"><img  src="imagenes/guardar.png" width="60"></button>
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idpersona" value="<% out.print(s_idpersona); %>" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <%
                }
            }else{
        %>
        <form name="AgregarPersonaForm" action="DatosPersona.jsp" method="GET">
            <table border="0" align="center">
                <thead>
                    <tr>
                        <th colspan="2">Agregar Persona</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" name="f_nombre" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Apellido:</td>
                        <td><input type="text" name="f_apellidos" value="" maxlength="30" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Dirección:</td>
                        <td><input type="text" name="f_direccion" value="" maxlength="40" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Telefono:</td>
                        <td><input type="text" name="f_telefono" value="" maxlength="9" size="11"/></td>
                    </tr>
                    <tr>
                        <td>DNI:</td>
                        <td><input type="text" name="f_dni" value="" maxlength="8" size="11"/></td>
                    </tr>
                    <tr>
                        <td>Estado:</td>
                        <td><input type="text" name="f_estado" value="" maxlength="1" size="1"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <button type="submit" value="" name="f_agregar"><img  src="imagenes/guardar.png" width="60"></button>
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>
                    
                </tbody>
            </table>
        </form>
        <%
        }
        %>
        <br>
        <table class="general" border="1" cellspacing="0" cellpadding="" align = "center">
            <thead>
                <tr>
                    <th colspan="9">Datos Persona</th>
                </tr>
                <tr>
                    <th>N°</th>
                    <th>Nombre</th>
                    <th>Apellidos</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>DNI</th>
                    <th>Estado</th>
                    <th colspan="2">Accion</th>
                    
                </tr>
            </thead>

        <%
            
                
                if (s_accion!=null) {
                    if (s_accion.equals("E")) {
                        consulta =  "   delete from persona "
                                    + " where "
                                    + " IdPersona = " + s_idpersona + "; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                            
                    }else if (s_accion.equals("C")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_apellidos = request.getParameter("f_apellidos");
                        s_direccion = request.getParameter("f_direccion");
                        s_telefono = request.getParameter("f_telefono");
                        s_dni = request.getParameter("f_dni");
                        s_estado = request.getParameter("f_estado");
                        consulta =  "   insert into "
                                    + " persona(Nombre, Apellido, Dirección, Telefono, DNI, Estado ) "
                                    + " values ('"+ s_nombre +"','"+ s_apellidos +"','"+ s_direccion +"','"+ s_telefono +"','"+ s_dni+"','"+ s_estado +"')";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }else if (s_accion.equals("M2")) {
                        s_nombre = request.getParameter("f_nombre");
                        s_apellidos = request.getParameter("f_apellidos");
                        s_direccion = request.getParameter("f_direccion");
                        s_telefono = request.getParameter("f_telefono");
                        s_dni = request.getParameter("f_dni");
                        s_estado = request.getParameter("f_estado");
                        consulta = " update  persona  "
                                + "  set  "
                                + "  Nombre = '"+ s_nombre +"',"
                                + "  Apellido = '"+ s_apellidos +"',"
                                + "  Dirección = '"+ s_direccion +"', "
                                + "  Telefono = '"+ s_telefono +"', "
                                + "  DNI = '"+ s_dni +"', "
                                + "  Estado = '"+ s_estado +"' "
                                + "  where "
                                + "  IdPersona = "+ s_idpersona +"; ";
                        //out.print(consulta);
                        pst = cn.prepareStatement(consulta);
                        pst.executeUpdate();
                    }
                }
                consulta= " Select IdPersona, Nombre, Apellido, Dirección, Telefono, DNI, Estado "
                        + " from persona ";
                //out.print(consulta);
                pst = cn.prepareStatement(consulta);
                rs = pst.executeQuery();
                int num = 0;
                String ide;
                while (rs.next()) {  
                    ide = rs.getString(1);
                    num++;

                    %>
                    <tbody>
                       <tr>
                        <td><%out.print(num);%></td>
                        <td><%out.print(rs.getString(2));%></td>
                        <td><%out.print(rs.getString(3));%></td>
                        <td><%out.print(rs.getString(4));%></td>
                        <td><%out.print(rs.getString(5));%></td>
                        <td><%out.print(rs.getString(6));%></td>
                        <td><%out.print(rs.getString(7));%></td>
                        <td><a href="DatosPersona.jsp?f_accion=E&f_idpersona=<%out.print(ide);%>" ><img  src="imagenes/eliminar.png" width="20"></a></td>
                        <td><a href="DatosPersona.jsp?f_accion=M1&f_idpersona=<%out.print(ide);%>" ><img  src="imagenes/editar.png" width="30"></a></td>

                    </tr>                    
                    <%
                    }
            }catch(Exception e){
                out.print("Error SQL");
            }
        
        %> 
                    </tbody>
                    
        </table>
        <br>
        <div align="center">
            <a href="menu.jsp">Menu</a>
        </div>
                    
        
    </body>
</html>
