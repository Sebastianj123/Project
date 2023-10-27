<?php 
$srv = $data['srv'];
?>
<main>
    <section class="introduccion m-3">
      <h1>Sobre nosotros</h1>
      <p>
      El salon de belleza <?= APP_NAME ?> es un salón de belleza de lujo que ofrece una amplia gama de servicios para hombres, mujeres y niños. Nuestros estilistas están capacitados en las últimas tendencias y técnicas, y están comprometidos a brindar a nuestros clientes una experiencia de belleza excepcional.
      </p>
      <h2>Visión</h2>
  <p>
    Ser el salón de belleza de referencia en Colombia, brindando a nuestros clientes una experiencia de belleza excepcional que los haga sentirse seguros y hermosos.
  </p>

  <h2>Misión</h2>
  <p>
    Brindar a nuestros clientes los mejores servicios y productos de belleza, con un enfoque en la excelencia, la atención al cliente y la innovación.
  </p>
    </section>

    <section class="galeria w-100 d-flex flex-column justify-content-center m-3" style="height:90vh;">
      <h2 class="my-5">Servicios</h2>

      <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
        
        <div class="carousel-inner">

            <?php 
                
                foreach ($srv as $key => $row) {
                    $url = $row['srv_img'];
                    $id = $row['srv_id'];
             ?>
            
            <!-- Imagen #<?= $id ?> code-<?= $id ?> -->
            <a 
                id="a-carrousel-<?= $id; ?>" 
                class="carousel-item w-100 <?= ($id == 1) ? 'active' : '' ?>" 
                data-bs-interval="3000"
            />

                <div class="container-fluid w-60 d-flex justify-content-center align-items-center" style="height:70vh; width:80%;">
                    <img 
                        id="img-carrousel-<?= $id ?>" 
                        src="<?= $url ?>" 
                        alt="<?= $url ?>" 
                        class="w-100 img-carrousel" style="min-height:80vh; min-width:80vw;"
                    />
                </div>
            
            </a>

            <?php } 
            ?>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
            <span class="carousel-control-prev-icon p-4 bg-dark" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
            <span class="carousel-control-next-icon p-4 bg-dark" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>    

    </section>
  </main>
