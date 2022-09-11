<%@page import="vo.UsuarioVO" %>

    <body>
        <div class="modal fade" id="Create">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <div>
                            <h3 class="modal-title fw-bold lead">Registra un usuario</h3>
                            <span>Es f&#225;cil y r&#225;pido.</span>
                        </div>
                        <button type="button" class="text-white bg-transparent border-0" data-bs-dismiss="modal"
                            aria-label="Close"><i class="fas fa-times"></i></button>
                    </div>
                    <form action="${pageContext.request.contextPath}/Usuario" method="POST" style="overflow-y: scroll;"
                        id="formulario">
                        <div class="modal-body">


                            <!--Grupo nombre-->
                            <div class="gruponombre">
                                <label for="nombre">Nombre <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="nombre" id="nombre" required>
                                <span class="nombreText"></span>
                            </div>




                            <!--Grupo apellido-->
                            <div class="grupoapellido">
                                <label for="apellido" class="formulario_label">Apellido <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="apellido" id="apellido" required>
                                <span class="apellidoText"></span>
                            </div>





                            <div class="grupocorreo">
                                <label for="emailSingup" class="formulario_label">Correo electr&#243;nico <span
                                        class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="email" id="emailSingup"
                                    required><span id="text"></span>
                                <span class="correoText"></span>
                            </div>




                            <div class="grupopassword">
                                <label for="password">Contrase&#241;a <span class="text-danger">*</span></label>
                                <input type="password" class="form-control mt-1" name="pass" id="password" required>
                                <span class="passwordText"></span>
                            </div>




                            <div class="form-group mb-2">
                                <label for="tipo-doc">Tipo de Documento<span class="text-danger">*</span></label>
                                <select class="form-select" name="tipoDocu" required>
                                    <option value="1">C&#233;dula de ciudadan&#237;a</option>
                                    <option value="2">C&#233;lula de extranjer&#237;a</option>
                                    <option value="3">Tarjeta de identidad</option>
                                    <option value="4">Pasaporte</option>
                                    <option value="5">Nit</option>
                                </select>
                            </div>



                            <div class="form-group mb-2">
                                <label for="num-documento">No. Documento <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="numDocu" id="num-documento"
                                    onkeydown="validation()" required>
                            </div>



                            <div class="grupotelefono">
                                <label for="telefono">Telefono <span class="text-danger">*</span></label>
                                <input type="text" class="form-control mt-1" name="telefono" id="telefono" required>
                                <span class="telefonoText"></span>
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



                            <div class="form-group mb-2">
                                <label for="rol">Rol <span class="text-danger">*</span></label>
                                <select class="form-select" name="idRol" required>
                                    <option value="2">Vendedor</option>
                                    <option value="1">Administrador</option>
                                </select>
                            </div>

                        </div>
                        <div class="modal-footer d-flex justify-content-center">
                            <p id="mensaje" class="d-none">Por favor sumnistre bien los campos para hacer el registro
                                correctamente</p>
                            <button type="submit" class="btn btn-primary btn-lg">Registrarte</button>
                        </div>
                        <input type="hidden" value="2" name="action">

                    </form>
                </div>
            </div>
        </div>
        <!--    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
                (() => {
                    'use strict'
        
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    const forms = document.querySelectorAll('.needs-validation')
        
                    // Loop over them and prevent submission
                    Array.from(forms).forEach(form => {
                        form.addEventListener('submit', event => {
                            if (!form.checkValidity()) {
                                event.preventDefault()
                                event.stopPropagation()
                            }
        
                            form.classList.add('was-validated')
                        }, false)
                    })
                })();
            </script>      -->
        <script>
            const formulario = document.getElementById("formulario");
            const nombre = document.getElementById("nombre");
            const apellido = document.getElementById("apellido");
            const email = document.getElementById("emailSingup");
            const password = document.getElementById("password");
            const telefono = document.getElementById("telefono");
            const NombrePattern = /^[a-zA-Z�-�\s]{1,40}$/;
            const ApellidoPattern = /^[a-zA-Z�-�\s]{1,40}$/;
            const correoPattern = /^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$/;
            const passwordPattern = /^.{4,12}$/;
            const telefonoPattern = /^\d{7,14}$/;
            let mensaje = document.getElementById("mensaje");

            formulario.addEventListener('submit', (e) => {
                if (!nombre.value.match(NombrePattern) || !apellido.value.match(ApellidoPattern) ||
                    !email.value.match(correoPattern) || !password.value.match(passwordPattern) ||
                    !telefono.value.match(telefonoPattern)) {
                    e.preventDefault();
                    mensaje.classList.remove("d-none");
                }
            });
            nombre.addEventListener('input', () => {
                const gruponombre = document.querySelector(".gruponombre");
                const nombreText = document.querySelector(".nombreText");
                // Letras y espacios, pueden llevar acentos.

                if (nombre.value.match(NombrePattern)) {
                    gruponombre.classList.add('valid');
                    gruponombre.classList.remove('invalid');
                    nombreText.innerHTML = "El nombre escrito es v�lido";
                    nombreText.style.color = "#2A892D";
                } else {
                    gruponombre.classList.add('invalid');
                    gruponombre.classList.remove('valid');
                    nombreText.innerHTML = "Solo puede contener letras y espacios, no pueden llevar mas de 40 digitos.";
                    nombreText.style.color = "#ff0000";

                }

            });


            apellido.addEventListener('input', () => {
                const grupoapellido = document.querySelector(".grupoapellido");
                const apellidoText = document.querySelector(".apellidoText");
                // Letras y espacios, pueden llevar acentos.

                if (apellido.value.match(ApellidoPattern)) {
                    grupoapellido.classList.add('valid');
                    grupoapellido.classList.remove('invalid');
                    apellidoText.innerHTML = "El apellido escrito es v�lido";
                    apellidoText.style.color = "#2A892D";
                } else {
                    grupoapellido.classList.add('invalid');
                    grupoapellido.classList.remove('valid');
                    apellidoText.innerHTML = "Solo puede contener letras y espacios, no pueden llevar mas de 40 digitos.";
                    apellidoText.style.color = "#ff0000";

                }

            });


            email.addEventListener('input', () => {
                const grupocorreo = document.querySelector(".grupocorreo");
                const correoText = document.querySelector(".correoText");
                // Letras y espacios, pueden llevar acentos.

                if (email.value.match(correoPattern)) {
                    grupocorreo.classList.add('valid');
                    grupocorreo.classList.remove('invalid');
                    correoText.innerHTML = "El correo escrito es v�lido";
                    correoText.style.color = "#2A892D";
                } else {
                    grupocorreo.classList.add('invalid');
                    grupocorreo.classList.remove('valid');
                    correoText.innerHTML = "El correo solo puede contener letras, numeros, puntos, guiones y guion bajo. Debe incluir un @";
                    correoText.style.color = "#ff0000";

                }

            });


            password.addEventListener('input', () => {
                const grupopassword = document.querySelector(".grupopassword");
                const passwordText = document.querySelector(".passwordText");
                // 4 a 12 digitos. Puede incluir letras

                if (password.value.match(passwordPattern)) {
                    grupopassword.classList.add('valid');
                    grupopassword.classList.remove('invalid');
                    passwordText.innerHTML = "La contrase�a escrita es v�lida";
                    passwordText.style.color = "#2A892D";
                } else {
                    grupopassword.classList.add('invalid');
                    grupopassword.classList.remove('valid');
                    passwordText.innerHTML = "Puede incluir letras, numero caracteres especiales, guiones. Debe ser maximo de 12 digitos";
                    passwordText.style.color = "#ff0000";
                }

            });



            telefono.addEventListener('input', () => {
                const grupotelefono = document.querySelector(".grupotelefono");
                const telefonoText = document.querySelector(".telefonoText");
                // 7 a 14 numeros.
                if (telefono.value.match(telefonoPattern)) {
                    grupotelefono.classList.add('valid');
                    grupotelefono.classList.remove('invalid');
                    telefonoText.innerHTML = "El telefono escrito es v�lido";
                    telefonoText.style.color = "#2A892D";
                } else {
                    grupotelefono.classList.add('invalid');
                    grupotelefono.classList.remove('valid');
                    telefonoText.innerHTML = "Por favor escriba numeros";
                    telefonoText.style.color = "#ff0000";

                }

            });
        </script>

        <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
    </body>