<%@page import="vo.UsuarioVO"%>
<div class="modal fade" id="signup">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <div>
                    <h3 class="modal-title fw-bold lead">Registrarte</h5>
                        <span>Es f&#225;cil y r&#225;pido.</span>
                </div>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
            <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;">
                <div class="modal-body">
                    <div class="form-group mb-2">
                        <label for="emailSingup">Correo electr&#243;nico <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="email" id="emailSingup" required>
                        <input type="hidden" name="action" value="2">
                    </div>
                    <div class="form-group mb-2">
                        <label for="password">Contrase&#241;a <span class="text-danger">*</span></label>
                        <input type="password" class="form-control mt-1" name="pass" id="password" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="nombre">Nombre <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="nombre" id="nombre" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="apellido">Apellido <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="apellido" id="apellido" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="tipo-doc">Sexo <span class="text-danger">*</span></label>
                        <select class="form-select" name="tipoDocu" required>
                            <option value="1">C&#233;dula de ciudadan&#237;a</option>
                            <option value="2">C&#233;lula de extranjer&#237;a</option>
                            <option value="3">Pasaporte</option>
                            <option value="4">Nit</option>
                            <option value="5">Tarjeta de identidad</option>
                        </select>
                    </div>
                    <div class="form-group mb-2">
                        <label for="num-documento">No. Documento <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="numDocu" id="num-documento" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="telefono">Telefono <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="telefono" id="telefono" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="direccion">Direcci&#243;n <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="direccion" id="direccion" required>
                    </div>
                    <div class="form-group mb-2">
                        <label for="sexo">Sexo <span class="text-danger">*</span></label>
                        <select class="form-select" name="sexo" required>
                            <option value="1">Hombre</option>
                            <option value="2">Mujer</option>
                            <option value="3">Otro</option>
                        </select>
                    </div>
                    <%
                        HttpSession sesion = request.getSession();
                        if (sesion.getAttribute("usuarioVo") != null) {
                            UsuarioVO usuarioVO = (UsuarioVO) sesion.getAttribute("usuarioVo");
                            int idRol = usuarioVO.getIdRol();

                            if (idRol == 1) {
                    %>
                    <div class="form-group mb-2">
                        <label for="sexo">Rol <span class="text-danger">*</span></label>
                        <select class="form-select" name="idRol" required>
                            <option value="2">Vendedor</option>
                            <option value="1">Administrador</option>
                            <option value="3">Cliente</option>
                        </select>
                    </div>
                    <div class="form-group mb-2">
                        <label for="sexo">Estado <span class="text-danger">*</span></label>
                        <select class="form-select" name="estado" required>
                            <option value="0">Activo</option>
                            <option value="1">Inactivo</option>
                        </select>
                    </div>


                    <%
                            }
                        }
                    %>
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary btn-lg">Registrarte</button>
                </div>
            </form>
        </div>
    </div>
</div>