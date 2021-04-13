# Processing & Arduiono: Serial Communication 
## How it works
I built my program based on the [gravity example](https://github.com/aaronsherwood/introduction_interactive_media/blob/master/arduinoExamples/serialExamples/buildOffThisOne/buildOffThisOne.ino) provided in class, and with the following modifications:
1. When the ball hits the ground, one of the four LEDs will light up. 
2. Use the potentiometer to move the hand. 
3. Press the blank key to drop a ball from the hand.
4. Use the left and right arrow key as wind to blow the ball. 
5. The floor is divided into four different color areas: green, yellow, blue, and red from left to right. When the ball hits the floor, the light with the corresponding color will light up, even when you use the wind to blow the ball. 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/April13/drop.gif?raw=true">
</p>

## Challenges
### Forgot to turn the lights off! 
I wanted the light to be turned on every time the ball hits the ground, so I wrote the following code. 
```
 if (position.y > height-mass/2) {
      velocity.y *= -0.9;  // A little dampening when hitting the bottom
      position.y = height-mass/2;
      if(position.x <= 160){
        onOffgreen = true;
        fill(171, 235, 198 );
      }
      else if (position.x > 160 && position.x <= 320){
        onOffyellow = true;
        fill(249, 231, 159);
      }
      else if(position.x > 320 && position.x <= 480){
        onOffblue = true;
        fill(174, 214, 241 );
      }
      else{
        onOffred = true;
        fill(245, 183, 177);
      }
      
    }
```
But soon I realized that, once the ball hits the ground the light will be on forever and it does not turn off when the ball bounces back to the air. Then I remembered that I forgot to change the value back to false! which equals to 0 in arduino when I use digitalWrite on LED lights. So I added the following code: 
```
else{  // when the ball is in the air
      onOffred = false;
      onOffblue = false;
      onOffyellow = false;
      onOffgreen = false;
      
    }
```
### Rememeber to map! 
I wanted to move the hand on top of the screen, but sometimes the hand would move out of screen. The value I read from the potentiometer is from 0 to 1023, and I realized that the width of my screen is only 640! So I remembered I could use the map() function to map my value! But also since the position of the image starts from the top left corner, I have to adjust the range to __-10, width-40__. 
```
cursor.x = map(parseInt(s), 0, 1023, -10, width-40);
```



## Interesting things I discovered...
### Potentiometer value changed when one of the LED lights up. 
I noticed that the moment when the light is turned on, the value of the potentiometer sent from arduino also changed...which further causes the hand to move a little bit since the x position of the hand is based on the value from the potentiometer. I am not sure why this is happening and I can only guess that perhaps when the light is turned on, it also changes the voltage of the potentiometer a little bit. 

## Conclusion
I found this assignment very interesting and hands-on! It was my first time making something between processing and arduino. It is also more complicated as well since we have to communicate between two different programs. This also inspired me to think of the arduino as the game console for my final project! 

## Video 

https://youtu.be/lr4UsIStpF4


## Schematic 
