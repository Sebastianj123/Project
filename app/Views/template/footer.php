<style>
    body {
      font-family: sans-serif;
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

</style>

<footer class="py-3 my-4 d-flex flex-column justify-content-center aling-items-center">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <li class="nav-item fw-bold"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
      <li class="nav-item fw-bold"><a href="#nosotros" class="nav-link px-2 text-muted">About</a></li>
    </ul>
    
    <section class="contacto m-3">
      <div class="w-50 m-auto">
        <h2 class="text-center">Contacto</h2>
        <p class="text-center">
          Si necesitas informacion manda una PQR en el siguiente formulario
        </p>
        <form action="/contacto" method="post">
          <input type="text" name="nombre" placeholder="Nombre">
          <input type="email" name="email" placeholder="Correo electrónico">
          <input type="text" name="mensaje" placeholder="Mensaje">
          <button type="submit">Enviar</button>
        </form>
      </div>
    </section>

    <p class="text-center text-muted">© 2023 Company, Inc</p>
  </footer>