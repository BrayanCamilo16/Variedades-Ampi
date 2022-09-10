<%@page import="java.util.Calendar"%>
<%
    Calendar cal = Calendar.getInstance();
    int year = cal.get(Calendar.YEAR);
%> 
<!-- Footer -->
<footer class="text-center text-lg-start bg-light">


    <!-- Section: Links  -->
    <section class="border-bottom mt-3 p-4">
        <div class="container text-center text-md-start">
            <!-- Grid row -->
            <div class="row mt-3 text-center">
                <!-- Grid column -->
                <div class="mx-auto">
                    <!-- Links -->
                    <a class="navbar-brand py-2" href="${pageContext.request.contextPath}">
                        <img src="${pageContext.request.contextPath}/img/variedades-ampi.png" alt="" width="150">
                    </a>
                    <div class="mt-2 d-flex justify-content-center">
                        <p class="me-4 py-2 text-primary"><a href="" class="text-decoration-none">Sobre nosotros</a></p>
                        <p class="me-4 py-2 text-primary"><a href="" class="text-decoration-none">Contacto</a></p>
                        <p class="me-4 py-2 text-primary"><a href="" class="text-decoration-none">Ayuda</a></p>
                        <p class="me-4 py-2 text-primary"><a href="" class="text-decoration-none">Politicas de privacidad</a></p>
                    </div>
                </div>
                <!-- Grid column -->
            </div>
            <!-- Grid row -->
        </div>
    </section>
    <!-- Section: Links  -->

    <!-- Section: Social media - copyright -->
    <section class="container">
        <div class="d-flex justify-content-center justify-content-lg-between p-4 flex-wrap">
            <!-- Left -->
            <div class="me-lg-2 p-md-2">
                <div class="">
                    <span>© <%=year%> <a class="text-decoration-none text-dark" href="">Variedades ampi</a>. Todos los derechos reservados</span>
                </div>
            </div>
            <!-- Left -->

            <!-- Right -->
            <div>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-facebook-f"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-twitter"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-google"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-instagram"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-linkedin"></i>
                </a>
                <a href="" class="me-4 text-reset">
                    <i class="fab fa-github"></i>
                </a>
            </div>
            <!-- Right -->
        </div>
    </section>
    <!-- Section: Social media - copyright -->
</footer>
<!-- Footer -->