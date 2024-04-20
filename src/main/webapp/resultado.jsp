<%--Document   : resultado
    Created on : 4/04/2024, 08:46:22 PM
    Author     : ALUMNO-
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@ page import="java.util.Random" %>
    <%@ page import="java.text.DecimalFormat" %>
    <title>JSP Page</title>
    <style>
        .resultado-img {
            width: 50px;
            height: 40px;
        }
    </style>
    <link href="css/resultadocss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container">
     <h1>Resultado del Juego</h1>

<%
// Obtener el saldo actual del jugador desde la sesión
Double saldoActual = (Double) session.getAttribute("saldoActual");

// Si el saldoActual es nulo, establecerlo en 0
if (saldoActual == null) {
    saldoActual = 0.0;
    // Eliminar el atributo de saldoActual de la sesión
    session.removeAttribute("saldoActual");
}

// Obtener la cantidad de dinero ingresada por el jugador en este turno
String cantidadTurnoStr = request.getParameter("cantidad");



double cantidadTurno = 0.0; // Valor predeterminado en caso de que no se proporcione ninguna cantidad

if (cantidadTurnoStr != null && !cantidadTurnoStr.isEmpty()) {
    cantidadTurno = Double.parseDouble(cantidadTurnoStr);
    
    // Sumar la cantidad ingresada al saldo actual
    saldoActual = saldoActual + cantidadTurno;
}

Random random = new Random();
int numeroAleatorio = random.nextInt(100); // Genera un número entre 0 y 99

int resultado;

if (numeroAleatorio < 50) {
    resultado = 0; // 50% para el resultado 1
} else if (numeroAleatorio < 79) {
    resultado = 1; 
} else {
    resultado = 2; // 
}
// 0 para calavera, 1 para medio limón, 2 para gato chino
DecimalFormat df = new DecimalFormat("#.##");

String imagen = "";
String mensaje = "";

// Verificar el resultado del juego
if(resultado == 0) {
    double dinero =saldoActual + cantidadTurno;
// Calavera
    saldoActual = 0.0;
    imagen = "./img/calavera.jpg";
    mensaje = "¡Calavera! Has perdido todo tu dinero.";
} else if(resultado == 1) { // Medio limón
    saldoActual -= cantidadTurno / 2; // Resta la mitad de la cantidad apostada
    imagen = "./img/limon.jpg";
    mensaje = "¡Medio limón! Has perdido la mitad de tu dinero.";
} else { // Gato chino
    saldoActual += cantidadTurno; // La cantidad apostada se suma al saldo actual
    imagen = "./img/gato.jpg";
    mensaje = "¡Gato chino de la suerte! Has duplicado tu dinero.";
}
%>

<img class='resultado-img' src='<%= imagen %>' alt='Resultado del juego'>
<p><%= mensaje %></p>
<p>Tu saldo actual es: $<%= df.format(saldoActual) %></p>

<%-- Formulario para agregar más dinero --%>


<%-- Mostrar la opción de volver a jugar con el saldo actual solo si el saldo actual es mayor que cero --%>
<%
if (saldoActual > 0) {
%>
    <form action="resultado.jsp" method="post">
        <input type="hidden" name="cantidad" value="<%= saldoActual %>">
        <button type="submit">Volver a jugar con saldo actual</button>
    </form>
<%
}
%>

<%-- Mostrar la opción de volver a la página inicial solo si el saldo actual es igual a cero --%>
<%
if (saldoActual == 0) {
%>
   <form action="resultado.jsp" method="post">
    Introduce más dinero:
    <input type="number" name="cantidad" required>
    <button type="submit">Agregar más dinero</button>
</form>
<%
}
%>
<%-- Mostrar la opción de retirar dinero solo si el saldo actual es mayor que cero --%>
<%
if (saldoActual > 0) {
%>
    <form action="retirar.jsp" method="post">
        <input type="hidden" name="saldoRetirar" value="<%= saldoActual %>">
        <button type="submit">Retirar dinero actual</button>
    </form>
<%
}
%>   
        
    </div>


</body>
</html>


