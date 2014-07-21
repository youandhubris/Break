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

class Particles {

  Body body;
  float r;

  Particles(float r_, float x, float y) {
  
    r = r_;
    float rest = 2.5 / r;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 2;
    fd.friction = 0.3; // Viscosidade
    fd.restitution = rest; // Vaguear

    body.createFixture(fd);

    body.setLinearVelocity(new Vec2(random(-3 * r,3 * r),random(-3 * r,-3 * r)));
    body.setAngularVelocity(random(-1,1));

  }

  void applyForce(Vec2 v) {
    body.applyForce(v, body.getWorldCenter());
  }

  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height) {
      killBody();
      return true;
    }
    return false;
  }


  void display(int c) {
    if (switchParticles == 1) {
      Vec2 pos = box2d.getBodyPixelCoord(body);
      float a = body.getAngle();
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(a);
      noStroke();
      fill(particleColor[c], 200);
      ellipse(0, 0, r * 2, r * 2);
      popMatrix();
    }

    if (switchParticles == 2) {
      Vec2 pos = box2d.getBodyPixelCoord(body);
      float a = body.getAngle();
      pushMatrix();
      translate(pos.x, pos.y);
      rotate(a / 2);
      stroke(particleColor[c], 255);
      noFill();
      line(-r, 0, r, 0);
      popMatrix();
    }
  }
}