//Módulo PantGame
//Elaborado por: Rubén Dario Hernández Mendo
//Fecha de creación: 23 de septiembre de 2023 
//Fecha de última modificacion: 20 de noviembre de 2023
//Descripción: El módulo PantGame controla la pantalla
// de "acción" del juego.

class PantGame{
  Personaje per;
  HealItem hi;
  //PImage escenario;
  PImage cielo;
  PImage montes;
  PImage piso;
  Punto2D imgcie;
  Punto2D imgmon;
  Punto2D imgpis;
  Boton btnpause;
  Colisionador clatk;
  Colisionador clbdy;
  Colisionador clhel;
  LifeBar enemy;
  float bal;
  int dir;
  
  PantGame(){
    per=new Personaje(140,500,100,200);
    hi=new HealItem(450,500,0,0);
    //escenario=loadImage("sprite/fondos/escenario.png");
    cielo=loadImage("sprite/fondos/cielo.png");
    montes=loadImage("sprite/fondos/montes.png");
    piso=loadImage("sprite/fondos/piso.png");
    imgcie=new Punto2D(0,0);
    imgmon=new Punto2D(0,-70);
    imgpis=new Punto2D(0,260);
    clbdy=new Colisionador(640,400,0,0,30,COLBODY);
    clatk=new Colisionador(300,400,0,0,30,COLATCK);
    enemy=new LifeBar(50,new Punto2D(110,100),new Punto2D(100,40),color(0,150,0),color(255,0,0));
    btnpause=new Boton(640,685,cf.btnw,cf.btnh,15);
    bal=-1.0;
    dir=RIGHT;
  }
  
  void display(){
    music();
    background(0);
    fill(255);
    stroke(255);
    textAlign(CENTER,CENTER);
    text(idi.getMensaje(0),640,360);
    planoCielo();
    planoFondo();
    planoFrente();
    moverPlanos();
    imageMode(CENTER);
    per.display();
    enemy.display();
    if(cf.drwc){
      clbdy.drawAreaColision();
      clatk.drawAreaColision();
    }  
    hi.display();
    checkColisiones();
    btnpause.display();
    bal+=(dir==RIGHT)?0.001:-0.001;
    if(Math.abs(bal)>=1)
      dir=(bal>=1)?LEFT:RIGHT;
    mscstage.setBalance(bal);  
  }
  
  void planoCielo(){
    imageMode(CORNER);
    image(cielo,imgcie.getX(),imgcie.getY());
  }
  
  void planoFondo(){
    imageMode(CORNER);
    image(montes,imgmon.getX(),imgmon.getY());
  }
  
  void planoFrente(){
    imageMode(CORNER);
    image(piso,imgpis.getX(),imgpis.getY());
  }
  
  void moverPlanos(){
    if(imgcie.getX()<=-2560)
      per.reachedBorder();
    if(per.hasMovedX()&& imgcie.getX()>-2560){
      imgcie.moverP(-1,0);
      imgmon.moverP(-2,0);
      imgpis.moverP(-3,0);
      hi.moverH(-3,0);
    }
  }
  
  void keyControl(char k){
    per.keyControl(k);
  }
  
  void keyRelControl(char k){
    per.keyRelControl(k);
  }
  
  void mouseControl(int x,int y,int b){
    if(btnpause.isClicked(x,y,b)){
      mscstage.setVolume(0.15);
      gc.setPantAct(PANTPAUS);
    }  
  }
  
  void checkColisiones(){
    if(per.clbody.isColision(clatk)){
      per.herir();
      per.it.activate();
      per.clbody.deactivate();
    }  
    if(per.clbody.isColision(clbdy))
      per.undoMotion();  
    if(per.clbody.isColision(hi.clheal)){
      sfxdrink.trigger();
      per.curar(); 
      per.ht.activate();
      per.clbody.deactivate();
      hi.toggleActive();
    }  
    if(per.clkick.isColision(clbdy))
      enemy.injure(10);
    if(per.clpnch.isColision(clbdy))
      enemy.injure(5);    
  }
}
