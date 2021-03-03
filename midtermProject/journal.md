# aN eAsY QuIZz

## Feb 23

Since I have created this game in python before, I spent about one day familiarizing myself with the syntax difference between java and python. I plan to create the first page and test whether I can use the same code structure I used in python now in java, especially buttons. My game has about 11 questions and therefore 11 code blocks, each of which has its own unique structure and therefore I need to write about 11 differnet structures. Nonetheless this is the preliminary starting page. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/Feb23.gif?raw=true">
</p>


## Feb 26 
### Goal: reach question6
### Status: success. 
### (I don't wanna spoil the fun and reveal the answers, so I won't put a gif here to demonstrate how to pass each question.)
I have finished all the questions until question 9. Here are the results. Might need to adjust some some font sizes when the mouse hovers over the options. Found a more efficient way to do question 6 when the user drags the image. So far I have written about 516 lines of code. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/Screen%20Shot%202021-03-01%20at%2011.45.55%20PM.png?raw=true">
</p>

## Feb 27
### Goal: write the code for coin classes and lives classes, finsih the whole game basically. 
### Status: success. 
### (I don't wanna spoil the fun and reveal the answers, so I won't put a gif here to demonstrate how to pass each question.)
I finsihed coding the whole game. I also finished writing the code for the coin class, lives class, win or gameover pages as well. I have successfully translated about 680 lines of python code to Java, which now has about 690 lines of code. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/Screen%20Shot%202021-03-01%20at%2011.47.09%20PM.png?raw=true">
</p>

## March 2
### Goal: add instruction and enable restart function. 
### Status: success. 
### Problem 1: restarting the program, which basiclaly means going back to screen 0.
I had a hard time finding a way to go back to the starting page, and I realized that I had to go into my button class to do this. When the user clicks on the "Restart?" button, the button takes this as a yes and sets the value [screen] to 0, which means we will go back to the starting page. 
### Problem 2: resetting all the values back to their initial values. 
I realized that, after going back to screen 0, I had to reset all the necessary global values back to their intial values. Because some of these values were all changed during the first round, setting them back to their intial values is needed to have a "new" state of the game. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/Screen%20Shot%202021-03-03%20at%2011.33.09%20PM.png?raw=true">
</p>

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/Screen%20Shot%202021-03-03%20at%2011.33.35%20PM.png?raw=true">
</p>

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/Screen%20Shot%202021-03-03%20at%2011.33.43%20PM.png?raw=true">
</p>


## March 3
### Goal: add sounds
### Status: success.
I added sounds when the user clicks on the right answers or wrong answers, collects coins, wins or loses the game. Also the background music as well, which will be kept playing throughou the game except when the game is over or the user wins. 
### Problem: play the sound file only once
Since processing loops over the code severl times per second, if I don't put some flag variables to decide whether this sound has been played or not, the program will play the sound per iteration, which will result in the sounds stacked over each other at the rate of the frame (horrendous sounds). Therefore I came up with flag1 and flag2 to decide whether the sound has been played once or not. Of course, these two variables have to be reset when the game gets restarted. 

```
  if(flag1==0){
      win_sound.play();
    }
    
  if(flag2==0){
        gameover_sound.play();
      }
  
 ```

## Game Walkthrough/Solutions (Click on the gif to watch the video) 

<a href="https://youtu.be/md5BUZngqeI" target="_blank">

  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/midtermProject/progress_images/walkthru.gif?raw=true">

</a>


