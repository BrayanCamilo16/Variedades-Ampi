<div class="modal fade" id="login">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h3 class="modal-title fw-bold lead">Iniciar sesi&#243;n</h3>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
            <form action="${pageContext.request.contextPath}/Usuario" method="POST">
                <div class="modal-body">
                    <div class="form-group mb-2">
                        <label for="email">Correo electr&#243;nico <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="email" id="email" required>
                        <input type="hidden" name="action" value="1">
                    </div>
                    <div class="form-group mb-2">
                        <label for="pass">Contrase&#241;a <span class="text-danger">*</span></label>
                        <input type="password" class="form-control mt-1" name="pass" id="pass" required>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                </div>
            </form>
        </div>
    </div>
</div>