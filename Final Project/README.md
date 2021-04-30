# Flappy Bird X2! - Arduino + Processing by Alex Ko 
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
8. __You can play the game with two birds with your friend, since I personally find it very difficult to control two birds at the same time :D__
9. __Or you can challenge your finger muslce and multitasking abilities and control two birds ;)__

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/starting_page.gif?raw=true" width = "700">
</p>


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
### Use frameCount to know the progress! 
At first I did not know now to know the progress of the game, since I want the game to speed up and the gap to be smaller after some time. I realized I could use the __frameCount__ to decide which point we are at right now after the game has started! 
```
if(frameCount % 100 == 0){ // for every 100 frames, we do the following things
      progress+=1;
      if(progress % 10 ==0){
        speed +=1;
        gap += 10;
        println(gap);
      }
    }
 ```
 
###  I only want to play the song once! 
I wanted to add background music to this game, but when I just put __bg.play()__, the music will be played over and over again and stacked on top of each other from the beginning, resulting in a horrendous sound. I soon found the function __isPlaying()__, and I came up with a function like this: 
```
if(bg.isPlaying() == false){
    bg.play();
  }
```
Basically, when the music is still playing, bg.isPlaying() will be true and it will prevent processing from playing the music over and over again while the previous round hasn't finished yet! 

## Interesting Things I Found
### Making it more efficient for CPU! 
I noticed that my program was using a lot of the CPU due to the number of graphics moving and it could be lagging sometimes. I had to think about ways I can do to reduce the CPU usage of the program. I found out that, my initial approach of generating and moving the pipes might be the program. Initially, I generated 100 coordinates in the arrays and just drew all of them and moved all of them at the same time. I realized I could make this more efficient by removing the pipes that are already out of the frame to the left, and add pipes from the right. However, I did not know how I could remove a particular value from an already declared array. After doing some research, I knew that I can use the __IntList__ and use the __remove(index)__ function to remove a value at a particular index! 
```
if (pipeX.get(i) < - 700){ // if the pipe is already moving to the left side of the screen and out of the screen 
      pipeX.remove(i); // remove the pipe when it's out of the frame
      pipeY.remove(i); // remove the pipe when it's out of the frame
      
      pipeX.append( pipeX.get(pipeX.size() -1) + 500);
      pipeY.append((int)random(-600, 0)); // add a new pipe to the end of the list
      
    }
    
```

### The power of CSV 
I wanted to add the feature of keeping a record of new high score, and I knew that I had to use some sort of local storage to store the highest score achieved on this computer. Therefore, CSV came to my mind. I generated a csv file that contains the high score on this computer. At the end of each round, I read the previous highest score from the csv file, and compare the current score to the old high score. If it's bigger than the previous high score, this score gets updated and saved into the csv file. 
```
if(time/1000 > parseInt(score[0])){
      table.setInt(0, 0, time/1000);
      saveTable(table, "best score.csv");
      high = true;
     }
     
 ```
## Schematic 

## Some Pictures 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/IMG_5310.jpg?raw=true" width = "700">
</p>
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/IMG_5311.jpg?raw=true" width = "700">
</p>


## Video Demonstration

One bird: https://youtu.be/g26TNXMtqSg
Two birds (thanks to my friend who played it with me): https://youtu.be/hUrCy_rADp8

