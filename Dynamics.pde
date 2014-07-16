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

class Dynamics {

  Body body;
  float r;

  Dynamics(float r_, float x, float y) {
    r = r_;

    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;

    bd.position = box2d.coordPixelsToWorld(x, y);
    body = box2d.world.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    body.createFixture(cs, 1);
    
  }

  // ATTRACT
  Vec2 attract(Particles m) {
     // Strength of force
    float G = 300;
    Vec2 pos = body.getWorldCenter();    
    Vec2 moverPos = m.body.getWorldCenter();
    Vec2 force = pos.sub(moverPos);
    float distance = force.length();
    // Keep force within bounds
    distance = constrain(distance,1,2);
    force.normalize();
    // Note the attractor's mass is 0 because it's fixed so can't use that
    float strength = (G * 1 * m.body.m_mass) / (distance * distance);
    force.mulLocal(strength);
    return force;
  }
  
  // REPELL
  Vec2 repell(Particles m, float x, float y) {
    // Strength of force
    float G = 400;
    Vec2 pos = box2d.coordPixelsToWorld(x,y);    
    Vec2 moverPos = m.body.getWorldCenter();
    Vec2 force = pos.sub(moverPos);
    float distance = force.length();
    // Keep force within bounds
    distance = constrain(distance,1,16000); // Bigger the number, smaller de radius of influence.
    force.normalize();
    // Note the attractor's mass is 0 because it's fixed so can't use that
    float strength = (G * -1 * m.body.m_mass) / (distance * distance);
    force.mulLocal(strength);
    return force;
  }

  // EXPLODE
  Vec2 explode(Particles m) {
    // Strength of force
    float G = 3200;
    Vec2 pos = box2d.coordPixelsToWorld(width / 2, height / 2);    
    Vec2 moverPos = m.body.getWorldCenter();
    Vec2 force = pos.sub(moverPos);
    float distance = force.length();
    // Keep force within bounds
    distance = constrain(distance,1,1); // Bigger the number, smaller de radius of influence.
    force.normalize();
    // Note the attractor's mass is 0 because it's fixed so can't use that
    float strength = (G * -1 * m.body.m_mass) / (distance * distance);
    force.mulLocal(strength);
    return force;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(255, 0, 0);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*4,r*4);
    popMatrix();
  }

}