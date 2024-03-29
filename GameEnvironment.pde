class GameEnvironment {
  int gameState = 0;
  int menu=0, runState=1, crashing = 2, dead = 3, takeSequence=4;
  int score = 0;
  ArrayList<Level> levels;
  int currentLevel = 0;
  int maxLives = 3;
  int lives = 3;
  int takeSequenceStart;
  int deadStart;
  DDD d;
  int highestWages = 0;
  GameEnvironment() {

    prepareLevels();

    d=new DDD(levels.get(0).platforms);
  }

  void prepareLevels() { 
    loadLevels();
    
    //loadTestLevels();
  }

  void loadTestLevels() {
    //test level //
    
    Level l;
    l=new Level(bike);

    l.platforms.add(new Platform(0, 125, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 250, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 375, color(0, 255, 0)));
    l.platforms.add(new Platform(0, height, color(0, 255, 0)));

    levels.add(l);
    l=new Level(ski);

    l.platforms.add(new Platform(0, 125, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 250, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 375, color(0, 255, 0)));
    l.platforms.add(new Platform(0, height, color(0, 255, 0)));

    levels.add(l);
    
  }

  void loadLevels() {
    levels = new ArrayList<Level>();

    //level 1:
    Level l;

    l= new Level(bike);

    l.platforms.add(new Platform(0, 125, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 250, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 375, color(0, 255, 0)));
    l.platforms.add(new Platform(0, height, color(0, 255, 0)));

    //add obstacles.
    l.obstacles.add(new House(300, 120, 30, 40));
    l.treats.add(new Treat(302, 60, 28, 20, 1, 20, true));
    l.obstacles.add(new Tree(145, 365, 30, 40));
    l.treats.add(new Treat(148, 305, 28, 20, 3, 20, true));
    l.obstacles.add(new Ambulance(30, 250, 30, 30));
    l.treats.add(new Treat(31, 185, 25, 22, 2, 20, true, true));


    l.obstacles.add(new Spider(250, 415, 30, 30));
    l.treats.add(new Treat(251, height-20, 26, 20, 4, 20, true));
    levels.add(l);

    l = new Level(waterSki);

    l.platforms.add(new Platform(0, 125, color(0, 0, 255)));
    l.platforms.add(new Platform(0, 250, color(0, 0, 255)));
    l.platforms.add(new Platform(0, 375, color(0, 0, 255)));
    l.platforms.add(new Platform(0, height, color(0, 0, 255)));

    l.obstacles.add(new Lighthouse(100, 125, 40, 30));
    l.treats.add(new Treat(110, 65, 20, 20, 1, 20, true));

    l.obstacles.add(new Spider(350, 415, 30, 30));
    l.treats.add(new Treat(350, height-20, 30, 20, 3, 20, true));

    l.obstacles.add(new Whale(150, 385, 30, 20));
    l.treats.add(new Treat(152, 325, 25, 20, 3, 20, true));

    l.obstacles.add(new Boat(100, 250, 30, 35));
    l.treats.add(new Treat(102, 185, 30, 20, 2, 20, true, true));



    levels.add(l);

    l = new Level(ski);

    l.platforms.add(new Platform(0, 125, color(255)));
    l.platforms.add(new Platform(0, 250, color(255)));
    l.platforms.add(new Platform(0, 375, color(255)));
    l.platforms.add(new Platform(0, height, color(255)));

    l.obstacles.add(new Cabin(175, 120, 30, 40));
    l.treats.add(new Treat(180, 60, 25, 20, 1, 20, true));
    l.obstacles.add(new Spider(250, 415, 30, 30));
    l.treats.add(new Treat(250, height-20, 30, 20, 3, 20, true));
    l.obstacles.add(new Snowball(150, 255, 25, 25));
    l.treats.add(new Treat(152, 190, 22, 25, 2, 20, true, true));
    l.obstacles.add(new Snowman(100, 375, 30, 30));
    l.treats.add(new Treat(105, 305, 25, 30, 3, 20, true));

    //levels.add(l);

    l= new Level(bike);
    //add obstacles.
    l.platforms.add(new Platform(0, 125, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 250, color(0, 255, 0)));
    l.platforms.add(new Platform(0, 375, color(0, 255, 0)));
    l.platforms.add(new Platform(0, height, color(0, 255, 0)));

    l.obstacles.add(new House(125, 125, 30, 30));
    l.treats.add(new Treat(127, 60, 28, 20, 1, 20, true));


    l.obstacles.add(new Tree(150, 375, 30, 30));
    l.treats.add(new Treat(148, 305, 28, 20, 3, 20, true, false));

    l.obstacles.add(new Ambulance(150, 250, 30, 30));
    l.treats.add(new Treat(150, 185, 25, 22, 2, 20, true, true));

    l.obstacles.add(new House(250, height, 30, 30));
    l.treats.add(new Treat(250, height - 30, 28, 20, 4, 20, true));

    l.obstacles.add(new Police(width-125, 125, 30, 30));
    l.treats.add(new Treat(width-125, 125, 10, 20, 1, 20, true, false));
    l.obstacles.add(new Chopper(width, 465, 30, 30));


    levels.add(l);
  }

  void show() {
    fill(0, 0, 255);
    rect(0, 0, width, 20);

    showWages();

    levels.get(currentLevel).show(d);
    if (gameState==runState) {
      d.state = levels.get(currentLevel).playerState;
      showRunState();
    } else if (gameState == menu) {
      showMenu();
    } else if (gameState==dead) {
      showDeadState();
    } else if (gameState==takeSequence) {
      drawTakeSequence();
    } else if (gameState==crashing) {
      showCrashing();
    }
  }

  void showWages() {
    fill(255, 255, 0);
    String wages = "WAGES :";
    wages =wages + score;
    float wd = textWidth(wages);
    text(wages, width/2-(wd/2), 15);
  }

  void showRunState() {
    d.show();
    d.move();

    if (d.hitObstacle) {
      gameState=crashing;
    }
    if (d.foundTreat) {
      d.foundTreat = false;
      score += d.treatValue;
      d.treatValue=0;
    }
    println("DENIS LEVEL:", d.level);
    if (d.level==4 ) {
      currentLevel++;
      d.level=0;
      //println( d.state);
      //println(gameState);
      if (currentLevel>=levels.size()) {
        //gameState = menu;
        currentLevel=0;
        d.reset();
      } else {
        d.reset();//=new DDD(levels.get(currentLevel).platforms);
        d.platforms=levels.get(currentLevel).platforms;

        d.state = levels.get(currentLevel).playerState;
      }
    }
  }

  void showDeadState() {

    color c;
    int num = frameCount % 8;
    if (num==0) {
      c=color(0, 0, 0);
    } else if (num==1) {
      c=color(255, 0, 0);
    } else if (num==2) {
      c=color(0, 255, 0);
    } else if (num==3) {
      c=color(0, 0, 255);
    } else if (num==4) {
      c=color(255, 255, 0);
    } else if (num==5) {
      c=color(255, 0, 255);
    } else if (num==6) {
      c=color(0, 255, 255);
    } else if (num==7) {
      c=color(255, 255, 255);
    } else {
      c=color(255, 255, 0);
    }

    fill(c);
    text("YOU'RE FIRED", width/2-20, height/2-30);

    if (deadStart + 300 == frameCount) {
      gameState = menu;  
      d.reset();
      currentLevel=0;
      lives=3;
      if (score > highestWages)
        highestWages =score;
    }
  }
  void showMenu() {
    background(0);
    fill(0, 255, 255);
    textSize(15);
    text("Highest wages paid today ", 50, 50);
    fill(255, 255, 0); 
    text(highestWages, 290, 50);
    fill(0, 255, 0); 
    text("How good are you", 100, 100);
    fill(0, 255, 255);
    text("A>", 150, 150);
    fill(255, 255, 0); 
    text("Novice", 180, 150);
  }
  void showStory() {
    String story = "";

    story="1";
    println(story);
  }
  void showCrashing() {
    d.show();
    //println("CRASHING:");
    if (frameCount > d.frameStartCrash + 200) {

      if (lives==1) {
        gameState = dead;
        deadStart=frameCount;
      } else {
        d.state =d.origState; 
        d.reset();
        lives --;
        gameState = takeSequence;
        startTakeSequence();
      }
      prepareLevels();
      println("CRASH SEQUENCE OVER");
    }
  }

  void startTakeSequence() {
    gameState=takeSequence;
    takeSequenceStart = frameCount;
  }
  void drawTakeSequence() {
    background(0);
    fill(255, 255, 0);
    //stroke(255, 255, 0);
    rect(198, 200, 25, 25);
    fill(255, 255, 0);
    textSize(20);

    text("TAKE ", 120, 220);
    fill(255, 0, 0);
    text(""+ abs(lives-4), 205, 220);
    if (frameCount == takeSequenceStart + 300) {
      endTakeSequence();
    }
    if (frameCount<takeSequenceStart+150) {
      fill(255, 255, 0);
      noStroke();
      rect(225, 170, 8, 25);
    } else {      
      fill(255, 255, 0);
      noStroke();
      rect(198, 188, 25, 8);
    }
  }

  void endTakeSequence() {

    gameState = runState;
  }

  void keyUp() {
    if (gameState==runState) {
      d.keyUp(keyCode);
    }
  }
  void keyDown() {
    if (gameState==runState) {
      d.movement(keyCode);
      d.movement(key);
    } else if (gameState == menu) {
      if (key == 'a' || key =='A') {
        gameState=takeSequence;   
        startTakeSequence();
        prepareLevels();
        score=0;
        //reset the obstacles to the starting position.
        d=new DDD(levels.get(0).platforms);
      }
    }
  }
}
