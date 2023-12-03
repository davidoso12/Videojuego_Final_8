//Módulo PantTopScore
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: El módulo PantConfig controla la pantalla
// de configuración del juego.

class PantTopScore{
  Boton btncan;  //regresa a pantalla principal
  
  PantTopScore(){
    btncan=new Boton(440,200,cf.btnw,cf.btnh,20);
  }
  
  void display(){
    background(0,150,0);
    fill(255);
    stroke(255);
    textAlign(CENTER,CENTER);
    text(idi.getMensaje(17),640,360);
    btncan.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btncan.isClicked(x,y,b))
      gc.setPantAct(PANTPRIN);
  }
}
