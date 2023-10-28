<style>
    footer {
      background: #120033;
      position: inherit;
      bottom: 0;
    }

    form {
      width: 500px;   
      margin: 0 auto;
    }

    input {
      width: 100%;
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
    }

    button {
      width: 100%;
      padding: 10px;
      background-color: #000;
      color: #fff;
      border: none;
      cursor: pointer;
    }

    .text-withe {
      color: #a391ff !important;
    }

    .form-control {
      background-color: #3e00e6;
      font-weight: bold;
      color: #a391ff;
    }

    .form-control:hover {
      background-color: #5700ff;

    }

    .form-control:focus {
      background-color: #120033;
      color: #a391ff;

    }

    .form-control::placeholder {
      color: #a391ff;
    }
</style>

<footer class="py-3 my-4 d-flex flex-column justify-content-center aling-items-center">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item fw-bold"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item fw-bold"><a href="#nosotros" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    
    <section class="contacto m-3">
      <div class="w-50 m-auto">
        <h2 class="text-center text-withe">Contacto</h2>
        <p class="text-center text-withe">
          Si necesitas informacion manda una PQR en el siguiente formulario
        </p>
        <form action="/contacto" method="post">
          <input class="form-control" type="text" name="nombre" placeholder="Nombre">
          <input class="form-control" type="email" name="email" placeholder="Correo electrónico">
          <input class="form-control" type="text" name="mensaje" placeholder="Mensaje">
          <button type="submit" class="text-withe">Enviar</button>
        </form>
      </div>
    </section>

    <p class="text-center text-muted text-withe">© 2023 Company, Inc</p>
  </footer>