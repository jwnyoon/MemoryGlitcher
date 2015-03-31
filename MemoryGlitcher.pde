
import ddf.minim.*;

Minim minim;
AudioPlayer player;

String file = sketchPath("data/john2.mp3");

byte[] raw;
boolean overBox = false;
boolean locked = false;
int k;

void setup() {
  size(800, 618);
  background(0);
  textSize(32);
  text("FRAGMENTING>>>", width/2-120, 120, 100); 
  textSize(15);
  text("File Directory: /Jiwon/memory/john/voices/calling_my_name.wav", 30, 30, 100); 
  
  
  minim = new Minim(this);
  loadAudio();
}

void loadAudio() {
  player = minim.loadFile(file);
  raw = loadBytes(file);
}

void playAudio() {
  player.play();
}

void draw() {
  if (mouseX > width/2-100 && mouseX < width/2+100 && 
      mouseY > height/2-100 && mouseY < height/2+100) {
    overBox = true;  
    if(!locked) { 
      ellipse(width/2,height/2+40,200,200);
      stroke(255); 
      fill(160);
      
      ellipse(width/2,height/2+25,200,200);
       stroke(30);
       fill(55,100);
    
    } 
  } else {
      ellipse(width/2,height/2+40,200,200);
    stroke(153);
    fill(153);
    overBox = false;
      ellipse(width/2,height/2+25,200,200);
       stroke(30);
       fill(55);
  }
  

}

void closeAudio() {
  player.close();
}

void glitchAudio(int n, int m ) {
  for(int i = 0; i < n; i++) {
    int p = (int)random(raw.length);
    
    for(int j = p; j < p+m; j++){
      if(j>= raw.length) break;
      raw[j] = (byte)0x00;
    }
  }
  saveBytes(file, raw);
}

  

void mousePressed() {
  closeAudio();
  glitchAudio(100, 20);
  loadAudio();
  playAudio();
  k++;
  print(k);

  
    if(overBox) { 
    locked = true; 
    //ellipse(width/2,height/2+30,200,200);
    fill(250);
    stroke(250,100);
    ellipse(width/2,height/2+25,200,200);
    textSize(70);
    fill(0,100);
      text(k, width/2-20,height/2+45);

  } else {
    locked = false;

    
  }
}

