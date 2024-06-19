<%-- 
    Document   : onama
    Created on : Jun 16, 2024, 1:37:55 PM
    Author     : User
--%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <title>Ketering Ginic</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/onama.css">
     <%@include file="head.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
  </head>
  <body>
   <%@include file="navbar2.jsp"%>
    <div class = "about-wrapper">
      <div class = "about-left">
        <div class = "about-left-content">
          <div>
            <div class = "shadow">
              <div class = "about-img">
                  <img src = "product-image/logo_onama.png" alt = "about image">
              </div>
            </div>

            <h2>Ginic</h2>
            <h3>Katering sluzba</h3>
          </div>


        </div>
      </div>

      <div class = "about-right">
        <h2>Da li ti treba dobra hrana?!<span>!</span></h2>
        <h2>Tu smo za <b> tebe!</b></h2>


        <div class = "about-para">
            <p>Katering Ginic postoji vec duzi niz godina,koja ima hiljde i hiljade zadovoljnih kupaca.Osnovana 1975. godine,jedna je od najstarijih i najbolji katering sluzba u regionu.</p>
            <p>Dobra usluga?<br>
                Dobra klopa i pice?<br>
            Na pravom si mestu. Ketering Ginic.</p>
        </div>
      </div>
    </div>


  </body>
</html>