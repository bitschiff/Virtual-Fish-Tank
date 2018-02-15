/*
By Eli Schiff

This is my fish tank. You can add up to 4 different types of fish along with food and poison pellets. Tapping on the tank or pressing the button will cause the fish to swich directions.

If the program gives an error when running it it may be something to do with the new void settings() feture in processing 3. Just uncomment the line that sais  "// size(725, 600);" and it shoud work, that is line 24.
*/






fishTank f = new fishTank(0, 0, width, height);



void settings() {
  size(725, 600);
}



void setup() {
 // size(725, 600);
}
void draw() {
  f.update();
}


void mousePressed() {


  if ((mouseButton == LEFT) && mouseX <= 600)
  {
    f.tapTheTank();
  }

  if ((mouseButton == LEFT) && mouseX >= 625 && mouseY >= 175 && mouseX <= 675 && mouseY <= 225)
  {
    f.tapTheTank();
  }

  if (mouseX >= 625 && mouseY >= 250 && mouseX <= 675 && mouseY <= 300)//add fish // will soon be clean the tank
  {
    f.cleanTheTank();
  }




  if (mouseX >= 625 && mouseY >= 25 && mouseX <= 675 && mouseY <= 75)//food
  {
    for (int i = 0; i < 8; i ++)
    {
      f.addTankable(new food(random(600) + 1, 0, random(10) + 2));
    }
  }

  if (mouseX >= 625 && mouseY >= 100 && mouseX <= 675 && mouseY <= 150)//poison
  {
    for (int i = 0; i < 8; i ++)// generates fish in random spots
    {
      f.addTankable(new poison(random(600) + 1, 0, random(10) + 2));
    }
  }





  //fish buttons
  if (mouseX >= 625 && mouseY >= 325 && mouseX <= 650 && mouseY <= 350)//add fish // will soon be clean the tank
  {
    //for (int i=0; i<25; i++)
    f.addTankable(new goldfish());
  }

  if (mouseX >= 675 && mouseY >= 325 && mouseX <= 700 && mouseY <= 350)//add fish // will soon be clean the tank
  {
    //for (int i=0; i<25; i++)
    f.addTankable(new walefish());
  }

  if (mouseX >= 625 && mouseY >= 375 && mouseX <= 650 && mouseY <= 400)//add fish // will soon be clean the tank
  {
    //for (int i=0; i<25; i++)
    f.addTankable(new paranhafish());
  }

  if (mouseX >= 675 && mouseY >= 355 && mouseX <= 700 && mouseY <= 400)//add fish // will soon be clean the tank
  {
    //for (int i=0; i<25; i++)
    f.addTankable(new toroidalfinfish());
  }
}