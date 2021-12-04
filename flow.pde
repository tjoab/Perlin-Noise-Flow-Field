// Array if particles, and the number of particles to be used
ArrayList<particle> particles = new ArrayList<particle>();
int numParticles = 15000;

// Initial value for the speed of each particle
float speed = 6;

// Smoothness and compactness refer to some properties of the perlin noise and the subsequent sampling.
// A smaller smoothness value "difuses" the noise. The campactness value is multiplied by Pi (and the 
// perlin noise output) to form an angle that our particle vector will follow. The higher this value
// the more more compact the flow lines. 
float smoothness = 0.003;
float compactness = 3.2;

// Brightness refers to the third argument in the HSB color mode specification. We play with this value 
// as the animation plays out. slowFac is a factor that we also play with as the animation progress to 
// affect the speed of the vector particles. 
float brightness = 20;
float slowFac = 0.1;

int frame = 0;


void setup(){
  colorMode(HSB);
  size(1000,1000);
  background(0);
  
  // Create our vector particles with random initial positions
  for (int i=0; i<numParticles+1; i++){
    particles.add(new particle(random(width), random(height)));
  } 
}


void draw(){
  // Update and display all the vector particles
  for (particle p : particles){
      p.update(speed, smoothness, compactness);
      p.display(brightness);
    }
    
  // Here we are easing the both the brightness and speed for the vectors as the animation progresses  
  if (brightness < 255){
    brightness += easeInOutSine(frame, 1.3, 1, 300);  
   }
   if (speed < 25){

    speed += easeInOutSine(frame, 0.1, slowFac, 19);  
   }
   frame++;
   slowFac = slowFac + 0.05;
}

// Easing function
float easeInOutSine(float t, float b, float c, float d) {
    return  -c *(cos(t/d * PI) - 1)/2 + b;
}
