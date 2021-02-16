# Can you understand a computer's poetic mind? 

<p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/Feb-16.gif?raw=true">
</p>

## How It Works

This program generates a confusing but hilarious poem every time you click the screen. I loaded a csv files that containes a bunch of random verbs, bodyparts, places, celebrity names, etc, and put them into a poem format string. I used noLoop() and loop() to generate one poem each click. 


## Difficulties

  ### Finding the correct columns in the CSV file.
   
  I realized I had to use the function getStringColumn to load a whole column by its header name, which is a little bit different than what we do in C++ (but more convenient). 
  
  ```
  table = loadTable("words.csv", "header");
  verbs = table.getStringColumn("verbs");
  nouns = table.getStringColumn("nouns");
  adverbs = table.getStringColumn("adverbs");
  bodyparts = table.getStringColumn("body parts");
  places = table.getStringColumn("places");
  adjectives = table.getStringColumn("adjectives");
  celebs = table.getStringColumn("celebs");
  
 ```
  
  ### My initial sketch 
  
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/initial.png?raw=true">
  </p>

  ### Without fonts
  
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/intial2.png?raw=true">
  </p>


  
## Some hilarious examples

  ### Did anybody see Drake in Barbados the other day? 
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/Drake.png?raw=true"
  </p>
  
  ### I never know Katy Perry damages people's skin. 
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/Katy%20Perry.png?raw=true"
  </p>
  
  ### It must be nice to have Lady Gaga admire your skull. 
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/Lady%20Gaga.png?raw=true"
  </p>
  
  ### Jennifer Lawrence observes your abdomen? 
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/jennifer.png?raw=true"
  </p>
  
  ### You saw John F. Kennedy?! 
  <p align="center">
  <img src="https://github.com/fyk211/Intro-to-IM/blob/main/February16/john.png?raw=true"
  </p>
  
  
  
  
  
  
