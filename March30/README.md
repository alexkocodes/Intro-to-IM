# March 30
## Using analog and digital input 
### How this works 
The user puts their finger on top of the light sensor, and depending on the sensor value, the blue and yellow lights will display a certain pattern, such as (1) blue on, yellow off, (2) blue off, yellow on, (3) both on, (4) both off. The green switch uses the digitalRead to turn on the green light. Your job is to turn all three LED lights on by putting your finger near the light sensor to achieve  the (3) pattern, and then pressing the green switch. 
### Demonstration 

### Difficulty
The sensor value is always increasing or decreasing, therefore I could not choose a specific value to decide which pattern to use. Also our fingers are shaky and therefore the value is not always fixed. Thus, I had to use range for each pattern to achieve this! And it worked! I adjust the pattern so that it is not that easy to turn both lights on. You have to put your finger really close to the sensor but not too close. This can be a game to train your muscle stability. 

### What I Learned 
When I put HIGH as the analog output for one of the LEDs, the light was not as bright as it used to be when I used digital output. I soon realized that, for analogWrite the range is 0 to 255! And for analogRead the range is 0 to 1000. I adjust the value and now the LED is as bright as it could be. 

Example when I put LOW as the output value: 

<p align="center">
  <img src="">
</p>


### Schematic 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/March30/march30.jpg?raw=true">
</p>
