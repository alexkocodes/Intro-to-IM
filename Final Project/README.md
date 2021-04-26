# Flappy Bird - Arduino + Processing by Alex Ko 
## April 19th 
After a few days of thinking, I have decided to change my game. I will be making a flappy bird game (below for inspiration) by using arduino and processing. I plan to use the __LDR sensor__ to detect whether the user has clicked the sensor or not. 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/inspo.png?raw=true">
</p>

### Goal for today: 
Wired up the LDR and make sure the bird will go up and down based on the finger. 
### Progress: 
I managed to complete my goal and added some modifications so that the bird won't go out of the screen. Below is a demonstration of what I have done today. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/Apr-19-2021%2023-35-48.gif?raw=true" width="700">
</p>

## April 20th 
### Goal for today: 
I will make the moving background and try to code out the moving pipes as well. If I have the cabalibity I will also try to come up with a detection algorithm to detect when the bird hits the pipe. 

### Setback: I put the wrong function in the wrong position! 
I had a function called __generate_pipe()__ that is used to generate two arraysthat contain the x and __randon__ y positions of 100 pipes. However, initially I put this function inside the draw() function, and therefore I got the following result. I later figured out that the draw function is bascially calling the function every millesecond! And that's why the y position is always random and it looks like it is jumping up and down. 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/Apr-21-2021%2023-41-15.gif?raw=true" width="700">
</p>

### Progress: I have successfully made the moving background and the moving pipes as well! 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/Apr-21-2021%2023-51-37.gif?raw=true" width="700">
</p>

## April 21th 
### Goal: detect when the bird hits the pipes
### Progress: goal successfully completed. 
The brid will stop at where it hits the pipe. 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/ezgif.com-gif-maker%20(2).gif?raw=true" width="700">
</p>

## April 23th 
### Goal: make the game start screen
### Progress: goal successfully completed. 
The bird will first float and wait until the user press the space bar to start the game! 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/april22.gif?raw=true" width="700">
</p>

## April 25th
### Goal: make the game over screen and restart feature. Also add some sound effects. Add the timer. 
### Progress: goal successfully completed. In addition, I also added a feature where the gap between the pipes will be smaller as the game progresses, and the speed will increase as well. 
 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/Final%20Project/Progress/april25.gif?raw=true" width="700">
</p>

