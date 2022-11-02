function alertaInactivar(codigoId, estado) {
    Swal.fire({
        title: 'Desea Inactivar Usuario?',
        text: "Una vez inactiva el usuario NO podra iniciar sesion!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, Inactivar!'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../Usuario?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}
function alertaActivar(codigoId, estado) {
    Swal.fire({
        title: 'Desea Activar Usuario?',
        text: "Una vez Activa el usuario SI podra iniciar sesion!",
        icon: 'success',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'SI, Activar!'
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../Usuario?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}
