class PantPauses{
  Boton btncan;  //regresa a pantalla principal
  Boton btnret;
  
  PantPauses(){
    btncan=new Boton(440,200,cf.btnw,cf.btnh,20);
    btnret=new Boton(440,250,cf.btnw,cf.btnh,19);
  }
  
  void display(){
    fill(color(255,255,255,5));
    stroke(255);
    rect(640,360,1280,720);
    textAlign(CENTER,CENTER);
    text(idi.getMensaje(18),640,360);
    btncan.display();
    btnret.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btncan.isClicked(x,y,b)){
      gc.musicManager(false);
      gc.setPantAct(PANTPRIN);
    }  
    if(btnret.isClicked(x,y,b)){
      mscstage.setVolume(0.5);
      gc.setPantAct(PANTGAMEN);
    }  
  }
}
