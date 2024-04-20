<%-- 
    Document   : index
    Created on : 4/04/2024, 08:44:16 PM
    Author     : ALUMNO-
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/indexcss.css" rel="stylesheet" type="text/css"/>

    </head>
 <body>

    <div class="container">

        <h1>Juego de Azar</h1>

        <%
        // Obtener el saldo actual del jugador desde la sesión
        Double saldoActual = (Double) session.getAttribute("saldoActual");

        // Si el saldoActual es nulo, establecerlo en 0
        if (saldoActual == null) {
            saldoActual = 0.0;
        }
        %>

        <p>Su saldo actual es: $<%= new DecimalFormat("#.##").format(saldoActual) %></p>

        <form action="resultado.jsp" method="post">
            <label for="cantidad">Agregar dinero:</label>
            <input type="number" id="cantidad" name="cantidad" required>
            <br>
            <button type="submit">Jugar</button>
        </form>

    </div>
</body>
</html>
