import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.Map;
import java.util.TreeMap;
import java.util.Map.Entry;

PImage onf;
int [] pos_ = new int[100];
String [] title_ = new String[100];
String [] artist_ = new String[100];
int [] key_ = new int[100];
float [] tempo_ = new float[100];
boolean searchTitle = false;
boolean searchArtist = false;
boolean search = true;
boolean keyS = false;
boolean songS = false;
boolean jah = false;
String typed = "";
int r=255;
int g=0;
int b=0;
int searchKey = 1000;
String keyA;

void setup() {
  size(900, 900);
  background(0);
    onf = loadImage("jah.jpg");

  try {
    Scanner file = new Scanner(new File("Desktop/DataProject/data/spotifyData.txt"));
    int i=0;
    while (file.hasNextLine()) {
      String [] ar = file.nextLine().split("\\t");
      tempo_[i]=Float.valueOf(ar[ar.length-3]);
      key_[i]=Integer.parseInt(ar[ar.length-5]);
      artist_[i]=ar[ar.length-6];
      title_[i]=ar[ar.length-7];
      pos_[i]=Integer.parseInt(ar[ar.length-8]);
      i++;
    }
  }
  catch(FileNotFoundException e) {
    println("daB"+e.getMessage());
  }
  finally {
  }
}

