int platX;//Platforms X and Y variables. //<>//
int platY;
float worldOffsetX; // For side-scrolling
float worldOffsetY; // For scrolling up.
float plX = 400; // Player X
float plY = 300; // Player Y
float hCX=400;
float hCY=300;
int hCO;
int plpupN = 0;
int plgelN = 0;
int plpupT = 0;
int pleasHelp;
float sC = 1; //Scale control
int levelamount = 2; //Number of levels
boolean overworld = true; //If you're in the Overworld
boolean inventory = false;
int levelnumber = 0;
float uSpeedy = 5; // Player Movement speed
float tooSpeedy = 20; // Player jumpin stuff
int gela;  //the amount of gel the player has
Level[] levellist = new Level[levelamount];
Blob player = new Blob(plX, plY, sC, 0, plpupN, tooSpeedy, uSpeedy); // Creates the player

//     _       _       __        _
// |  |_ |  | |_ |    |  | |\ | |_
// |_ |_  ||  |_ |_   |__| | \| |_
plat[] level1plats = new plat[8];
Blob[] level1enemys = new Blob[3];
powerup[] level1powerups = new powerup[2];
gel[] level1gel = new gel[1];

//PLATS
plat platground = new plat(-2000, 400, 5000, 300, sC, 2); //The floor
plat plat1 = new plat(200, 278, 200, 50, sC, 1);
plat plat2 = new plat(563, 234, 200, 50, sC, 1);
plat plat3 = new plat(200, 120, 200, 50, sC, 1);
plat plat4 = new plat(800, 120, 200, 50, sC, 1);
plat plat5 = new plat(-800, 200, 200, 50, sC, 1);
plat plat6 = new plat(-250, 120, 200, 50, sC, 1);
plat plat7 = new plat(1300, 250, 200, 50, sC, 1);

//ENEMYS
Blob enemy1 = new Blob(300, 150, sC, 2, 0, 20, 3); // Creates an enemy blob
Blob enemy2 = new Blob(600, 200, sC, 3, 0, 20, 3); // Creates another enemy blob
Blob enemyCrab = new Blob(1000, 300, sC, 4, 0, 20, 3); // Creates the perfect enemy blob

//POWERUPS
powerup powerup1 = new powerup(200, 300, 2);  //Creates powerup 1
powerup powerup2 = new powerup(900, 300, 1);  //Creates powerup 2

//GEL
gel gel1 = new gel(600, 300, 3);  //Creates gel 1

//     _       _      ___         __
// |  |_ |  | |_ |     |   | | | |  |
// |_ |_  ||  |_ |_    |    | |  |__|
plat[] level2plats = new plat[9];
Blob[] level2enemys = new Blob[4];
powerup[] level2powerups = new powerup[1];
gel[] level2gel = new gel[1];

// PLATS
plat platground2 = new plat(-2000, 400, 5000, 300, sC, 2); //The floor
plat l2plat1 = new plat(150, 280, 200, 50, sC, 1);
plat l2plat2 = new plat(700, 240, 200, 50, sC, 1);
plat l2plat3 = new plat(300, 120, 200, 50, sC, 1);
plat l2plat4 = new plat(800, 120, 200, 50, sC, 1);
plat l2plat5 = new plat(-700, 200, 200, 50, sC, 1);
plat l2plat6 = new plat(-250, 120, 200, 50, sC, 1);
plat l2plat7 = new plat(1300, 250, 200, 50, sC, 1);
plat l2plat8 = new plat(400, 250, 200, 50, sC, 1);

//ENEMYS
Blob l2enemy1 = new Blob(300, 150, sC, 2, 0, 20, 4); // Creates an enemy blob
Blob l2enemy2 = new Blob(400, 0, sC, 3, 0, 20, 4); // Creates another enemy blob
Blob l2enemy3 = new Blob(850, 30, sC, 1, 0, 20, 4); // Creates a third enemy blob
Blob l2enemy4 = new Blob(1350, 250, sC, 4, 0, 20, 3); // Creates the perfect enemy blob

//POWERUPS
powerup l2pup1 = new powerup(400, 500, 2); //Creates powerup 1

gel l2gel1 = new gel(400, 500, 2); //Creates gel 1

Level level1;
Level level2;



void setup() {
  size(1000, 600); //Sets size to 1000 by 600
  background(17, 255, 255); 

  //     _       _       __        _
  // |  |_ |  | |_ |    |  | |\ | |_
  // |_ |_  ||  |_ |_   |__| | \| |_

  //PLATS
  level1plats[0] = plat1;
  level1plats[1] = plat2;
  level1plats[2] = plat3;
  level1plats[3] = plat4;
  level1plats[4] = plat5;
  level1plats[5] = plat6;
  level1plats[6] = plat7;
  level1plats[7] = platground;

  //GLOBS
  level1enemys[0] = enemy1;
  level1enemys[1] = enemy2;
  level1enemys[2] = enemyCrab;

  //PUPS
  level1powerups[0] = powerup1;
  level1powerups[1] = powerup2;

  //gel
  level1gel[0] = gel1;

  //ACTUAL LEVEL CREATION
  level1 = new Level(level1enemys, level1plats, level1powerups, level1gel, 3, 8, 2, 1, 100, 100);

  //     _       _      ___         __
  // |  |_ |  | |_ |     |   | | | |  |
  // |_ |_  ||  |_ |_    |    | |  |__|

  //PLATS
  level2plats[0] = l2plat1;
  level2plats[1] = l2plat2;
  level2plats[2] = l2plat3;
  level2plats[3] = l2plat4;
  level2plats[4] = l2plat5;
  level2plats[5] = l2plat6;
  level2plats[6] = l2plat7;
  level2plats[7] = l2plat8;
  level2plats[8] = platground2;

  //GLOBS
  level2enemys[0] = l2enemy1;
  level2enemys[1] = l2enemy2;
  level2enemys[2] = l2enemy3;
  level2enemys[3] = l2enemy4;

  //PUPS
  level2powerups[0] = l2pup1;

  level2gel[0] = l2gel1;

  //ACTUAL LEVEL CREATION
  level2 = new Level(level2enemys, level2plats, level2powerups, level2gel, 4, 9, 1, 1, 100, 200);



  //Level list
  levellist[0] = level1;
  levellist[1] = level2;
}

void draw() { // Hopefully I don't need to explain what this does
  colorMode(RGB, 255, 255, 255); 
  background(17, 255, 255); 

  if (plpupT > 0) {
    plpupT -= 1;
  }
  if (plpupT == 0) {
    plpupN = 0;
  }
  if (mousePressed && overworld == true) {
    overworld = false;
  }
  if (!overworld) {
    levellist[levelnumber].levelupdate();
  } else {
    for (int x = levelamount; x > 0; x -= 1) {
      levellist[x-1].levelupdate();
    }
    colorMode(RGB, 255, 255, 255);
    fill(50);
    if (hCO == 0) {
      rect(hCX-12.5, hCY-25, 25, 50);
    } else if (hCO == 1) {
      rect(hCX-25, hCY-12.5, 50, 25);
    }
  }
  if (!inventory) {
    movement();
  }
  if (inventory) {
    fill(100);
    rect(30, 30, 940, 540);
  }
  text(gela, 300, 300);
}

void keyPressed() {
  if (key == 'E'|| key =='e') {
    if (!inventory) {
      inventory = true;
    } else if (inventory) {
      inventory = false;
    }
  }
  if (key == 'V'|| key =='v') {
    plpupT = 1000;
    plpupN = 3;
    
  }
}