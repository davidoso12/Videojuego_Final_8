//Módulo PantLoad
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: El módulo PantLoad controla la pantalla
// de carga inicial de datos del juego.

class PantLoad{
  Temporizador tmpidle;
  boolean loading;
  int msg;
  
  PantLoad(){
    tmpidle=new Temporizador(180);
    loading=true;
  }
  
  void display(){
    background(128);
    fill(255);
    stroke(255);
    textAlign(CENTER,CENTER);
    text(idi.getMensaje(1),640,360);
    text(idi.getMensaje(msg),400,600);
    if(!loading && !tmpidle.isActive())
      tmpidle.activate();
    if(tmpidle.isActive())
      tmpidle.coolingDown();
    if(tmpidle.isOff())
      gc.setPantAct(PANTPRIN);
  }
}
