
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.
//2. Create x and y member variables to hold the location of each segment.

class Segment {
int x, y;
  // 3. Add a constructor with parameters to initialize each variable.
  Segment(int a, int b)
  {
    x = a;
    y = b;

  }

  // 4. Add getter and setter methods for both the x and y member variables.

  int getX()
  {
    return x;
  }

  int getY()
  {
    return y;
  }

  void setX(int  a)
  {
    x = a;
  }

  void setY(int b)
  {
    y = b;
  }
}

// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
 Segment head;
 
 
 // 6. Create and initialize a String to hold the direction of your snake e.g. "up"
 String direction = "up";
 
 
 // 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
 // give it a value of 1 to start.
 int food = 1;
 
 
 // 8. Create and initialize foodX and foodY variables to hold the location of the food.
 // (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

 int foodX = ((int)random(50)*10), foodY = ((int)random(50)*10);

void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
  head = new Segment(10, 10);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}

void draw() {
  background(0);

  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}

// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  fill(0, 255, 0);
  rect(foodX, foodY, 10, 10);
}

//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {
  fill(0, 0, 255);
  rect(head.getX(), head.getY(), 10, 10);
}

// 15. Complete the move method below.
void move() {
  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  keyPressed();
  switch(direction) {
  case "up":
    head.setY(head.getY() - 10);
    break;
  case "down":
    head.setY(head.getY() + 10);
    break;
  case "left":
    head.setX(head.getX() - 10);
    break;
  case "right":
    head.setX(head.getX() + 10);
    break;
  default:
    break;
  }
  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}

// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      direction = "up";
    } else if (keyCode == DOWN) {
      direction = "down";
    } else if (keyCode == LEFT) {
      direction = "left";
    } else if (keyCode == RIGHT) {
      direction = "right";
    }
  }
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if ( head.getX()<0)
    head.setX(width);
  if (head.getX()>500)
    head.setX(0);
  if ( head.getY()<0)
    head.setY(height);
  if (head.getY()>500)
    head.setY(0);
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)
 void oppositeDirection()
 {
 
     
 
 }
// 21. Complete the missing parts of the collision method below.
void collision() {

  // If the segment is colliding with a piece of food...
  if (head.getX() == foodX && head.getY() == foodY)
  {
    // Increase the amount of food eaten and set foodX and foodY to new random locations.
    food++;
    foodX = ((int)random(50)*10);
    foodY = ((int)random(50)*10);
  }
}

/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment> tail = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
  drawTail();
  checkTailCollision();
  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  tail.add(new Segment(head.getX(), head.getY()));
  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  while (tail.size() > food && tail.size() > 0)
    tail.remove(0);
}

void drawTail() {
  // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
  for (Segment s : tail)
  {
    fill(100);
    rect(s.getX(), s.getY(), 10, 10);
  }
}

// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {
  // If your head has the same location as one of your segments...
  for (Segment s : tail)
    if (head.getX() == s.getX()  &&  head.getY() == s.getY())
      // reset your food variable
      food = 1;
  //Call this method at the beginning of your manageTail method.
}