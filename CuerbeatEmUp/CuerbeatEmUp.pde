//Proyecto Cuerbeat 'Em Up
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: Cuerbeat 'Em Up es un juego donde controlaremos
// un personaje, quien resolverá un par de escenas enfrentando
// enemigos con golpes y patadas.
import ddf.minim.*;

final int IDESP=0;
final int IDENG=1;
final int PANTPRIN=0;
final int PANTGAME=1;
final int PANTLOAD=2;
final int PANTCONF=3;
final int PANTCRED=4;
final int PANTTOPS=5;
final int PANTPAUS=6;
final int PANMWALK=0;
final int PANMDEAD=1;
final int PANMDEFN=2;
final int PANMHITD=3;
final int PANMPNCH=4;
final int PANMKICK=5;
final int PANMJUMP=6;
final int PANMFALL=7;
final int COLATCK=0;
final int COLBODY=1;
final int COLDEFN=2;
final int COLHEAL=3;

PImage icon;
PFont typtitle;
GameControl gc;
Idiomas idi;
ConfigFiles cf;
Bitacora bit;

Minim audio;
//AudioOutput audout;
AudioPlayer mscintro;
AudioPlayer mscstage;
AudioSample sfxclic;
AudioSample sfxdrink;

void setup(){
  icon=loadImage("sprite/misc/icon.png");
  size(1280,720);
  //windowMove(2100,100);
  windowTitle("Proyecto Dario");
  surface.setIcon(icon);
  typtitle=createFont("Arial",32);
  textFont(typtitle);
  cf=new ConfigFiles();
  idi=new Idiomas(cf.lang,cf.ns);
  gc=new GameControl();
  bit=new Bitacora(cf.logstate);
  audio=new Minim(this);
  thread("loadAudio");
}

void draw(){
  gc.display();
}

void mouseReleased(){
  gc.mouseControl(mouseX,mouseY,mouseButton);
}

void keyReleased(){
  gc.keyRelControl(key);
}

void keyPressed(){
  gc.keyControl(key);
}

void music(){
  if(!gc.getMusicStatus())
    gc.musicManager(true);
}

void loadAudio(){
  gc.pantload.msg=7;
  sfxclic=audio.loadSample("sound/sfx/click.mp3");
  sfxclic.setGain(1.0);
  sfxdrink=audio.loadSample("sound/sfx/drink.mp3");
  sfxdrink.setGain(1.0);
  gc.pantload.msg=8;
  mscintro=audio.loadFile("sound/music/intro_2.mp3");
  mscintro.setGain(-5.0);
  mscintro.setBalance(0.0);
  mscstage=audio.loadFile("sound/music/stage_2.mp3");
  mscstage.setBalance(-1.0);
  mscstage.setGain(0.0);
  gc.pantload.msg=9;
  gc.pantload.loading=false;
}

void exit(){
  bit.cierraBitacora();
  super.exit();
}
