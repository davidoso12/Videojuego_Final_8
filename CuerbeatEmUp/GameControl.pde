//Módulo GameControl
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//Descripción: El módulo GameControl tendrá la función de
 //coordinar la ejecución del juego en función de la pantalla
 //activa.
 
 class GameControl{
   int pantact; //es la pantalla activa
   PantPrin pantprin;
   PantGame pantgame;
   PantGamen pantgamen;
   PantLoad pantload;
   PantConfig pantconf;
   PantCredits pantcred;
   PantTopScore panttops;
   PantPause pantpause;
   PantPauses pantpauses;
   PantLife pantlife;
   boolean musicon;
   
   GameControl(){
     pantprin=new PantPrin();
     pantgame=new PantGame();
     pantgamen=new PantGamen();
     pantload=new PantLoad();
     pantconf=new PantConfig();
     pantcred=new PantCredits();
     panttops=new PantTopScore();
     pantpause=new PantPause();
     pantpauses=new PantPauses();
     pantlife=new PantLife();
     musicon=false;
     pantact=PANTLOAD;
   }
   
   void display(){
     switch(pantact){
       case PANTPRIN: pantprin.display();
                      break;
       case PANTGAME: pantgame.display();
                      break;
      case PANTGAMEN: pantgamen.display();
                      break;
       case PANTLOAD: pantload.display();
                      break;
       case PANTCONF: pantconf.display();
                      break;
       case PANTCRED: pantcred.display();
                      break;
       case PANTTOPS: panttops.display();
                      break;
       case PANTPAUS: pantpause.display();
                      break;    
       case PANTPAUSES: pantpauses.display();
                      break;
       case PANTLIFE: pantlife.display();
                      break;
                      
     }
   }
   
   void setPantAct(int p){
     pantact=p;
   }
   
   int getPantAct(){
     return pantact;
   }
   
   void mouseControl(int x,int y, int b){
     switch(pantact){
       case PANTCONF:  pantconf.mouseControl(x,y,b);
                       break;
       case PANTGAME:  pantgame.mouseControl(x,y,b);
                       break;
       case PANTGAMEN: pantgamen.mouseControl(x,y,b);
                       break;
       case PANTPRIN:  pantprin.mouseControl(x,y,b);
                       break;
       case PANTCRED:  pantcred.mouseControl(x,y,b);
                       break;
       case PANTTOPS:  panttops.mouseControl(x,y,b);
                       break;
       case PANTPAUS:  pantpause.mouseControl(x,y,b);
                       break;   
       case PANTPAUSES: pantpauses.mouseControl(x,y,b);
                       break;    
       case PANTLIFE: pantlife.mouseControl(x,y,b);
                       break;
     }                    
   }
   
   void keyControl(char k){
     switch(pantact){
       case PANTGAME: pantgame.keyControl(k);
                      break;
     }  
   }
   
   void keyRelControl(char k){
     switch(pantact){
       case PANTGAME: pantgame.keyRelControl(k);
                      break;
     }  
   }
      void keyControlPantGamen(char W){
     switch(pantact){
       case PANTGAMEN: pantgamen.keyControlPantGamen(W);
                      break;
     }  
   }
   
   void keyRelControlPantGamen(char W){
     switch(pantact){
       case PANTGAMEN: pantgamen.keyRelControlPantGamen(W);
                      break;
     }  
   }
   
   void musicManager(boolean s){
    musicon=s;
    playTrack((musicon?pantact:-1));
  }
  
  void playTrack(int t){
    //cada canción se maneja en bucle, al salir se pausa y regresa al inicio
    if(t==PANTPRIN) mscintro.loop(); else {mscintro.pause(); mscintro.rewind();}
    if(t==PANTGAME) mscstage.loop(); else {mscstage.pause(); mscstage.rewind();}
  }
  
  boolean getMusicStatus(){
    return musicon;
  }
 }
