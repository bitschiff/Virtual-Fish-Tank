class goldfish extends fish
{

  goldfish() {
    PVposition.set(random(500) + 51, random(500) + 51);
    fweight=(randomGaussian() * (.25*10))+10;
    fmaxWeight=(randomGaussian() * (.25*30))+30;
    fage=0;
    fmaxAge=(randomGaussian() * (.25*20000))+20000;
    String names[] = loadStrings("names.txt");
    String[] m = match(names[floor(random(names.length))], "(.*?),");
    fname=m[0] + " goldfish";
    fDead=false;
    fr=(randomGaussian() * (.25*156))+156;
    fg=(randomGaussian() * (.25*128))+128;
    fb=0;
    fcanHaveBaby=false;
    PVmove.set((randomGaussian() * (.25*(sqrt(3)/2)))+(sqrt(3)/2), (randomGaussian() * (.25*(sqrt(3)/2)))+(sqrt(3)/2));
    if (random(2)>1)
      PVmove.set(PVmove.x*-1, PVmove.y);
    if (random(2)>1)
      PVmove.set(PVmove.x, PVmove.y*-1);
  }

  goldfish(float xx, float yy) {
    PVposition.set(xx, yy);
    fweight=(randomGaussian() * (.25*10))+10;
    fmaxWeight=(randomGaussian() * (.25*30))+30;
    fage=0;
    fmaxAge=(randomGaussian() * (.25*20000))+20000;
    String names[] = loadStrings("names.txt");
    String[] m = match(names[floor(random(names.length))], "(.*?),");
    fname=m[0] + " goldfish";
    fDead=false;
    fr=(randomGaussian() * (.25*156))+156;
    fg=(randomGaussian() * (.25*128))+128;
    fb=0;
    fcanHaveBaby=false;
    PVmove.set((randomGaussian() * (.25*(sqrt(3)/2)))+(sqrt(3)/2), (randomGaussian() * (.25*(sqrt(3)/2)))+(sqrt(3)/2));
    if (random(2)>1)
      PVmove.set(PVmove.x*-1, PVmove.y);
    if (random(2)>1)
      PVmove.set(PVmove.x, PVmove.y*-1);
  }

  void go()
  {
    this.move();
    // super.display();
  }

  boolean tryToEat(Tankable t) {
    if (t instanceof fish) {//check if it is any fish
      if (t instanceof goldfish) {//check if it is any fish



        if (t.getX()>this.getX())
          PVmove.set(abs(PVmove.x)*-1, PVmove.y);
        else if (t.getX()<this.getX())
          PVmove.set(abs(PVmove.x), PVmove.y);

        if (t.getY()>this.getY())
          PVmove.set(PVmove.x, abs(PVmove.y)*-1);
        else if (t.getY()<this.getY())
          PVmove.set(PVmove.x, abs(PVmove.y));



        // this.changeDirection();
      } else if (t instanceof paranhafish) {//check if it is any fish
      } else if (t instanceof walefish) {//check if it is any fish
      } else if (t instanceof toroidalfinfish) {//check if it is any fish
      }
    } else if (t instanceof pellets) {// check if it is any pellet
      this.setWeight(((pellets)t).effect());
      return true;
    } else if (t instanceof bubble) {// check if it is any bubble
    }

    return false;
  }


  void move() {

    if (floor(random(100)) == 1)
      fcanHaveBaby = true;

    if (floor(random(15)) == 0 && fDead == false)
    {
      if (floor(random(12)) == 0)
        PVmove.set(PVmove.x, PVmove.y*-1);

      if (floor(random(12)) == 0)
        PVmove.set(PVmove.x*-1, PVmove.y);
    }


    this.tooSkinny();
    
    
      if (fDead == true) {
      // ypos += -2;
      PVmove.set(0, -2);
    } 
    super.display();
    if (fweight / 2 >= PVposition.y&&fDead == true) {
      PVmove.set(0, 0);
    } else if (fmaxAge < fage || fmaxWeight < fweight) {
      fDead = true;
    } else {
      fage += 1;
      fweight += .01;
    }



    if (fDead == false)
    {     
      if (600 - (fweight / 2) <= PVposition.x) {
        PVmove.set(abs(PVmove.x)*-1, PVmove.y);
      } else if (600 - (fweight / 2) <= PVposition.y) {
        PVmove.set(PVmove.x, abs(PVmove.y)*-1);
      } else if (fweight / 2 >= PVposition.y) {
        PVmove.set(PVmove.x, abs(PVmove.y));
      } else if (fweight / 2 >= PVposition.x) {
        PVmove.set(abs(PVmove.x), PVmove.y);
      }
    }

    PVposition.set(PVmove.x+PVposition.x, PVmove.y+PVposition.y);
  }
}