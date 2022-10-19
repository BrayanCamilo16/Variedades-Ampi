<%@page import="java.util.Calendar"%>
<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="head-css.jsp" />
    </head>

    <footer>
        <div class="footer2">
            <div class="empresa">
                <a href="${pageContext.request.contextPath}">
                    <img src="${pageContext.request.contextPath}/img/variedades-ampi.png">
                </a>
                <p>Variedades Ampi esta ubicada en la localidad Ciudad Bolivar y ofrece productos de diferentes categorias y de buena calidad.</p>
            </div>
            <div class="sobre">
                <h1>Información</h1>
                <div class="sobreN">
                    <p>Sobre nosotros</p>
                    <div class="nosotros">
                        Somos un grupo de desarrolladores conformado por Jhon, Kevin, Jose y Brayan nos hacemos llamar Los Dinamita
                    </div>
                </div>
                <div class="sobreN">
                    <p>Contácto</p>
                    <div class="contacto">
                        Comunicate al <b>3134377435</b> para cualquier cosa.
                    </div>
                </div>
                <div class="sobreN">
                    <p>Ayuda</p>
                    <div class="ayuda">
                        Para dudas, reclamos o sugerencias dejalas en el siguiente correo <b>variedadesampi@gmail.com</b>
                    </div>
                </div>

                <div class="sobreN">
                    <p>Políticas de privacidad</p>
                </div>
            </div>
            <div class="redes">
                <h1>Redes Sociales</h1>
                <a href="">
                    <i class="fab fa-facebook-f"></i>
                    Facebook
                </a>
                <a href="">
                    <i class="fab fa-twitter"></i>
                    Twiter
                </a>
                <a href="">
                    <i class="fab fa-google"></i>
                    Google
                </a>
                <a href="">
                    <i class="fab fa-instagram"></i>
                    Instagram
                </a>
                <a href="">
                    <i class="fab fa-linkedin"></i>
                    LinKedln
                </a>
            </div>
        </div>
        <div>
            <div class="derechos">
                <span>&copy; <%=year%> <a href="">Variedades Ampi</a>. Todos los derechos reservados</span>
            </div>
        </div>
    </footer>
</html>
