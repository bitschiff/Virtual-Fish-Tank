class toroidalfinfish extends goldfish {

  toroidalfinfish() {
    PVposition.set(random(500) + 51, random(500) + 51);
    fweight=(randomGaussian() * (.25*10))+10;
    fmaxWeight=(randomGaussian() * (.25*30))+30;
    fage=0;
    fmaxAge=(randomGaussian() * (.25*20000))+20000;
    String names[] = loadStrings("names.txt");
    String[] m = match(names[floor(random(names.length))], "(.*?),");
    fname=m[0] + " toroidalfin";
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


  toroidalfinfish(float xx, float yy) {
    PVposition.set(xx, yy);
    fweight=(randomGaussian() * (.25*10))+10;
    fmaxWeight=(randomGaussian() * (.25*30))+30;
    fage=0;
    fmaxAge=(randomGaussian() * (.25*20000))+20000;
    String names[] = loadStrings("names.txt");
    String[] m = match(names[floor(random(names.length))], "(.*?),");
    fname=m[0] + " toroidalfin";
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


  void move() {

    if (floor(random(100)) == 1)
      fcanHaveBaby = true;

    if (floor(random(15)) == 0 && fDead == false)
    {
      if (floor(random(12)) == 0)
        //fDirectionY *= -1;
        PVmove.set(PVmove.x, PVmove.y*-1);

      if (floor(random(12)) == 0)
        //fDirectionX *= -1;
        PVmove.set(PVmove.x*-1, PVmove.y);
    }
this.tooSkinny();


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



    if (fDead == false)
    {     
      if (600 - (fweight / 2) <= PVposition.x) {

        PVposition.x=fweight / 2;
      } else if (600 - (fweight / 2) <= PVposition.y) {

        PVposition.set(PVposition.x, fweight / 2);
      } else if (fweight / 2 >= PVposition.y) {
        PVposition.set(PVposition.x, 600-(fweight / 2));
      } else if (fweight / 2 >= PVposition.x) {

        PVposition.x=600-(fweight / 2);
      }
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


  void display() {
    noFill();
    stroke(fr, fg, fb);
    if (fcanHaveBaby == false)
      if (random(500) == 10)
        fcanHaveBaby = true;


    stroke(fr, fg, fb);
    PVector perpVect = new PVector(-1*PVmove.y, PVmove.x);
    perpVect.setMag(fweight/2);

    PVector temp = new PVector(PVmove.x, PVmove.y);
    temp.setMag(fweight);

    triangle(PVposition.x, PVposition.y, PVposition.x-temp.x+perpVect.x, PVposition.y-temp.y+perpVect.y, PVposition.x-temp.x-perpVect.x, PVposition.y-temp.y-perpVect.y);


    resetMatrix();
    stroke(fr, fg, fb);
    ellipse(PVposition.x, PVposition.y, fweight, fweight); //body


    fill(fr, fg, fb);
    text(fname, (fweight / 2 + PVposition.x - 20), (PVposition.y - (fweight / 2) - 12));//name
    noFill();

    //eye
    temp.setMag(fweight/4);
    stroke(255, 255, 255);
    ellipse(temp.x+PVposition.x, temp.y+PVposition.y, fweight/3, fweight/3);
    stroke(0, 0, 0);
  }
}