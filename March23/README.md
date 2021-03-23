# Catch the Lights! 
## Inspired by the following game...

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/March23/3013.jpeg?raw=true">
</p>



## How to play this game

1. When the game starts, all four LED lights will flash twice, and then 2 seconds later the game starts. 
2. You will see a light turned on randomly for random seconds, and you wait for a random amount of time until the next light is turned on! 
3. Once you see a light is on, you have to press the corresponding button to turn it off in order to "catch" it. Or otherwise it will be turned off automatically 
and you "lose" that light. 
4. There are ten lights for you to catch. 
5. If you catch them all, all four LEDs will blink twice at the end. 
6. If you lose any of them, you lose! And on the screen you can see how many you have caught. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/March23/IMG_4310.jpg?raw=true">
</p>

## Difficulty 
1. This is my first time trying Arduino and building my circuts. Therefore I had a hard time connecting the inputs and outputs. I followed the examples during the class and I managed to build a preliminary 
circuit where the the lights get turned on by its corresponding button (see below). 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/March23/ezgif.com-gif-maker%20(1).gif?raw=true">
</p>

2. In addition, even though arduino is based on C++ which I am already familiar with, arduino has its own set of special functions to communicate between the code and the circuit. It is a new concept to me since I am a cs major and mostly what I do is just code. But overall I find it very interesting as well because I get to have some hands on experiments. 

## Delay() is a bad idea. 
I realized that when I use delay() to turn the lights on for a short amount of time, the whole program stops doing anything, which is not what I intended because I still need the program to detect when the user presses on the button or not during this amount of time. Therefore I found a solution online where I can use millis() to count the time passed by and perform another task. This way the program is not stopping at any point of the game. 

## Schematic 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/March23/IMG_4311.jpg?raw=true">
</p>

## Video Demonstration 

https://youtu.be/G8WYuYGYC3A
