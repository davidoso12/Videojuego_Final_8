//Módulo LifeBar
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//comentario: Se implementa una barra de vida para controlar la salud del
// personaje y los enemigos.

class LifeBar{
  int maxhp;
  int hp;
  Punto2D pos;
  Punto2D sze;
  boolean dead;
  color colhlt;
  color colbld;
  
  LifeBar(int mhp,Punto2D p,Punto2D s,color ch,color cb){
    hp=maxhp=mhp;
    pos=new Punto2D(p);
    sze=new Punto2D(s);
    dead=false;
    colhlt=ch;
    colbld=cb;
  }
  
  void display(){
    rectMode(CENTER);
    stroke(colhlt);
    fill(colbld);
    rect(pos.getX(),pos.getY(),sze.getX(),sze.getY());
    rectMode(CORNER);
    fill(colhlt);
    rect(pos.getX()-sze.getX()/2+1,pos.getY()-sze.getY()/2+1,
         int(sze.getX()*hp*1.0/maxhp)-2,sze.getY()-2);
  }
  
  void heal(int h){
    hp+=h;
    if(hp>maxhp)
      hp=maxhp;
  }
  
  boolean injure(int h){
    hp-=h;
    dead=hp<=0;
    if(dead)
      hp=0;
    return dead;  
  }
  
  boolean isDead(){
    return dead;
  }
}
