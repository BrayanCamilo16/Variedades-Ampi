<div class="modal fade" id="generarPedido">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h3 class="modal-title fw-bold lead">Generar pedido</h3>
                <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal" aria-label="Close"><i class="fas fa-times"></i></button>
            </div>
            <form action="${pageContext.request.contextPath}/Producto" method="POST" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="form-group mb-2">
                        <label for="email">Forma pago <span class="text-danger">*</span></label><br><br>
                        <span class="me-2">Efectivo</span><input type="radio" value="1" name="formaPago">
                        <span class="me-2">Online</span><input type="radio" value="2" name="formaPago">
                        <input type="hidden" name="opcion" value="5">
                    </div>
                    <div class="form-group mb-2">
                        <label for="pass">Dirección envio <span class="text-danger">*</span></label>
                        <input type="text" class="form-control mt-1" name="direccionEnvio" required>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Generar pedido</button>
                </div>
            </form>
        </div>
    </div>
</div>