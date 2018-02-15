class paranhafish extends fish
{

  private PVector smalestDist = new PVector(999, 999);

  paranhafish() {
    PVposition.set(random(500) + 51, random(500) + 51);
    fweight=(randomGaussian() * (.25*15))+15;
    fmaxWeight=(randomGaussian() * (.25*50))+50;
    fage=0;
    fmaxAge=(randomGaussian() * (.25*10000))+10000;
    String names[] = loadStrings("names.txt");
    String[] m = match(names[floor(random(names.length))], "(.*?),");
    fname=m[0] + " paranha";
    fDead=false;
    fr=(randomGaussian() * (.25*100))+100;
    ;
    fg=(randomGaussian() * (.25*128))+128;
    fb=(randomGaussian() * (.25*128))+128;
    fcanHaveBaby=false;
    PVmove.set((randomGaussian() * (.25*(sqrt(2)/2)))+(sqrt(2)/2), (randomGaussian() * (.25*(sqrt(2)/2)))+(sqrt(2)/2));
    if (random(2)>1)
      PVmove.set(PVmove.x*-1, PVmove.y);
    if (random(2)>1)
      PVmove.set(PVmove.x, PVmove.y*-1);
  }


  paranhafish(float xx, float yy) {
    PVposition.set(xx, yy);
    fweight=(randomGaussian() * (.25*15))+15;
    fmaxWeight=(randomGaussian() * (.25*50))+50;
    fage=0;
    fmaxAge=(randomGaussian() * (.25*10000))+10000;
    String names[] = loadStrings("names.txt");
    String[] m = match(names[floor(random(names.length))], "(.*?),");
    fname=m[0] + " paranha";
    fDead=false;
    fr=(randomGaussian() * (.25*100))+100;
    ;
    fg=(randomGaussian() * (.25*128))+128;
    fb=(randomGaussian() * (.25*128))+128;
    fcanHaveBaby=false;
    PVmove.set((randomGaussian() * (.25*(sqrt(2)/2)))+(sqrt(2)/2), (randomGaussian() * (.25*(sqrt(2)/2)))+(sqrt(2)/2));
    if (random(2)>1)
      PVmove.set(PVmove.x*-1, PVmove.y);
    if (random(2)>1)
      PVmove.set(PVmove.x, PVmove.y*-1);
  }

  void go()
  {
    this.move();
  }

  boolean tryToEat(Tankable t) {
    if (t instanceof fish) {//check if it is any fish
      if (t instanceof goldfish) {//check if it is any fish
        this.setWeight(t.getRadius()*.1);
        return true;
      } else if (t instanceof paranhafish) {//check if it is any fish
        if (t.getRadius()<this.getRadius())
          this.setWeight(t.getRadius()*.1);
        return true;
      } else if (t instanceof walefish) {//check if it is any fish
        if (t.getRadius()<this.getRadius())
          this.setWeight(t.getRadius()*.1);
        return true;
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

    if (fDead == true) {
      // ypos += -2;
      PVmove.set(0, -2);
    } 


    this.display();
    if (fweight / 2 >= PVposition.y&&fDead == true) {
      PVmove.set(0, 0);
    } else if (fmaxAge < fage || fmaxWeight < fweight) {
      fDead = true;
    } else {
      fage += 1;
      fweight += .01;
    }

this.tooSkinny();

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

  float getSmalestDist() {
    return smalestDist.mag();
  }

  void setSmalestDist(float x, float y) {
    smalestDist.set(x, y);
  }
}