<%@page import="vo.ProductoVO"%>
<%@page import="dao.ProductoDAO"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <div class="contenido-completo">
            <div class="contenido-caja" id="contenido-caja">
                <div class="alto">
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
            <i class="fas fa-chevron-right" id="btn-right"></i>

            <i class="fas fa-chevron-left" id="btn-left"></i>
        </div>
        <script>
//            document.addEventListener('DOMContentLoaded', () => {
//                const elementoscarrusel = document.querySelectorAll('.alto')
//                M.Carousel.init(elementoscarrusel, {
//                    PerView: 3,
//                    PerGroup: 3,
//                    spaceBetween: 30,
//                    loop: true,
//                    centerSlide: 'true',
//                    fade: 'true',
//                    grabCursor: 'true'
//                });
//            });
           

            const slider = document.querySelector("#contenido-caja");
            let cajas = document.querySelector(".alto");
            let sliderSectionLast = cajas[cajas.length - 1];

            const btnRight = document.querySelector("#btn-right");
            const btnLeft = document.querySelector("#btn-left");

            slider.insertAdjacentElement('afterbegin', sliderSectionLast);



            function Next() {
                let sliderSectionFirst = document.querySelector(".alto")[0];
                slider.style.marginLeft = "-200%";
                slider.style.transition = "all 0.5s";
                setTimeout(function () {
                    slider.style.transition = "none";
                    slider.insertAdjacentElement('beforeend', sliderSectionFirst);
                    slider.style.marginLeft = "-100%";
                }, 500);
            }

            function Prev() {
                let sliderSection = document.querySelector(".alto");
                let sliderSectionLast = sliderSection[sliderSection.length - 1];
                contenido.style.marginLeft = "0";
                contenido.style.transition = "all 0.5s";
                setTimeout(function () {
                    contenido.style.transition = "none";
                    contenido.insertAdjacentElement('afterbegin', sliderSectionLast);
                    contenido.style.marginLeft = "-100%";
                }, 500);
            }

            btnRight.addEventListener('click', function () {
                Next();
            });

            btnLeft.addEventListener('click', function () {
                Prev();
            });
        </script>
    </body>
    <%
        }
    %>
    <script src="https://kit.fontawesome.com/bdbed0aafa.js" crossorigin="anonymous"></script>

</html>

