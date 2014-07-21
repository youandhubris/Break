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

void keyPressed() {

  if (keyCode == 32) {
    showControls = !showControls;
  }
  if ((key == 'D' || key == 'd') && (drawKinect == true)) {
    showDepth = !showDepth;
  }
  if (key == 'B' || key == 'b') {
    showBoundary = !showBoundary;
  }
  if (key == 'A' || key == 'a') {
    showAttractors = !showAttractors;
  }
  if (key == 'T' || key == 't') {
    showTitle = !showTitle;
  }
  if (key == 'P' || key == 'p') {
    presentationMode = !presentationMode;
  }
  if (keyCode == UP) {
    gravityX = 0;
    gravityY = 250;
    drawGravity = !drawGravity;
  }
  if (keyCode == DOWN) {
    gravityX = 0;
    gravityY = -250;
    drawGravity = !drawGravity;
  }
  if (keyCode == LEFT) {
    gravityX = -250;
    gravityY = 0;
    drawGravity = !drawGravity;
  }
  if (keyCode == RIGHT) {
    gravityX = 250;
    gravityY = 0;
    drawGravity = !drawGravity;
  }
  if (key == 'E' || key == 'e') {
    drawExplosion = !drawExplosion;
  }
  if (key == '1') {
    switchParticles = 1;
  }
  if (key == '2') {
    switchParticles = 2;
  }
  if (keyCode == ENTER) {
    saveStill = true;
  }
  if ((key == 'K' || key == 'k') && (drawKinect == true)) {
    activateKinect = !activateKinect;
  }
  if ((key == 'S' || key == 's') && (activateKinect == true)) {
    showKinect = !showKinect;
  }
  if (key == 'F' || key == 'f') {
    drawFPS = !drawFPS;
  }
 }