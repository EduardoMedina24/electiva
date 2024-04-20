<%-- 
    Document   : retirar
    Created on : 19/04/2024, 08:37:15 PM
    Author     : SSD
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Retirar Dinero</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="css/retirarcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
        <%
// Obtener el saldo a retirar del formulario
String saldoRetirarStr = request.getParameter("saldoRetirar");
double saldoRetirar = Double.parseDouble(saldoRetirarStr);

// Obtener el saldo actual del jugador desde la sesión
Double saldoActual = (Double) session.getAttribute("saldoActual");

// Verificar si saldoActual es null y, si lo es, establecerlo en 0
if (saldoActual == null) {
    saldoActual = 0.0;
}

// Restar el saldo a retirar del saldo actual
saldoActual -= saldoRetirar;
saldoActual = 0.0;

// Actualizar el saldo actual en la sesión
session.setAttribute("saldoActual", saldoActual);
%>


<h1>Felicidades</h1>
<p>Has retirado $<%= saldoRetirarStr %> con éxito.</p>
<p>Tu saldo actual es: $<%= saldoActual %></p>

<a href="index.jsp">Volver al inicio</a>

    </div>


</body>
</html>

