/*
------------------------------------------------
BREAK#1 0.15
------------------------------------------------
BY HUBRIS [cargocollective.com/hubris]
FOR ENTREPRENEURS BREAK [entrepreneursbreak.com]
LISBON · MARCH 2014
------------------------------------------------
FULL VERSION: KEYBOARD + MOUSE + KINECT + 1080P
------------------------------------------------
*/

class Boundary {

  Boundary() {

    // LOAD SBG (NO ARTBOARD)
    if (draw1080 == true) {
      svgB = RG.loadShape("BREAK_Map_B_1080.svg");
      svgR = RG.loadShape("BREAK_Map_R_1080.svg");
      svgE = RG.loadShape("BREAK_Map_E_1080.svg");
      svgA = RG.loadShape("BREAK_Map_A_1080.svg");
      svgK = RG.loadShape("BREAK_Map_K_1080.svg");
      svgTitle = RG.loadShape("BREAK_Title_1080.svg");
    } else {
      svgB = RG.loadShape("BREAK_Map_B.svg");
      svgR = RG.loadShape("BREAK_Map_R.svg");
      svgE = RG.loadShape("BREAK_Map_E.svg");
      svgA = RG.loadShape("BREAK_Map_A.svg");
      svgK = RG.loadShape("BREAK_Map_K.svg");
      svgTitle = RG.loadShape("BREAK_Title.svg");
    }

    svgB.centerIn(g, 0, 0, 0);
    svgPointsB = svgB.getPointsInPaths();
    svgR.centerIn(g, 0, 0, 0);
    svgPointsR = svgR.getPointsInPaths();
    svgE.centerIn(g, 0, 0, 0);
    svgPointsE = svgE.getPointsInPaths();
    svgA.centerIn(g, 0, 0, 0);
    svgPointsA = svgA.getPointsInPaths();
    svgK.centerIn(g, 0, 0, 0);
    svgPointsK = svgK.getPointsInPaths();
    svgTitle.centerIn(g, 0, 0, 0);


    // CONVERT SVGS TO CHAINS
    // CHAIN B
    chainForB = new ChainShape();
    for (int i = 0; i < svgPointsB.length; ++i) {
      for (int j = 0; j < svgPointsB[i].length; ++j) {
        outlineB.add(new Vec2 (svgPointsB[i][j].x + shiftX, svgPointsB[i][j].y + shiftY));
      }
    }

    Vec2[] verticesB = new Vec2[outlineB.size()];
    for (int i = 0; i < verticesB.length; ++i) {
      Vec2 edge = box2d.coordPixelsToWorld(outlineB.get(i));
      verticesB[i] = edge;
    }

    chainForB.createChain(verticesB, verticesB.length);

    BodyDef bodyDefB = new BodyDef();
    bodyDefB.position.set(0.0f, 0.0f);
    Body bodyB = box2d.createBody(bodyDefB);
    bodyB.createFixture(chainForB, 1);


    // CHAIN R
    chainForR = new ChainShape();
    for (int i = 0; i < svgPointsR.length; ++i) {
      for (int j = 0; j < svgPointsR[i].length; ++j) {
        outlineR.add(new Vec2 (svgPointsR[i][j].x + shiftX, svgPointsR[i][j].y + shiftY));
      }
    }

    Vec2[] verticesR = new Vec2[outlineR.size()];
    for (int i = 0; i < verticesR.length; ++i) {
      Vec2 edge = box2d.coordPixelsToWorld(outlineR.get(i));
      verticesR[i] = edge;
    }

    chainForR.createChain(verticesR, verticesR.length);

    BodyDef bodyDefR = new BodyDef();
    bodyDefR.position.set(0.0f, 0.0f);
    Body bodyR = box2d.createBody(bodyDefR);
    bodyR.createFixture(chainForR, 1);


    // CHAIN E
    chainForE = new ChainShape();
    for (int i = 0; i < svgPointsE.length; ++i) {
      for (int j = 0; j < svgPointsE[i].length; ++j) {
        outlineE.add(new Vec2 (svgPointsE[i][j].x + shiftX, svgPointsE[i][j].y + shiftY));
      }
    }

    Vec2[] verticesE = new Vec2[outlineE.size()];
    for (int i = 0; i < verticesE.length; ++i) {
      Vec2 edge = box2d.coordPixelsToWorld(outlineE.get(i));
      verticesE[i] = edge;
    }

    chainForE.createChain(verticesE, verticesE.length);

    BodyDef bodyDefE = new BodyDef();
    bodyDefE.position.set(0.0f, 0.0f);
    Body bodyE = box2d.createBody(bodyDefE);
    bodyE.createFixture(chainForE, 1);


    // CHAIN A
    chainForA = new ChainShape();
    for (int i = 0; i < svgPointsA.length; ++i) {
      for (int j = 0; j < svgPointsA[i].length; ++j) {
        outlineA.add(new Vec2 (svgPointsA[i][j].x + shiftX, svgPointsA[i][j].y + shiftY));
      }
    }

    Vec2[] verticesA = new Vec2[outlineA.size()];
    for (int i = 0; i < verticesA.length; ++i) {
      Vec2 edge = box2d.coordPixelsToWorld(outlineA.get(i));
      verticesA[i] = edge;
    }

    chainForA.createChain(verticesA, verticesA.length);

    BodyDef bodyDefA = new BodyDef();
    bodyDefA.position.set(0.0f, 0.0f);
    Body bodyA = box2d.createBody(bodyDefA);
    bodyA.createFixture(chainForA, 1);


    // CHAIN K
    chainForK = new ChainShape();
    for (int i = 0; i < svgPointsK.length; ++i) {
      for (int j = 0; j < svgPointsK[i].length; ++j) {
        outlineK.add(new Vec2 (svgPointsK[i][j].x + shiftX, svgPointsK[i][j].y + shiftY));
      }
    }

    Vec2[] verticesK = new Vec2[outlineK.size()];
    for (int i = 0; i < verticesK.length; ++i) {
      Vec2 edge = box2d.coordPixelsToWorld(outlineK.get(i));
      verticesK[i] = edge;
    }

    chainForK.createChain(verticesK, verticesK.length);

    BodyDef bodyDefK = new BodyDef();
    bodyDefK.position.set(0.0f, 0.0f);
    Body bodyK = box2d.createBody(bodyDefK);
    bodyK.createFixture(chainForK, 1);
  }

  void display() {
    noFill();
    stroke(255);
    beginShape();
    for (Vec2 v: outlineB) {
      vertex(v.x,v.y);
    }
    for (Vec2 v: outlineR) {
      vertex(v.x,v.y);
    }
    for (Vec2 v: outlineE) {
      vertex(v.x,v.y);
    }
    for (Vec2 v: outlineA) {
      vertex(v.x,v.y);
    }
    for (Vec2 v: outlineK) {
      vertex(v.x,v.y);
    }
    endShape();
    
  }

  void clear() {
    chainForB = new ChainShape();
    Vec2[] verticesB = new Vec2[0];
    BodyDef bodyDefB = new BodyDef();
  }
}