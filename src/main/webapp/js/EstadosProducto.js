function alertaInactivarP(codigoId, estado) {
    Swal.fire({
        title: 'Desea Inactivar el producto',
        text: 'Al inactivar el Porducto este ya no estara en lista',
        imageUrl: 'https://unsplash.it/400/200',
        imageWidth: 400,
        imageHeight: 200,
        imageAlt: 'Custom image',
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../Producto?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}

function alertaActivarP(codigoId, estado) {
    Swal.fire({
        title: 'Desea Activar el producto',
        text: 'Al activar el Producto este si estara en lista',
        imageUrl: 'https://unsplash.it/400/200',
        imageWidth: 400,
        imageHeight: 200,
        imageAlt: 'Custom image',
    }).then((result) => {
        if (result.isConfirmed) {
            console.log("index.jsp")
            window.location = ("../Producto?codigoId=" + codigoId + "&action=" + estado);
        }
    });
}