# Flappy Bird - Arduino + Processing by Alex Ko 
## Inspiration
I will be making a flappy bird game (below for inspiration) by using arduino and processing. 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/inspo.png?raw=true" width = "700">
</p>

## How it works
1. The user can choose to play with one bird or two birds by pressing 1 or 2 on the keyboard. 
2. If the user chooses to play with two birds, the user can further press on the red or blue button on arduino to choose whetehr they want a blue or red bird. 
3. Press the space bar to start the game. 
4. Tap on the LDR sensor to control the yellow bird, and press on the buttons to control the second bird according to the color. 
5. __The program will speed up and the gap will be smaller as the game progresses!__
6. The game is over when the bird hits the pipe. 
7. The user can know their score (time), and the program will notify the user if they achive a new high score or not. (The new high score will be stored in a __csv file__ that gets compared and updated each time a new record is set.) 


## Challenges 
### Make the backgrounds move
I realized it was initially hard to make the background move because there is only one image. I had to come up with a method to so that one image follows the previous image and images that are out of frame will be discarded so I won't have to exhaust my CPU. Then I finally came up with the following method! 
```
void movebg(PImage background){
  image(background, x1, 0);
  x1--;
  if(x1 < 0){
    image(background, x2, 0);
    x2--; 
  }
  if(x1 == -width){
    x1 = x2;
    x2 = width;
  }   
}
```
### I put the wrong function in the wrong position! 
I had a function called __generate_pipe()__ that is used to generate two arraysthat contain the x and __randon__ y positions of 100 pipes. However, initially I put this function inside the draw() function, and therefore I got the following result. I later figured out that the draw function is bascially calling the function every millesecond! And that's why the y position is always random and it looks like it is jumping up and down. 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/Apr-21-2021%2023-41-15.gif?raw=true" width="700">
</p>

### Reset the variables after you restart the game! 
I have a function called __generate_pipe()__ that generates the x and y coordinates for the pipes. After I restarted the game, there are so many pipes on the screen and they did not disappear. I realized this is a result of not clearing the arrays before I appended new values to them! So now the function looks like this: 
```
void generate_pipe(){
  pipeX.clear();  // clearing all the values before adding new values
  pipeY.clear();  // clearing all the values before adding new values
  for(int i=0; i<5; i++){
    pipeX.append( width/2 + 500*i);
    pipeY.append((int)random(-600, 0));
  }
 
}
```

## Interesting Things I Found
### Making it more efficient for CPU! 

## Schematic 

## Some Pictures 

## Video 

