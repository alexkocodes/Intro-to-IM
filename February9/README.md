#February9

#Ripple Arts by Using Class

##How It Works

I got inspired by my last assignment, and decided to create an interactive program where user can click on the screen and add more ripples to the screen. 
I made a ripple class, and every time the user clicks on the screen, it adds a new ripple to the ripple array. Each ripple has their own random color, and expands 
at their own rate without intervening others as well. 

##Demonstration 

<p align="center">
  <img src="">
</p>

##Difficulties

  ### Java Syntax
  I realized that there is some syntax difference between Java and C++ or Python. Therefore I had to look up some syntax and change my code, but overall the concepts
  are all the same and it wasn't a big deal. 
  ### Frame Rate 
  I realized that the frame rate by default is too fast for my ripples to grow in a way that people can observe. Therefore I had to try differnet frame rates to find 
  the one that best illustrates the ripple effect. 
  <p align="center">
  <img src="">
  </p>

  
## Chance Operations
  ### Making the inner circle disappear 
  I initially want to make inner circles disappear gradually to create a more realistic ripple effect, so I just draw circles filled with white color to "cover" the 
  circles. I reazlied that at first if the speed is the same, the white circles will almost catch up with the growing colored circles, and it will just show as one 
  single circle growing witb a think stroke. (See below) So I realized that I had to use a slower speed on the inner white circles so that they will grow slower than the outer
  ones. However, I just randomly put down a number for the speed so that the white circles would grow at a slower rate than the colored ones. It did not turn out 
  to be what I wanted, but I think this way creates an interestingly satisfying effect. So I just went with it! I can click 
  <p align="center">
  <img src="">
  </p>
  
  
  
  
