<%@page import="vo.ProductoVO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/swiper-bundle.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/productos.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <%
            ProductoDAO productoDao = new ProductoDAO();
            ProductoVO productoVo = null;
            List<ProductoVO> productos = productoDao.select();

            for (int i = 0; i < productos.size(); i++) {
                productoVo = productos.get(i);
        %>
        <div class="contenido-completo swiper">
            <div class="contenido-caja">
                <div class="tarjeta-wrapper swiper-wrapper">
                    <div class="tarjeta swiper-slide">
                        <div class="contenido-imagen">
                            <span class="fondo"></span>
                            <div class="imagen-tarjeta">
                                <img src="${pageContext.request.contextPath}/files/producto/<%= productoVo.getNombreImgProducto()%>" alt="alt" class="imagen"/>
                            </div>
                        </div>

                        <div class="contenido-tarjeta">
                            <h2 class="nombre"><%= productoVo.getNombreProducto()%></h2>
                            <h3 class="precio"><%= productoVo.getPrecioUnitarioProducto()%></h3>
                            <p class="descripcion"><%= productoVo.getDescripcionProducto()%></p>
                            <form action="${pageContext.request.contextPath}/Producto" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="opcion" value="4">
                                <input type="hidden" name="idProducto" value="<%= productoVo.getIdProducto()%>">
                                <button class="button">Agregar&nbsp;&nbsp;<i class="fas fa-shopping-cart"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
    </body>
    <script src="js/swiper-bundle.min.js" type="text/javascript"></script>
    <script>
        var swiper = new swiper(".contenido-caja", {
            slidesPerView: 3,
            slidesPerGroup: 3,
            spaceBetween: 30,
            loop: true,
            centerSlide: 'true',
            fade: 'true',
            grabCursor: 'true',
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                DynamicsBullets: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            }
        });
    </script>
    <%
        }
    %>
    <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>

</html>

