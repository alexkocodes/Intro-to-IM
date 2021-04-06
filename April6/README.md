# Arduiono + iPod 
<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/April6/iPod-Nano.jpeg?raw=true">
</p>

## How It Works 
For this assignment I have decided to create something that I had as a kid: an iPod. The user can twist the potentiometer and select one of the four songs to play. The user can later press and hold on the green switch to speed up the song, or the yellow switch to slow down the song. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/April6/IMG_4529.jpg?raw=true">
</p>


## Difficulty
### Float vs. Int
In my code, t represents the variable which controls the speed of the song at the rate of ±0.1. I use Duration = Duration/t to generate a new duration of each note, which basically controls how fast the song will go. If t is getting bigger, the duration is shorter and hence the song is faster. If t is decreasing, the duration is longer and hence the song is slower. However, at first Duration was declared as int and t was declared as float. Therefore when I printed the Durations out, the decimals were neglected after the calculation. 
```
// float
float Duration = 1000 / Durations[thisNote];
Duration = Duration/t;
312.50
312.50
312.50
312.50
312.50

// int
int Duration = 1000 / Durations[thisNote];
Duration = Duration/t;
156
156
312
312
156
```
Therefore, I chose to declare everything as float to have precise values. 

## Interesting Things 
### Createing Arrays of Melodies 
I have created four arrays of melodies and durations for four different songs. At first I thought it was difficult, but I realized the pitches.h file contains notes across 8 octaves, and the notes are easy to identify with a quick google search for note sheets. And the buzzer does not wear out or lose quality even when things are speeding up really fast. This led me to think that one day I can listen to Beethoven by just creating the correct array melodies and durations. And since it is machine, it never misses a note! (Will machine become a professional pianist who never makes a mistake?) 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/April6/turkish%20march.png?raw=true">
</p>

## Video

https://youtu.be/hyJ-tGWdOvI
