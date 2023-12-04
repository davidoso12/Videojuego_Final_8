//Módulo PantLife
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: El módulo PantConfig controla la pantalla
// de configuración del juego.

class PantLife{
  Boton btnret;
  
  PantLife(){
    btnret=new Boton(440,250,cf.btnw,cf.btnh,19);
  }
  
  void display(){
    fill(color(255,255,255,5));
    stroke(255);
    rect(640,360,1280,720);
    textAlign(CENTER,CENTER);
    text(idi.getMensaje(18),640,360);

    btnret.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btnret.isClicked(x,y,b)){
      mscstage.setVolume(0.5);
      gc.setPantAct(PANTGAME);
    }  
        if(btnret.isClicked(x,y,b)){
      mscstage.setVolume(0.5);
      gc.setPantAct(PANTGAMEN);
    }  
  }
}
