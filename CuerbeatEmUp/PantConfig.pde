//Módulo PantConfig
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: El módulo PantConfig controla la pantalla
// de configuración del juego.

class PantConfig{
  Boton btnidi;  //cambia el idioma
  Boton btncan;  //regresa a pantalla principal
  Boton btnsav;  //guarda configuración
  
  PantConfig(){
    btnidi=new Boton(640,100,cf.btnw,cf.btnh,4);
    btncan=new Boton(440,200,cf.btnw,cf.btnh,5);
    btnsav=new Boton(840,200,cf.btnw,cf.btnh,6);
  }
  
  void display(){
    background(0,150,0);
    fill(255);
    stroke(255);
    textAlign(CENTER,CENTER);
    text(idi.getMensaje(3),640,360);
    btnidi.display();
    btncan.display();
    btnsav.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btnidi.isClicked(x,y,b)) 
      idi.setIdioma((idi.getIdioma()==IDESP)?IDENG:IDESP);
    if(btncan.isClicked(x,y,b))
      gc.setPantAct(PANTPRIN);
    if(btnsav.isClicked(x,y,b))
      cf.saveConfig(idi);
  }
}
