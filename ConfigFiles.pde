//Módulo ConfigFiles 
//Elaborado por: David Osorio Gutierrez
//Fecha de creación: 6 de septiembre de 2023 
//Fecha de última modificacion: 3 de diciembre de 2023
//comentario: Define la clase ConfigFiles, la cual permite 
//configurar ciertas características del juego para que sean 
//cargadas durante el arranque
class ConfigFiles{
  String file[];
  String save;
  //parámetros a salvar (la lista irá creciendo)
  int lang;          //idioma activo en valor numérico directo
  int ns;            //número de mensajes de idiomas
  int nl;            //número de idiomas
  int spdx;          //velocidad horizontal del personaje
  int spdy;          //velocidad vertical del personaje
  int []pp;          //vector de duración animacion personaje golpe
  int []pk;          //vector de duración animacion personaje patada
  int maxhp;         //vida máxima del personaje
  int heal;          //factor de curación
  int injure;        //factor de herida
  int prpx;          //coordenada relativa x del colisionador de golpe  
  int prpy;          //coordenada relativa y del colisionador de golpe
  int pcps;          //tamaño del colisionador de golpe
  int prkx;          //coordenada relativa x del colisionador de patada
  int prky;          //coordenada relativa y del colisionador de patada
  int pcks;          //tamaño del colisionador de patada
  int pcbs;          //tamaño del colisionador de cuerpo del personaje
  int pcds;          //tamaño del colisionador de defensa del personaje
  int btnw;          //ancho estandar de botón
  int btnh;          //altura estandar de botón
  int hcs;           //tamaño del colisionador de item curativo
  boolean drwc;      //indica si se grafican o no los colisionadores
  int itime;         //duración de inactividad del colisionador al ser herido
  int htime;         //duración de inactividad del colisionador al ser curado
  boolean logstate;  //estado de la bitacora
  
  ConfigFiles(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  void loadConfig(){
    int i;
    for(i=0;i<file.length;i++){
      if(isData("language",i)) lang=loadData(i);
      if(isData("langstr",i))  ns=loadData(i);
      if(isData("spdx",i))     spdx=loadData(i);
      if(isData("spdy",i))     spdy=loadData(i);
      if(isData("pp",i))       pp=loadVectorData(i);
      if(isData("pk",i))       pk=loadVectorData(i);
      if(isData("maxhp",i))    maxhp=loadData(i);
      if(isData("heal",i))     heal=loadData(i);
      if(isData("injure",i))   injure=loadData(i);
      if(isData("prpx",i))     prpx=loadData(i);
      if(isData("prpy",i))     prpy=loadData(i);
      if(isData("pcps",i))     pcps=loadData(i);
      if(isData("prkx",i))     prkx=loadData(i);
      if(isData("prky",i))     prky=loadData(i);
      if(isData("pcks",i))     pcks=loadData(i);
      if(isData("pcbs",i))     pcbs=loadData(i);
      if(isData("pcds",i))     pcds=loadData(i);
      if(isData("btnw",i))     btnw=loadData(i);
      if(isData("btnh",i))     btnh=loadData(i);
      if(isData("hcs",i))      hcs=loadData(i);
      if(isData("drwc",i))     drwc=loadBoolData(i);
      if(isData("itime",i))    itime=loadData(i);
      if(isData("htime",i))    htime=loadData(i);
      if(isData("logstate",i)) logstate=loadBoolData(i);
    }
  }
  
  boolean isData(String s,int d){
    return split(file[d],'=')[0].equals("#"+s);
  }
  
  int loadData(int d){
    return int(split(file[d],'=')[1]);
  }
  
  boolean loadBoolData(int d){
    return split(file[d],'=')[1].equals("ON");
  }
  
  String loadStringData(int d){
    return split(file[d],'=')[1];
  }
  
  float loadFloatData(int d){
    return float(split(file[d],'=')[1]);
  }
  
  int []loadVectorData(int d){
    String s=split(file[d],'=')[1];
    int t=int(split(s,',')[0]);
    int v[]=new int[t];
    for(int i=1;i<=t;i++)
      v[i-1]=int(split(s,',')[i]);
    return v;
  }
  
  void saveConfig(Idiomas i){
    lang=i.getIdioma();
    save="";
    addSave("language",lang);
    addSave("langstr" ,ns);
    addSave("spdx"    ,spdx);
    addSave("spdy"    ,spdy);
    addSave("pp"      ,pp);
    addSave("pk"      ,pk);
    addSave("maxhp"   ,maxhp);
    addSave("heal"    ,heal);
    addSave("injure"  ,injure);
    addSave("prpx"    ,prpx);
    addSave("prpy"    ,prpy);
    addSave("pcps"    ,pcps);
    addSave("prkx"    ,prkx);
    addSave("prky"    ,prky);
    addSave("pcks"    ,pcks);
    addSave("pcbs"    ,pcbs);
    addSave("pcds"    ,pcds);
    addSave("btnw"    ,btnw);
    addSave("btnh"    ,btnh);
    addSave("hcs"     ,hcs);
    addSave("drwc"    ,drwc);
    addSave("itime"   ,itime);
    addSave("htime"   ,htime);
    addSave("logstate",logstate);
    file=split(save, ';');
    saveStrings("data/config.dat",file);
  }
    
  void addSave(String s,int d){
    save=save+"#"+s+"="+d+";";
  }
  
  void addSave(String s,boolean d){
    save=save+"#"+s+"="+((d)?"ON":"OFF")+";";
  }
  
  void addSave(String s,String d){
    save=save+"#"+s+"="+d+";";
  }
  
  void addSave(String s,float d){
    save=save+"#"+s+"="+d+";";
  }
  
  void addSave(String s,int []d){
    String c=""+d.length;
    for(int i=0;i<d.length;i++)
      c=c+','+d[i];
    save=save+"#"+s+"="+c+";";
  }
}
