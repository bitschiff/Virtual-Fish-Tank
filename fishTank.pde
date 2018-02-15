public class fishTank {
  ArrayList <Tankable> mystuff = new ArrayList<Tankable>();

  protected float ammonia=0;
  protected float myX, myY, myHeight, myLength;



  public fishTank(float x, float y, float h, float l) {
    myX=x;
    myY=y;
    myHeight=h;
    myLength=l;
  }

  void name() {
  }

  float getX() {
    return myX;
  }

  float getY() {
    return myY;
  }

  float getHeight() {
    return myHeight;
  }

  float getLength() {
    return myLength;
  }



  public void update() {
    this.show();//draw fishtanks so like buttons
    for (int i = 0; i<mystuff.size (); i++) {
      if (ammonia>50&&random(500-ammonia)<1&&mystuff.get(i) instanceof fish) {
        ((fish)mystuff.get(i)).kill();
      }
      mystuff.get(i).update();//moves and draws the tankable objects
      if (mystuff.get(i) instanceof bubble == false) {
        for (int j = i+1; j<mystuff.size (); j++) {//check colision for all other objects
          if (mystuff.get(j) instanceof bubble == false) {

            if (mystuff.get(i).hasCollision(mystuff.get(j))==true) {//now implement what to do depending on if it is a bubble fish or pellet and then which type of each


              if (mystuff.get(i).isDead()==false&&mystuff.get(j).isDead()==false) {

                if (mystuff.get(i) instanceof fish && mystuff.get(j) instanceof fish) {
                  for (int b=0; b<random (3); b++) {
                    this.addTankable(new bubble(mystuff.get(i).getX(), mystuff.get(i).getY()));
                  }
                } else if (mystuff.get(i) instanceof pellets && mystuff.get(j) instanceof fish) {
                  for (int b=0; b<random (3); b++) {
                    this.addTankable(new bubble(mystuff.get(i).getX(), mystuff.get(i).getY()));
                  }
                } else if (mystuff.get(i) instanceof fish && mystuff.get(j) instanceof pellets) {
                  for (int b=0; b<random (3); b++) {
                    this.addTankable(new bubble(mystuff.get(i).getX(), mystuff.get(i).getY()));
                  }
                }



                if (mystuff.get(i) instanceof toroidalfinfish == true && mystuff.get(j) instanceof toroidalfinfish== true) {
                  if (floor(random(20))==0&&((fish)mystuff.get(i)).canHaveBaby()==true&&((fish)mystuff.get(j)).canHaveBaby()==true) {
                    f.addTankable(new toroidalfinfish(mystuff.get(i).getX(), mystuff.get(i).getY()));
                    ((fish)mystuff.get(i)).setbabynumber();
                    ((fish)mystuff.get(j)).setbabynumber();
                  }
                } else if (mystuff.get(i) instanceof walefish== true && mystuff.get(j) instanceof walefish== true) {
                  if (floor(random(20))==0&&((fish)mystuff.get(i)).canHaveBaby()==true&&((fish)mystuff.get(j)).canHaveBaby()==true) {
                    f.addTankable(new walefish(mystuff.get(i).getX(), mystuff.get(i).getY()+(mystuff.get(i).getRadius()*2)));
                    ((fish)mystuff.get(i)).setbabynumber();
                    ((fish)mystuff.get(j)).setbabynumber();
                  }
                } else if (mystuff.get(i) instanceof goldfish== true && mystuff.get(j) instanceof goldfish== true) {
                  if (mystuff.get(i) instanceof toroidalfinfish!= true || mystuff.get(j) instanceof toroidalfinfish!= true) {
                    if (floor(random(20))==0&&((fish)mystuff.get(i)).canHaveBaby()==true&&((fish)mystuff.get(j)).canHaveBaby()==true) {
                      ((fish)mystuff.get(i)).setbabynumber();
                      ((fish)mystuff.get(j)).setbabynumber();
                      f.addTankable(new goldfish(mystuff.get(i).getX(), mystuff.get(i).getY()));
                    }
                  }
                }
              }


              if (mystuff.get(i).isDead()==false) {
                if (mystuff.get(j).isDead()==false) {

                  if (mystuff.get(i) instanceof fish) {
                    if (((fish)mystuff.get(i)).tryToEat(mystuff.get(j))==true) {//check if it should eat and then remove
                      mystuff.remove(j);
                      if (j!=0)
                        j--;
                    } else if (mystuff.get(j) instanceof fish) { 
                      if (((fish)mystuff.get(j)).tryToEat(mystuff.get(i))==true) {//check if it should eat and then remove
                        mystuff.remove(i);
                        if (i!=0)
                          i--;
                      }
                    }
                  } else if (mystuff.get(j) instanceof fish) {
                    if (((fish)mystuff.get(j)).tryToEat(mystuff.get(i))==true) {//check if it should eat and then remove
                      mystuff.remove(i);
                      if (i!=0)
                        i--;
                    } else if (mystuff.get(i) instanceof fish) { 
                      if (((fish)mystuff.get(i)).tryToEat(mystuff.get(j))==true) {//check if it should eat and then remove
                        mystuff.remove(j);
                        if (j!=0)
                          j--;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      if (mystuff.get(i).isDead() == true && (mystuff.get(i) instanceof pellets || mystuff.get(i) instanceof bubble)) {
        mystuff.remove(i);
        i--;
      } else if (mystuff.get(i) instanceof bubble == false) {
        ammonia=ammonia+.0003;//change for faster or slower durty tank
      }
    }

    for (int i = 0; i<mystuff.size (); i++) {
      if (mystuff.get(i) instanceof paranhafish)
        ((paranhafish)mystuff.get(i)).setSmalestDist(999, 999);

      for (int j = 0; j<mystuff.size (); j++) {//check colision for all other objects

        if (mystuff.get(i) instanceof paranhafish && mystuff.get(j) instanceof goldfish) {
          if (mystuff.get(j).isDead()==false) {
            if (((paranhafish)mystuff.get(i)).getSmalestDist()>dist(mystuff.get(i).getX(), mystuff.get(i).getY(), mystuff.get(j).getX(), mystuff.get(j).getY())) {
              ((paranhafish)mystuff.get(i)).setSmalestDist(mystuff.get(j).getX()-mystuff.get(i).getX(), mystuff.get(j).getY()-mystuff.get(i).getY());
              PVector newSpeed = new PVector(mystuff.get(j).getX()-mystuff.get(i).getX(), mystuff.get(j).getY()-mystuff.get(i).getY());
              newSpeed.setMag(((fish)mystuff.get(i)).getVector().mag());
              ((fish)mystuff.get(i)).setVector(newSpeed.x, newSpeed.y);
            }
          }
        }
      }
    }
  }


  public void show() {
    color  blue = color(153, 255, 255);
    color green = color(0, 0, 100);

    // colorMode(HSB);
    background(lerpColor(blue, green, ammonia/100));
    //    colorMode(RGB);



    //noStroke();

    //buttons
    fill(0, 200, 100);
    rect(600, 0, 700, 600);
    //stroke(1);

    fill(0, 200, 100);
    rect(600, 0, 700, 600);

    fill(0, 255, 200);
    rect(625, 25, 50, 50);
    text("Sprinkle Food", 625, 20);

    fill(255, 0, 0);
    rect(625, 100, 50, 50);
    text("Sprinkle Poison", 625, 95);

    fill(255, 255, 255);
    rect(625, 175, 50, 50);
    text("Tap the Tank", 625, 170);

    fill(0, 0, 255);
    rect(625, 250, 50, 50);
    text("Clean Tank", 625, 245);

    fill(0, 0, 0);
    rect(625, 325, 25, 25);
    text("gold", 625, 320);


    fill(0, 0, 0);
    rect(675, 325, 25, 25);
    text("whale", 675, 320);

    fill(0, 0, 0);
    rect(625, 375, 25, 25);
    text("parana", 625, 370);

    fill(0, 0, 0);
    rect(675, 375, 25, 25);
    text("Toroidal", 675, 370);
    //end buttons
  }

  public void addTankable(Tankable t) {
    mystuff.add(t);
  }

  public void cleanTheTank() {
    ammonia=0;//reset ammonia
    for (int i = 0; i<mystuff.size (); i++) {
      if (mystuff.get(i).isDead()==true) {
        mystuff.remove(i);
        i--;
      }
    }
  }

  public void tapTheTank() {
    for (Tankable t : mystuff) {
      t.changeDirection();
    }
    for (int i=0; i<random (3); i++)
      this.addTankable(new bubble(mouseX, mouseY));
  }//end tapthetank
}