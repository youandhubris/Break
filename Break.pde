/*
------------------------------------------------
BREAK 0.15
------------------------------------------------
BY HUBRIS [cargocollective.com/hubris]
FOR ENTREPRENEURS BREAK [entrepreneursbreak.com]
LISBON · MARCH 2014
------------------------------------------------
FULL VERSION: KEYBOARD + MOUSE + KINECT + 1080P
------------------------------------------------
*/

// SETUP SHORTCUTS
boolean draw1080 = false;
boolean drawKinect = false;
boolean exportFrame = false;
boolean drawFPS = false;

// DRAW SHORTCUTS
boolean showControls = false;
boolean presentationMode = false;
boolean showPresentation = false;
int durationPresentation;
boolean showDepth = false;
boolean showBoundary = false;
boolean showAttractors = false;
boolean showTitle = true;
boolean showParticles = true;
int switchParticles = 1;
boolean saveStill = false;
boolean drawGravity = false;
boolean drawExplosion = false;
boolean drawBalance = false;
boolean activateKinect = false;
boolean showKinect = false;


// PUBLIC VARIABLES
float shiftX = width / 2;
float shiftY = height / 2;
int gravityX, gravityY;
float runningTime, timeSet, timeSelector;

// SVG & TYPE
import geomerative.*;
RShape svgB, svgR, svgE, svgA, svgK;
RShape svgTitle;
RPoint[][] svgPointsB, svgPointsR, svgPointsE, svgPointsA, svgPointsK;

// PHYSICS
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
Box2DProcessing box2d;

// BOUNDARY
Boundary svgOutline;
ArrayList<Vec2> outlineB = new ArrayList<Vec2>();
ArrayList<Vec2> outlineR = new ArrayList<Vec2>();
ArrayList<Vec2> outlineE = new ArrayList<Vec2>();
ArrayList<Vec2> outlineA = new ArrayList<Vec2>();
ArrayList<Vec2> outlineK = new ArrayList<Vec2>();
ChainShape chainForB, chainForR, chainForE, chainForA, chainForK;

// DYNAMICS
Dynamics[] attractors = new Dynamics[4];
int attractorsCount;
Vec2 force;
Dynamics mouseRepeller;
int gravityDelay = 0;

// PARTICLES
Particles[] particles = new Particles[1000];
color[] particleColor = new color[1000];
// color[] colorPalette = {#F35C94, #798EC1, #3CBEB3, #F4BA0B, #F49965};
color[] colorPalette = {#6DD9B9, #599E5E, #382C48, #BD2912, #E8A32C};
int particlesCounter = 200;

//KINECT
import SimpleOpenNI.*;
SimpleOpenNI kinect;
int closestValue, closestX, closestY, currentDepthValue;
float interpolatedX, interpolatedY, lastX, lastY;
int steps = 3;

// CONTROLS
Control menu;


void setup() {

  if (draw1080 == true) {
    size(1920, 1080);
  } else {
    size(1024, 768);
  }
  
  frameRate(30);
  smooth();

  RG.init(this);
  RG.ignoreStyles(true);
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(21);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, 0);

  for (int i = 0; i < particles.length; i++) {
    float initX = width / 2 + (cos(i) * random(475, 550));
    float initY = height / 2 + (sin(i) * random(475, 550));
    float particleSize = random(3,6);
    particles[i] = new Particles(particleSize, initX, initY);
    particleColor[i] = color(colorPalette[int(map(particleSize, 3, 6, 0, 5))]);
  }

  // CREATE BOUNDARY
  svgOutline = new Boundary();

  // MANUALLY ADD ATTRACTORS
  if (draw1080 == true) {
    attractors[0] = new Dynamics(1, 710, 528);
    attractors[1] = new Dynamics(1, 875, 515);
    attractors[2] = new Dynamics(1, 1045,528);
    attractors[3] = new Dynamics(1, 1185,548);
  } else {
    attractors[0] = new Dynamics(1, 184, 373);
    attractors[1] = new Dynamics(1, 397, 429);
    attractors[2] = new Dynamics(1, 622, 373);
    attractors[3] = new Dynamics(1, 796, 398);  
  }

  cursor(HAND);
  mouseRepeller = new Dynamics(1, 0, 0);

  if (drawKinect == true) { 
    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.setMirror(true);
  }

  menu = new Control();
}

