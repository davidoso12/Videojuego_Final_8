//Módulo Personaje
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//comentario: se implementa la clase Personaje con el propósito de organizar los
//datos y procesos inherentes al mismo
class Personaje{
  Punto2D pos;
  Punto2D sze;
  Punto2D undo;
  boolean movedx;
  boolean rb;
  int view;
  LifeBar lb;
  Colisionador clbody;
  Colisionador clpnch;
  Colisionador clkick;
  Colisionador cldefn;
  Temporizador it;
  Temporizador ht;
  AnimationStructure anistr;
    
  Personaje(int x,int y,int w,int h){
    pos=new Punto2D(x,y);
    sze=new Punto2D(w,h);
    undo=new Punto2D(0,0);
    movedx=false;
    rb=false;
    lb=new LifeBar(cf.maxhp,new Punto2D(210,50),new Punto2D(300,40),color(233,255,0),color(255,0,0));
    clbody=new Colisionador(pos,new Punto2D(0,0),cf.pcbs,COLBODY);
    clpnch=new Colisionador(pos,new Punto2D(cf.prpx,cf.prpy),cf.pcps,COLATCK);
    clkick=new Colisionador(pos,new Punto2D(cf.prkx,cf.prky),cf.pcks,COLATCK);
    cldefn=new Colisionador(pos,new Punto2D(0,0),cf.pcds,COLDEFN);
    clpnch.toggleActive();
    clkick.toggleActive();
    it=new Temporizador(cf.itime);
    ht=new Temporizador(cf.htime);
    anistr=new AnimationStructure();
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_walk/",
                        "prota_camina",8,".png",7,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_dead/",
                        "dead",5,".png",6,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_defense/",
                        "idle",5,".png",15,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_hit/",
                        "attack_",3,".png",18,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_punch/",
                        "attack_",6,".png",cf.pp,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_kick/",
                        "attack_",3,".png",cf.pk,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_jump/",
                        "jump_",8,".png",7,false,0));
    anistr.addSpriteSet(new SpriteSet("sprite/sprites/animation/prota/pro_fall/",
                        "fall_",3,".png",7,false,0));
    view=RIGHT;                    
  }
  
  void display(){
    if(view==RIGHT)
      anistr.display(relativeX(),sze);
    else
      anistr.flipXDisplay(relativeX(),sze);
    clpnch.setXRN(view); 
    clkick.setXRN(view); 
    lb.display();  
    if(lb.isDead())
      text("Muerto",640,100);
    if(cf.drwc){  
      clbody.drawAreaColision();
      clpnch.drawAreaColision();
      clkick.drawAreaColision();
      cldefn.drawAreaColision();
    }
    checkTemp(it);
    checkTemp(ht); 
  }
  
  void checkTemp(Temporizador t){
    if(t.isActive())
      t.coolingDown();
    if(t.isOff()){
      t.deactivate();
      clbody.activate();
    }  
  }
  
  Punto2D relativeX(){
    return (((pos.getX()>640 && !rb) && view==RIGHT)?new Punto2D(640,pos.getY()):pos);
  }
  
  void moverColisionadores(int x,int y){
    clbody.moverCol(x,y);
    clpnch.moverCol(x,y);
    clkick.moverCol(x,y);
    cldefn.moverCol(x,y);
  }
  
  void moverColisionadores(Punto2D p){
    clbody.moverCol(p);
    clpnch.moverCol(p);
    clkick.moverCol(p);
    cldefn.moverCol(p);
  }
  
  void moverPer(int x,int y){
    pos.moverP(x,y);
    moverColisionadores(x,y);
  }
  
  void reachedBorder(){
   rb=true;
  }
  
  void keyControl(char k){
    if(!anistr.isIdle())
      anistr.toggleActiveAnimation();
    switch(k){
      //golpe
      case 'q':
      case 'Q': anistr.setActiveSpriteSet(PANMPNCH);
                anistr.setIdle(false);
                break;
      //patada          
      case 'e':
      case 'E': anistr.setActiveSpriteSet(PANMKICK);
                anistr.setIdle(false);
                break;
      //caminar arriba          
      case 'w':
      case 'W': if(pos.getY()>250){
                  moverPer(0,-cf.spdy);
                  undo.setPunto(new Punto2D(0,cf.spdy));
                  anistr.setActiveSpriteSet(PANMWALK);
                  anistr.setIdle(false);
                }  
                break;
      //caminar izquierda          
      case 'a':
      case 'A': view=LEFT;
                if(pos.getX()>50){
                  moverPer(-cf.spdx,0);
                  undo.setPunto(new Punto2D(cf.spdx,0));
                  anistr.setActiveSpriteSet(PANMWALK);
                  anistr.setIdle(false);
                }  
                break;
      //caminar abajo          
      case 's':
      case 'S': if(pos.getY()<640){
                  moverPer(0,cf.spdy);
                  undo.setPunto(new Punto2D(0,-cf.spdx));
                  anistr.setActiveSpriteSet(PANMWALK);
                  anistr.setIdle(false);
                }
                break;
      //caminar derecha          
      case 'd':
      case 'D': view=RIGHT;
                if(pos.getX()<1230){
                  if(pos.getX()<=640 || rb){
                    moverPer(cf.spdx,0);
                  }  
                  movedx=true;
                  undo.setPunto(new Punto2D(-cf.spdx,0));
                  anistr.setActiveSpriteSet(PANMWALK);
                  anistr.setIdle(false);
                }  
                break;
      //saltar
      case ' ': anistr.setActiveSpriteSet(PANMJUMP);
                anistr.setIdle(false);
                break;
    }
  }
  
  void keyRelControl(char k){
    switch(k){
      //golpe
      case 'q':
      case 'Q': break;
      //patada
      case 'e':
      case 'E': break;
      //caminar arriba
      case 'w':
      case 'W': anistr.setIdle(true);
                break;
      //caminar izquierda          
      case 'a':
      case 'A': anistr.setIdle(true);
                break;
      //caminar abajo          
      case 's':
      case 'S': anistr.setIdle(true);
                break;
      //caminar derecha          
      case 'd':
      case 'D': anistr.setIdle(true);
                movedx=false;
                break;
      //salto          
      case ' ': break;
      case '1': clbody.activate();  
                break;
      case '2': curar();
                break;
    }
  }
  
  void herir(){
    if(lb.injure(cf.injure)){
      anistr.setActiveSpriteSet(PANMDEAD);
      sfxclic.trigger();
      anistr.setIdle(false);  
    }
  }
  
  void curar(){
    lb.heal(cf.heal);
  }
  
  void undoMotion(){
    pos.moverP(undo);
    moverColisionadores(undo);
  }
  
  boolean hasMovedX(){
    return movedx && pos.getX()>=640;
  }
}
