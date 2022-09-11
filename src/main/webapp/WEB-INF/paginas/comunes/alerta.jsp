<%
    if (request.getAttribute("tituloError") != null || request.getAttribute("tituloExito") != null) {
        if (request.getAttribute("tituloError") != null) {
%>
<div class="alert alert-danger alert-dismissible fade show mt-2" role="alert">
    <div class="container">
        <h3 class="load fw-bold">${tituloError}</h3>
        <span>${mensajeDescriptivo}</span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<%
        } else if (request.getAttribute("tituloExito") != null) {
%>
<div class="alert alert-success alert-dismissible fade show mt-2" role="alert">
    <h3 class="load fw-bold">${tituloExito}</h3>
    <span>${mensajeDescriptivo}</span>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
        }
%>
<%
    }
%>