void draw() {

  // HIDE MOTION BLUR
  if (frameCount < 60) {
    background(#202020);
  } else {
    fill(#202020, 210);
    noStroke();
    rect(0, 0, width, height);
  }

  // RANDOM TIMER
  if (runningTime % 60.0 == 0) {
    timeSet = int(random(15, 60));
  }
  if (runningTime % timeSet == 0) {
      timeSelector = int(random(5));
    if (timeSelector == 0) {
      gravityX = 0;
      gravityY = 250;
      drawGravity = true;
    }
    if (timeSelector == 1) {
      gravityX = 0;
      gravityY = -250;
      drawGravity = true;
    }
    if (timeSelector == 2) {
      gravityX = -250;
      gravityY = 0;
      drawGravity = true;
    }
    if (timeSelector == 3) {
      gravityX = 250;
      gravityY = 0;
      drawGravity = true;
    }
    if (timeSelector == 4) {
      drawExplosion = true;
    }
  }

  box2d.step();

  if (drawKinect == true) {
    closestValue = 8000;
    kinect.update();
    int[] depthValues = kinect.depthMap();

    for (int y = 0; y < 480; y += steps) {
      for (int x = 0; x < 640; x += steps) {
        int i = x + y * 640;
        currentDepthValue = depthValues[i];
        
        if (currentDepthValue > 600 && currentDepthValue < 1000 && currentDepthValue < closestValue) {
          closestValue = currentDepthValue;
          closestX = int(map(x, -50, 640, 0, width));
          closestY = int(map(y, 100, 480, 150, 534));
        }
      }
    }
    interpolatedX = lerp(lastX, closestX, 0.3f);
    interpolatedY = lerp(lastY, closestY, 0.3f);
  }

  if (showDepth == true) {
    image(kinect.depthImage(), 192, 144);
  }

  if (drawGravity == true) {
    box2d.setGravity(gravityX, gravityY);
    gravityDelay++;
  }
  if (drawGravity == false) {
    box2d.setGravity(0, 0);
  }
  
  if (showBoundary == true) {
    svgOutline.display();
  }

  if (showAttractors == true) {
    for (int i = 0; i < attractors.length; i++) {
      attractors[i].display();
    }
  }

  // UPDATE PARTICLES
  for (int i = 0; i < particles.length; i++) {
    force = attractors[attractorsCount % attractors.length].attract(particles[i]);
    if ((mousePressed == true) && (runningTime % 0.25 > 0)) {
        force = mouseRepeller.repell(particles[i], mouseX, mouseY);
    }
    if (activateKinect == true) {
      if ((runningTime % 0.25 > 0) && (interpolatedX != lastX)) {
        force = mouseRepeller.repell(particles[i], interpolatedX, interpolatedY);
      }
    }
    if (drawExplosion == true) {
      force = mouseRepeller.explode(particles[i]);
    }
    if ((key == 'C' || key == 'c') && (mousePressed == true)){
      force = attractors[int(constrain(mouseX, 0, width - 1) / 256)].attract(particles[i]);
    }
    particles[i].applyForce(force);
    particles[i].display(i);
    attractorsCount++;
  }
  
  lastX = interpolatedX;
  lastY = interpolatedY;

  if (showTitle == true) {
    fill(#202020);
    noStroke();
    RG.shape(svgTitle);
  }

  if (showKinect == true) {
    noCursor();
    stroke(255);
    strokeWeight(4);
    noFill();
    ellipse(interpolatedX, interpolatedY, 20, 20);
  }

  runningTime = frameCount / 30.0;
  if ((presentationMode == true) && (runningTime % 60.0 == 0)) {
    showPresentation = true;
  }
  if (showPresentation == true) {
    durationPresentation ++;
    if (durationPresentation < 150) {
      menu.slide(1);
    } if ((durationPresentation >= 150) && (durationPresentation < 300)) {
      menu.slide(2);
    } if (durationPresentation >= 300) {
      menu.slide(3);
    }
    if (durationPresentation == 450) {
      showPresentation = false;
      durationPresentation = 0;
    }
  }

  if (showControls == true) {
    menu.controls();
  }

  if (keyPressed == true) {
    menu.keyActions();
  }

  if (frameCount < 60) {
    menu.intro();
  }

  // NOT ON KEY RELEASED BECAUSE IT NEEDS TO RUN ALL PARTICLES
  drawExplosion = false;

  if (gravityDelay == 10) {
    drawGravity = false;
    gravityDelay = 0;
  }

  if (exportFrame == true) {
    saveFrame("export/BREAK######.tga");
  }
  if (saveStill == true) {
    saveFrame("export/BREAK######.tif");
    saveStill = false;
  }
  
}

boolean sketchFullScreen() {
  return false;
}
