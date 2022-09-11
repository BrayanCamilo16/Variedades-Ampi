/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */
function alertaInactivar(codigoId, estado) {
////    swal.fire({
////
//////        title: "Esta seguro de inactivar?",
//////
//////        text: "Una vez Inactivado el usuario NO podra iniciar sesion!",
//////        type: "warning",
//////        showCancelButton: true,
//////        confirmButtonClass: "btn-danger",
//////        confirmButtonText: "Si, Inactivar!",
//////        cancelButtonText: "No, Cancelar!",
//////        closeOnConfirm: false,
//////        closeOnCancel: false
//    },
//
//            function (isConfirm) {
//                if (isConfirm) {
//                    location.href("Usuario?codigoId=" + codigoId + "&action=" + estado);
//                    swal("Inactivado!", "El usuario se ha Inactivado correctamente.", "success");
//                    setTimeout(function () {
//                        parent.location.href = "admin"
//                    }, 1800);
//
//                } else {
//                    swal("Cancelado", "Cancelaste la Inactivacion", "error");
//                }
//                
//            });
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                    )
        }
    })
}