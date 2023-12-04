//Módulo PantConfig
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: El módulo PantConfig controla la pantalla
// de configuración del juego.

class PantConfig {
  Boton btnIdioma;  // Cambia el idioma
  Boton btnCancelar;  // Regresa a pantalla principal
  Boton btnGuardar;  // Guarda configuración

  PImage fondo; // Imagen de fondo con blur

  PantConfig() {
    btnIdioma = new Boton(width / 2, height / 2, width / 4, height / 5, 4);
    btnCancelar = new Boton(width / 4, height * 4 / 5, width / 4, height / 5, 5);
    btnGuardar = new Boton(width * 3 / 4, height * 4 / 5, width / 4, height / 5, 6);
    fondo = loadImage("sprite/fondos/caratula.png");
  }

  void display() {
    // Mostrar imagen de fondo con blur
    image(fondo, width / 2, height / 2, width, height);
    filter(BLUR, 5); // Ajusta el valor de blur según tus preferencias

    fill(0);
    textAlign(CENTER, CENTER);

    // Título de la pantalla en la parte superior
    textSize(36);
    text("Configuracciones", width / 2, height / 10);
     textSize(18);
    
    text("Cambia la configuración según tus preferencias", width / 2, height / 10 + 30);


    // Título de la sección en la parte central
    textSize(24);
    
    text("Cambiar Idioma", width / 2, height / 4);

    // Visualización de los botones en la parte central
    btnIdioma.display();

    // Botones de cancelar y guardar en la parte inferior
    btnCancelar.display();
    btnGuardar.display();
  }

  void mouseControl(int x, int y, int b) {
    // Acciones según el botón presionado
    if (btnIdioma.isClicked(x, y, b)) 
      idi.setIdioma((idi.getIdioma() == IDESP) ? IDENG : IDESP);
    
    if (btnCancelar.isClicked(x, y, b))
      gc.setPantAct(PANTPRIN);
    
    if (btnGuardar.isClicked(x, y, b))
      cf.saveConfig(idi);
  }
}