void draw() {
  fill(0);
  stroke(0);
  rect(0, 0, 900, 900);
  textSize(25);
  fill(255);
  textAlign(CENTER);
  text("Top 100 Most Streamed Songs on Spotify in 2018", 450, 50);
  if (r==255) {
      r--;
      g++;
    }
    if (r>0 && g>0) {
      r--;
      g++;
    }
    if (g==255) {
      g--;
      b++;
    }
    if (g>0 && b>0) {
      g--;
      b++;
    }
    if (b==255) {
      b--;
      r++;
    }
    if (r>0 && b>0) {
      b--;
      r++;
    }

  //search by artist or title
  if (search == true) {
    textAlign(LEFT);
    text("Search: "+typed, 200, 200);
    text("Song Title", 250, 300);
    text("Artist", 600, 300);
    textAlign(CENTER);
    text("SEARCHING FOR:", 450, 250);
    noFill();
    stroke(255);
    if (searchTitle==true) {
      fill(0, 255, 0);
      rect(225, 285, 15, 15);
    }
    rect(225, 285, 15, 15);
    if (searchArtist == true) {
      fill(0, 255, 0);
      rect(575, 285, 15, 15);
    }
    noFill();
    rect(575, 285, 15, 15);

    //piano
    fill(255);
    text("SEARCH BY KEY:", 450, 450);
    //color change block
    fill(r, g, b);
    noStroke();
    rect(350, 330, 200, 60);
    rect(225, 485, 450, 230);

    stroke(0);
    fill(255);
    textAlign(CENTER, CENTER);
    text("SEARCH", 450, 357);
    textAlign(CENTER);
    rect(240, 500, 60, 200);
    rect(300, 500, 60, 200);
    rect(360, 500, 60, 200);
    rect(420, 500, 60, 200);
    rect(480, 500, 60, 200);
    rect(540, 500, 60, 200);
    rect(600, 500, 60, 200);
    fill(0);
    rect(285, 500, 30, 100);
    rect(345, 500, 30, 100);
    rect(465, 500, 30, 100);
    rect(525, 500, 30, 100);
    rect(585, 500, 30, 100);
  }
  if (keyS == true) {
    textSize(30);
    stroke(255);
    textAlign(CENTER);
    text("Key: "+keyA, 450, 100);
    text("POS", 50, 150);
    text("TITLE", 325, 150);
    text("ARTIST", 650, 150);
    text("TEMPO", 800, 150);
    textSize(15);
    int star = 200;
    for (int i = 0; i < 100; i++) {
      if (key_[i] == searchKey) {
        text(pos_[i], 50, star);
        text(title_[i], 325, star);
        text(artist_[i], 650, star);
        text(tempo_[i], 800, star);
        star+=30;
      }
    }
  }
  if (songS == true) {
    textSize(30);
    stroke(255);
    textAlign(CENTER);
    text("POS", 50, 150);
    text("TITLE", 325, 150);
    text("ARTIST", 650, 150);
    text("TEMPO", 800, 150);
    textSize(15);
    int hey = 200;
    if (searchArtist == true) {
      for (int i = 0; i < 100; i++) {
        if (artist_[i].equals(typed)) {
          text(pos_[i], 50, hey);
          text(title_[i], 325, hey);
          text(artist_[i], 650, hey);
          text(tempo_[i], 800, hey);
          hey+=30;
          if (artist_[i].equals("XXXTENTACION")){
            jah=true;
          }
        }
      }
    }
    if (searchTitle == true) {
      for (int i = 0; i < 100; i++) {
        if (title_[i].equals(typed)) {
          text(pos_[i], 50, hey);
          text(title_[i], 325, hey);
          text(artist_[i], 650, hey);
          text(tempo_[i], 800, hey);
          hey+=30;
        }
      }
    }
  }
  if (jah==true){
  image(onf,183,575,534,300);
  fill(r,g,b);
  textSize(30);
  textAlign(CENTER);
  text("he was 5'6\"",450,430);
  text("gekyume's mixtape is heat",450,460);
  text("jahseh dwayne ricardo onfroy 1998-2018",450,490);
  text("umm guys i miss jah soooo much",450,520);
  text("spotlight uh moonlight uh",450,550);
  textSize(50);
  text("#LLJ",100,600);
  text("#LLJ",800,600);
  text("#LLJ",100,650);
  text("#LLJ",800,650);
  text("#LLJ",100,700);
  text("#LLJ",800,700);
  text("#LLJ",100,750);
  text("#LLJ",800,750);
  text("#LLJ",100,800);
  text("#LLJ",800,800);
  text("#LLJ",100,850);
  text("#LLJ",800,850);
  }
}
void mousePressed() {
  if (search == true) {
    if (mouseX > 225 && mouseX < 240 && mouseY > 285 && mouseY < 300) {
      if (searchTitle==false) {
        searchTitle = true;
        searchArtist = false;
      } else if (searchTitle == true) {
        searchTitle = false;
      }
    }
    if (mouseX > 575 && mouseX < 590 && mouseY > 285 && mouseY < 300) {
      if (searchArtist == false) {
        searchArtist = true;
        searchTitle = false;
      } else if (searchArtist == true) {
        searchArtist = false;
      }
    }
    if (mouseX > 350 && mouseX < 550 && mouseY > 330 && mouseY < 390) {
      search = false;
      songS = true;
    }

    //piano search
    if ((mouseX > 240 && mouseY > 500 && mouseX < 285 && mouseY < 700) || (mouseX > 285 && mouseY > 600 && mouseX < 300 && mouseY < 700)) {
      searchKey = 0;
    } else if ((mouseX > 315 && mouseY > 500 && mouseX < 345 && mouseY < 700) || (mouseX > 300 && mouseY > 600 && mouseX < 315 && mouseY < 700) || (mouseX > 345 && mouseY > 600 && mouseX < 360 && mouseY < 700)) {
      searchKey = 2;
    } else if ((mouseX > 375 && mouseY > 500 && mouseX < 420 && mouseY < 700) || (mouseX > 360 && mouseY > 600 && mouseX < 375 && mouseY < 700)) {
      searchKey = 4;
    } else if ((mouseX > 420 && mouseY > 500 && mouseX < 465 && mouseY < 700) || (mouseX > 465 && mouseY > 600 && mouseX < 480 && mouseY < 700)) {
      searchKey = 5;
    } else if ((mouseX > 495 && mouseY > 500 && mouseX < 525 && mouseY < 700) || (mouseX > 480 && mouseY > 600 && mouseX < 495 && mouseY < 700) || (mouseX > 525 && mouseY > 600 && mouseX < 540 && mouseY < 700)) {
      searchKey = 7;
    } else if ((mouseX > 555 && mouseY > 500 && mouseX < 585 && mouseY < 700) || (mouseX > 540 && mouseY > 600 && mouseX < 555 && mouseY < 700) || (mouseX > 585 && mouseY > 600 && mouseX < 600 && mouseY < 700)) {
      searchKey = 9;
    } else if ((mouseX > 615 && mouseY > 500 && mouseX < 660 && mouseY < 700) || (mouseX > 600 && mouseY > 600 && mouseX < 615 && mouseY < 700)) {
      searchKey = 11;
    }

    if ((mouseX > 285 && mouseY > 500 && mouseX < 315 && mouseY < 600)) {
      searchKey = 1;
    } else if ((mouseX > 345 && mouseY > 500 && mouseX < 375 && mouseY < 600)) {
      searchKey = 3;
    } else if ((mouseX > 465 && mouseY > 500 && mouseX < 495 && mouseY < 600)) {
      searchKey = 6;
    } else if ((mouseX > 525 && mouseY > 500 && mouseX < 555 && mouseY < 600)) {
      searchKey = 8;
    } else if ((mouseX > 585 && mouseY > 500 && mouseX < 615 && mouseY < 600)) {
      searchKey = 10;
    }
    if (searchKey != 1000) {
      search = false;
      keyS = true;
      if (searchKey == 0) {
        keyA = "C";
      } else if (searchKey == 1) {
        keyA = "C#";
      } else if (searchKey == 2) {
        keyA = "D";
      } else if (searchKey == 3) {
        keyA = "D#";
      } else if (searchKey == 4) {
        keyA = "E";
      } else if (searchKey == 5) {
        keyA = "F";
      } else if (searchKey == 6) {
        keyA = "F#";
      } else if (searchKey == 7) {
        keyA = "G";
      } else if (searchKey == 8) {
        keyA = "G#";
      } else if (searchKey == 9) {
        keyA = "A";
      } else if (searchKey == 10) {
        keyA = "A#";
      } else if (searchKey == 11) {
        keyA = "B";
      }
    }
  }
}
void keyPressed() {
  if (key != BACKSPACE) {
    typed+=key;
    typed = typed.replaceAll("[^A-Za-z0-9 \\.\\!\\,\\-()\\[\\]]", "");
  } else if (typed.length()>0) {
    typed=typed.substring(0, typed.length()-1);
  }
}
