/*
---------------------------------------------------------
BREAK 0.15
---------------------------------------------------------
BY HUBRIS [cargocollective.com/hubris]
FOR ENTREPRENEURS BREAK [entrepreneursbreak.com]
LISBON · MARCH 2014
---------------------------------------------------------
FULL VERSION: KEYBOARD + MOUSE + KINECT + 1080P
---------------------------------------------------------
USING THE FOLLOWING LIBRARIES:
SimpleOpenNI [https://code.google.com/p/simple-openni/]
Geomerative [http://www.ricardmarxer.com/geomerative/]
jBox2D [https://github.com/shiffman/Box2D-for-Processing]
---------------------------------------------------------
*/

class Control {

  PFont flamaBlack, flamaLight;

  PImage slideOne, slideTwo, slideThree;

  Control() {

    flamaBlack = loadFont("FlamaBlack-24.vlw");
    flamaLight = loadFont("FlamaLight-24.vlw");

    slideOne = loadImage("BREAK_Sponsors.png");
    slideTwo = loadImage("BREAK_Dados.png");
    slideThree = loadImage("BREAK_Hosts.png");
  }

  void controls() {

    fill(#202020, 200);
    noStroke();
    rect(0, 0, width / 3.3 - 20, height);

    String title = "BREAK";
    String subTitle = "CONTROLS";
    String typeOfAction1 = "TOGGLES";
    String typeOfAction2 = "ACTIONS";
    String typeOfAction3 = "ACTIVATE";
    String body1 = "KINECT DEPTH  'D'\nBOUNDARY  'B'\nATTRACTORS  'A'\nTITLE  'T'\nPRESENTATION  'P'";
    String body2 = "GRAVITY +Y  'UP'\nGRAVITY -Y  'DOWN'\nGRAVITY +X  'RIGHT'\nGRAVITY -X  'LEFT'\nEXPLODE  'E'\nREPELL  'MOUSE + CLICK'\nBALANCE  'C + MOUSE_X + CLICK'\nSWITCH PARTICLE  '#'\nSHOW KINECT  'S'\nSAVE STILL  'ENTER'";
    String body3 = "KINECT  'K'";
    String footer1 = "CARGOCOLLECTIVE.COM/HUBRIS";
    String footer2 = "LISBON · MARCH 2014";

    // TITLE
    textFont(flamaBlack);
    textSize(20);
    textAlign(LEFT);
    fill(#FFFFFF);
    text(title, 20, 20, width / 3 - 40, 50);
        
    textFont(flamaLight);
    textSize(20);
    text(subTitle, 90, 20, width / 3 - 40, 50);

    // BODY
    textSize(16);
    textLeading(17);
    fill(#30CCAA);
    text(typeOfAction1, 20, 55, width / 3 - 40, 500);
    fill(#FFFFFF);
    text(body1, 20, 55 + 17, width / 3 - 40, 500);

    fill(#30CCAA);
    text(typeOfAction2, 20, 173, width / 3 - 40, 500);
    fill(#FFFFFF);
    text(body2, 20, 173 + 17, width / 3 - 40, 500);

    fill(#30CCAA);
    text(typeOfAction3, 20, 377, width / 3 - 40, 500);
    fill(#FFFFFF);
    text(body3, 20, 377 + 17, width / 3 - 40, 500);

    //FOOTERS
    textFont(flamaBlack);
    textSize(12);
    fill(#30CCAA);
    text(footer1, 20, height - 42, width / 3 - 40, 500);

    textFont(flamaLight);
    textSize(12);
    fill(#FFFFFF);
    text(footer2, 20, height - 30, width / 3 - 40, 500);
  }

  void intro() {

    String intro = "· PRESS SPACE-BAR FOR CONTROLS ·";

    textFont(flamaLight);
    textSize(16);
    textAlign(CENTER);
    fill(#FFFFFF);
    text(intro, width / 2, height / 2);
  }

  void keyActions() {

    textFont(flamaLight);
    textSize(16);
    textAlign(RIGHT);
    fill(#FFFFFF);
  
    if (key == 'P' || key == 'p') {
        text("Presentation Mode: " + presentationMode, width - 20, 20);
    }
    if ((key == 'K' || key == 'k') && (drawKinect == true)) {
        text("Activate Kinect: " + activateKinect, width - 20, 20);
    }
    if ((key == 'S' || key == 's') && (activateKinect == true)) {
        text("Show Kinect: " + showKinect, width - 20, 20);
    }
    if (key == 'F' || key == 'f') {
        text(int(frameRate) + " FPS", width - 20, 20);
    }
}

  void slide(int slide) {
    if (slide == 1) {
        image(slideOne, 0, 0);
    }
    if (slide == 2) {
        image(slideTwo, 0, 0);
    }
    if (slide == 3) {
        image(slideThree, 0, 0);
    }
  }
}