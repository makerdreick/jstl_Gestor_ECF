<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="pra_emergentes.modelo.Tarea" %>
<%@page import="pra_emergentes.modelo.GestorTareas" %>
<%
    if(session.getAttribute("agenda") == null){
        GestorTareas objeto1 = new GestorTareas();
        
        objeto1.insertarTarea(new Tarea(1,"Reunion con la startup Smicegg","Alta"));
        objeto1.insertarTarea(new Tarea(2,"Estudiar para el examen de sig","Alta"));
        objeto1.insertarTarea(new Tarea(3,"Trabajo grupal para SIS","Media"));
        objeto1.insertarTarea(new Tarea(4,"Equipar mi PC","Baja"));

        session.setAttribute("agenda", objeto1);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSTL -ECF</title>
    </head>
    <body>
        <h1>Lista de tareas</h1>
        <a href="Controller?op=nuevo">Nueva tarea</a>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Tarea</th>
                    <th>Prioridad</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${sessionScope.agenda.getLista()}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.tarea}</td>
                        <td>${item.prioridad}</td>
                        <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                        <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a></td>
                    </tr> 
                </c:forEach>
              
             
            </tbody>
        </table>


    </body>
</html>
