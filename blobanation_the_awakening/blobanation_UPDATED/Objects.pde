class powerup {
  float pux;
  float puy;
  int type;
  boolean pU;
  powerup(float startx, float starty, int ptype) {
    pux = startx;
    puy = starty;
    type = ptype;
  }


  void drawpup() {
    if (!pU) {
      if (type==1) {
        fill(250, 0, 0);
      }
      if (type==2) {
        fill(0, 250, 0);
      }
      if (type==3) {
        fill(0, 0, 250);
      }
      if (plpupN == 0) {
        ellipse(pux-worldOffsetX, puy-worldOffsetY, 50, 50);
      }
    }
  }
  int getPupType() {
    return type;
  }
  boolean pickedup(float x, float y) {
    if (x+100>=pux-25 - worldOffsetX && y+105>=puy-25 -worldOffsetY && x<=pux+25-worldOffsetX && y<=puy+25-worldOffsetY && !pU && plpupN == 0) {  // if the right edge of the blob is more then the left edge of the power up but the left edge is less then the right edge of the power up  
      pU = true;
      return true;
    } else {
      return false;
    }
  }
}
//gel
class gel {
  float gx;  //gel x
  float gy;  //gel y
  int type;  // gel type
  boolean pU;// picked up?
  gel(float startx, float starty, int gtype) {
    gx = startx;
    gy = starty;
    type = gtype;
  }
  void drawgel() {
    if (!pU) {
      if (type==1) {
        fill(250, 0, 0);
      }
      if (type==2) {
        fill(0, 250, 0);
      }
      if (type==3) {
        fill(0, 0, 250);
      }
      ellipse(gx-worldOffsetX, gy-worldOffsetY, 25, 75);
    }
  }
  int getGelType() {
    return type;
  }
  boolean pickedup(float x, float y) {
    if (x+100>=gx-12.5 - worldOffsetX && y+105>=gy-37.2 -worldOffsetY && x<=gx+12.5-worldOffsetX && y<=gy+37.5-worldOffsetY && !pU) {  // if the right edge of the blob is more then the left edge of the gel up but the left edge is less then the right edge of the power up  
      pU = true;
      return true;
    } else {
      return false;
    }
  }
}
//plat
class plat {
  float px;
  float py;
  float ps;
  int w;
  int h;
  int cs;
  plat(float platX, float platY, int Width, int Height, float scale, int colorscheme) {
    px = platX;
    py = platY;
    ps = scale;
    w = Width;
    h = Height;
    cs = colorscheme;
  }
  boolean isonplt(float x, float y) {
    if (y   + 105/ps >= py - worldOffsetY && y  + 105/ps <= py - worldOffsetY + h/ps &&  x/ps  <= px/ps - worldOffsetX + w/ps && x/ps   + 100/ps >= px/ps - worldOffsetX) {
      return true;
    } else {
      return false;
    }
  }
  void drawplat() {
    noStroke();
    colorMode(RGB, 255, 255, 255);
    if (cs == 1) {
      fill(100);
      rect(px/ps - worldOffsetX, py - worldOffsetY, w/ps, h/ps, 10/ps, 10/ps, 10/ps, 10/ps);
    }
    if (cs == 2) {
      fill(0, 206, 87);
      rect(px/ps - worldOffsetX, py - worldOffsetY, w/ps, h/ps, 10/ps, 10/ps, 10/ps, 10/ps);
    }
  } //Do I need to explain this?
}
//blob
class Blob {
  float x; // Global X variable
  float y; // Global Y variable
  float s; // Global scale variable
  int ent; // Enemy type
  int r; // Red
  int g; // Green
  int b; // Blue
  int eo; // Eye Orientation
  int et; // Eye Timer
  int eh = 50; // Eye Height
  int blt = 0; // Blink Timer
  boolean blink; // Blinking?
  int altblink; // For Alternating
  int blinktime = 240;
  boolean gravity = true;
  float jumping; // Jumping timer
  boolean jump; // Is jumping?
  int chasing; // Direction to run towards after seeing blob
  int ej; // Jumping delay for enemies
  int wyo; // WHAT YOU ON?
  float mX; // Movement speed on the X axis
  float mY; // Movement speed on the Y axis
  Blob(float startx, float starty, float scale, int enemytype, int peffect, float speedY, float speedX) { // Parameters for the class
    x = startx; // Sets the global X variable to the value of the local X variable
    y = starty; // Sets the global Y variable to the value of the local Y variable
    s = scale; // Sets the global scale variable to the value of the local scale variable
    wyo = peffect; // What powerup the blob's on.
    mX = speedX;
    mY = speedY;
    if (enemytype == 0) {
      r = 0;
      g = 255;
      b = 0;
    } else if (enemytype == 1) {
      r = 0;
      g = 0;
      b = 255;
    } else if (enemytype == 2) {
      r = 255;
      g = 0;
      b = 0;
    } else if (enemytype == 3) {
      r = 255;
      g = 255;
      b = 0;
    } else if (enemytype == 4) {
      r = 222;
      g = 0;
      b = 255;
    }
    ent = enemytype;
  }
  void drawblob() {
    colorMode(RGB, 255, 255, 255);
    if (jumping > 0) {
      if (ent == 0) {
        if (y <= 100) {
          worldOffsetY -= mY;
        } else {
          y -= mY/s;
          plY -= mY/s;
        }
      } else {
        y -=mY/s; // Go up
      }
      jumping-=1; // Change the jump timer by one
      if (jumping == 0) {
        jump = false;
      }
    }
    if (ent == 0) {
      if (!grounded(x, y) && gravity) { // Gravity
        if (y >= 300) {
          worldOffsetY += 10;
        } else {
          y+=10;
          plY +=10;
        }
      }
    } else {
      if (!grounded(x-worldOffsetX, y-worldOffsetY)) { // Gravity
        y+=mY/2/s;
      }
    }
    if (blt == blinktime && altblink == 1) {
      blink = true;
      eh+=5; // Makes the blobs eyes open
      if (eh==50) {
        altblink = 0;
        blink = false;
        blt = 0;
        blinktime = int(random(180, 360));
      }
    }
    if (blt == blinktime && altblink == 0) {
      blink = true;
      eh-=5;
      if (eh==0) {
        altblink = 1;
      }
    }
    stroke(0);
    fill(r, g, b);
    if (ent != 0) {
      rect(x/s - worldOffsetX, y - worldOffsetY, 100/s, 105/s, 50/s, 50/s, 10/s, 10/s); // Draws body
      fill(0);
      if (eo==0) {
        rect((x+45)/s  - worldOffsetX, (y+50/s-(eh/s)/2) - worldOffsetY, 10/s, eh/s); // Draws
      } else if (eo==1) { // if looking right
        rect((x+60)/s  - worldOffsetX, (y+50/s-(eh/s)/2) - worldOffsetY, 10/s, eh/s); // Draws eye
      } else if (eo==2) { // if looking left
        rect((x/s+30/s)  - worldOffsetX, (y+50/s-(eh/s)/2) - worldOffsetY, 10/s, eh/s); // Draws eye
      }
    } else {
      rect(x/s, y, 100/s, 105/s, 50/s, 50/s, 10/s, 10/s); // Draws body
      fill(0);
      if (eo==0) {
        rect((x+60)/s, (y+50/s-(eh/s)/2), 5/s, eh/s); // Draws right eye
        rect((x+30)/s, (y+50/s-(eh/s)/2), 5/s, eh/s); // Draws left eye
      } else if (eo==1) { // if looking right
        rect((x+75)/s, (y+50/s-(eh/s)/2), 5/s, eh/s); // Draws right eye
        rect((x+45)/s, (y+50/s-(eh/s)/2), 5/s, eh/s); // Draws left eye
      } else if (eo==2) { // if looking left
        rect((x/s+45/s), (y+50/s-(eh/s)/2), 5/s, eh/s); // Draws right eye
        rect((x/s+15/s), (y+50/s-(eh/s)/2), 5/s, eh/s); // Draws left eye
      }
    }
    et+=1;
    if (!blink) {
      blt +=1;
    }
    if (et == 360) {
      eo = 0;
      et = 0;
    }
  }
  void moveL () { // Makes the blob move left
    if (ent == 0) {
      if (x <= 100) {
        worldOffsetX -=mX;
      } else {
        x -=mX/s; // Moves player to the left 5 pixels
        plX -=mX/s;
      }
    } else if (ent == 4) {
      x -=mX/s; // #Balance
    } else {
      x -= mX/s; //Moves enemies slower than the player
    }
    eo = 2; // Sets the eye orientation to left
    et = 0; // Restarts the eye timer
  }
  void moveR () { // Makes the blob move right
    if (ent == 0) {
      if (x >= 800) {
        worldOffsetX +=mX;
      } else {
        x +=mX/s; // Moves player to the right 5 pixels
        plX+=mX/s;
      }
    } else if (ent == 4) {
      x +=mX/s; // #Balance
    } else {
      x += mX/s; //Moves enemies slower than the player
    }
    eo = 1; // Sets the eye orientation to right
    et = 0; // Restarts the eye timer
  }
  void moveD () { // Makes the blob move right
    if (ent == 0) {
      if (plpupN == 3) {
        if (y >= 300) {
          worldOffsetY += mX;
        } else {
          y += mX/s; // Moves player to the right 5 pixels
          plY+=mX/s;
        }
      }
    } else if (ent == 4) {
      y +=mY/s; // #Balance
    } else {
      y += mY/s; //Moves enemies slower than the player
    }
  }
  void moveU () { // Makes the blob jump
    if (ent == 0) {
      if (!gravity) {
        if (y <= 100) {
          worldOffsetY -= mX;
        } else {
          y -= mX;
          plY -= mX;
        }
      } else if (grounded(x, y)) {
        jump = true;
        jumping = mY;
      }
    } else {
      if (grounded(x-worldOffsetX, y-worldOffsetY)) {
        jump = true;
        jumping = mY;
      }
    }
  }
  void enemyUpdate() {
    if (ent == 0) {
      colorMode(RGB, 255, 255, 255);
      fill(0, 0, 255);
      text(x, 200, 110);
      text(y, 200, 100);
      if (plpupN == 2) {
        g=175;
        mX = 10;
        mY = 30;
      } else if (plpupN == 0) {
        r = 0;
        gravity = true;
        g=250;
        b= 0;
        mX = 5;
        mY = 20;
      } else if (plpupN == 3) {
        r = 252;
        g= 236;
        b = 51;
        gravity = false;
        mX = 20;
      }




      if (key == '`') {
        worldOffsetX = 0;
        worldOffsetY = 0;
        x = 400;
        y = 300;
        plX = 400;
        plY = 300;
      }
      if (plgelN == 3) {
        gela+=1;
        plgelN=0;
      } else if (plgelN == 0) {
      }
    }

    if (ent == 1) {
      if (plX >= x-300  - worldOffsetX && plX <= x-1  - worldOffsetX && chasing == 0  && plY >= y-105 - worldOffsetY) {
        chasing = 1; // Sets chase direction to left
      }
      if (plX <= x+300  - worldOffsetX && plX >= x+1  - worldOffsetX && chasing == 0  && plY >= y-105  - worldOffsetY) {
        chasing = 2; // Sets chase direction to right
      } 
      if (chasing == 1) {
        this.moveL(); // This is obvious
      }
      if (chasing == 2) {
        this.moveR(); // This is also obvious
      }
    }
    if (ent == 2 ) {
      if (plX >= x-700 - worldOffsetX && plX <= x-300 - worldOffsetX && plY >= y-105 - worldOffsetY) {
        this.moveL(); // Checks to see if player is up to 500 pixels to the left and within its sight range. If so, it moves left
      }
      if (plX <= x+700 - worldOffsetX && plX >= x+300 - worldOffsetX && plY >= y-105 - worldOffsetY) {
        this.moveR(); // Checks to see if player is up to 500 pixels to the right and within its sight range. If so, it moves right
      }
      if (plX <= x-1 - worldOffsetX && plX >= x-300 - worldOffsetX && plY >= y-105 - worldOffsetY) {
        this.moveR();
        eo = 2;
      }
      if (plX >= x+0 - worldOffsetX && plX <= x+300 - worldOffsetX && plY >= y-105 - worldOffsetY) {
        this.moveL();
        eo = 1;
      }
    }
    if (ent == 3) {
      ej += 1;
      if (ej == 100) {
        this.moveU();
        ej = 0;
      }
    }
    if (ent == 4 ) {
      if (plX/s >= x/s-700/s - worldOffsetX && plX/s <= x/s-300/s - worldOffsetX && plY >= y-700/s - worldOffsetY) {
        this.moveL(); // Checks to see if player is up to 500 pixels to the left and within its sight range. If so, it moves left
      }
      if (plX/s <= x/s+700/s - worldOffsetX && plX/s >= x/s+300/s - worldOffsetX && plY >= y-700/s - worldOffsetY) {
        this.moveR(); // Checks to see if player is up to 500 pixels to the right and within its sight range. If so, it moves right
      }
      if (plX/s <= x/s+300/s - worldOffsetX && plX/s >= x/s-300/s - worldOffsetX && plY <= y-100/s - worldOffsetY && plX <= x-100 - worldOffsetX || plX >= x+100 - worldOffsetX) {
        if (levelnumber == 0) {
          if (x >= plat1.px && x <= plat1.px + 200 && plat1.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= plat2.px && x <= plat2.px + 200 && plat2.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= plat3.px && x <= plat3.px + 200 && plat3.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= plat4.px && x <= plat4.px + 200 && plat4.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= plat5.px && x <= plat5.px + 200 && plat5.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= plat6.px && x <= plat6.px + 200 && plat6.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= plat7.px && x <= plat7.px + 200 && plat7.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          }
        } else if (levelnumber == 1) {
          if (x >= l2plat1.px && x <= l2plat1.px + 200 && l2plat1.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= l2plat2.px && x <= l2plat2.px + 200 && l2plat2.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= l2plat3.px && x <= l2plat3.px + 200 && l2plat3.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= l2plat4.px && x <= l2plat4.px + 200 && l2plat4.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= l2plat5.px && x <= l2plat5.px + 200 && l2plat5.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= l2plat6.px && x <= l2plat6.px + 200 && l2plat6.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          } else if (x >= l2plat7.px && x <= l2plat7.px + 200 && l2plat7.py <= y) {
            this.moveU(); // Checks if the player is above it, if so it jumps
          }
        }
      }
      if (plX <= x-1 - worldOffsetX && plX >= x-300 - worldOffsetX && plY >= y-705 - worldOffsetY) {
        this.moveR();
        eo = 2;
      }
      if (plX >= x+0 - worldOffsetX && plX <= x+300 - worldOffsetX && plY >= y-700 - worldOffsetY) {
        this.moveL();
        eo = 1;
      }
    }
  }
}
//level
class Level {
  Blob[] el;
  plat[] pl;
  powerup[] pul;
  gel[] gl;
  int ea;
  int pa;
  int pua;
  int ga;
  float lN;
  float wN;
  Level(Blob[] enemylist, plat[] platformlist, powerup[] puplist, gel[] gellist, int enemyamount, int platformamount, int powerupamount, int gelamount, int levelNumber, int worldNumber) {
    el = enemylist;
    pl = platformlist;
    pul = puplist;
    gl = gellist;
    ea = enemyamount;
    pa = platformamount;
    pua = powerupamount;
    ga = gelamount;
    lN = levelNumber;
    wN = worldNumber;
  }
  void levelupdate() {
    if (!overworld) {
      for (int x = pa; x > 0; x -= 1) {
        pl[x-1].drawplat();
      }
      for (int x = ea; x > 0; x -= 1) {
        el[x-1].enemyUpdate();
      }
      player.enemyUpdate();
      for (int x = pua; x > 0; x -= 1) {
        pul[x-1].drawpup();
        if (pul[x-1].pickedup(plX, plY)) {
          plpupN = pul[x-1].getPupType();
          plpupT = 400;
        }
      }
      for (int x = ga; x > 0; x -= 1) {
        gl[x-1].drawgel();
        if (gl[x-1].pickedup(plX, plY)) {
          plgelN = gl[x-1].getGelType();
        }
      }

      for (int x = ea; x > 0; x -= 1) {
        el[x-1].drawblob();
      }
      player.drawblob();
    }
  }
  boolean landed(float blobx, float bloby) {
    for (int x = 0; x < pa; x += 1) {
      if (pl[x].isonplt(blobx, bloby) == true) {
        return true;
      }
    }
    return false;
  }
}
//world
class World {
  Level[] ll; 
  World(Level[] levellist) {
    ll = levellist;
  }
}

//lasers for enemies
class laser {
  //rect(0,0,0,0);
}