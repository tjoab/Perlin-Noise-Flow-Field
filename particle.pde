class particle{

  // Instance variables
  PVector position;
  PVector velocity;
  float noiseVal;
  
  // Constructor
  particle(float x, float y){
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
  }
  
  // Method to update the position of the particle 
  void update(float speed, float smoothness, float compactness){
    // Produce some x,y values from perlin noise
    noiseVal = noise(position.x * smoothness, position.y * smoothness);
    
    // Create the new velocity vector from this noise (where the noise is taken as the angle offset)
    velocity = PVector.fromAngle(noiseVal * compactness * PI);
    velocity.setMag(speed);
    
    // Update the current position based on the new velocity 
    position.add(PVector.div(velocity, frameRate));
  }
  
  // Method to display each particle
  void display(float brightness){
    fill(noiseVal * 255, 150, brightness);
    noStroke();
    circle(position.x, position.y, 0.5);
  }
}
