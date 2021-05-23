# BotSavesPrincess
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#setup">Setup</a>
    </li>
    <li><a href="#bot-saves-princess">Bot Saves Princess</a></li>
    <li><a href="#bot-saves-princess-2">Bot Saves Princess 2</a></li>
  </ol>
</details>


## About The Project

This is my submission for the [Bot saves princess](https://www.hackerrank.com/challenges/saveprincess) and [Bot saves princess - 2](https://www.hackerrank.com/challenges/saveprincess2) challenges on [HackerRank.com](https://www.hackerrank.com)

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](https://github.com/rspec/rspec-rails)


## Setup

To run this code on your own computer follow these steps:
1. Fork the project
2. Clone it in your terminal:
`git clone git@github.com:LiamCusack/BotSavesPrincess.git`
3. Navigate to the desired challenge using *one* of the following commands
  * 1:
`cd Bot_Saves_Princess_1`
  * 2:
`cd Bot_Saves_Princess_2`
4. Run the test suite:
`rspec`

If you would like to run the code on [HackerRank.com](https://www.hackerrank.com), copy and paste the content of the corresponding `Hackerrank_Submission.rb` file into the submission form found at the bottom of the page
  * [Bot saves princess](https://www.hackerrank.com/challenges/saveprincess)
  * [Bot saves princess - 2](https://www.hackerrank.com/challenges/saveprincess2)
  
  
## Bot Saves Princess

### Approach 

My goal was to successfully complete this challenge while adequately demonstrating my skills in Test Driven Development, Object Oriented Programming and Github version control. In order to reach this goal, I directed my focus into these four objectives:
1. Organize my work through branching
2. Write tests before implementing any functional code
3. Commit Frequently
4. Abstract my code into sensible classes

### Writing the Code

I chose to break the data given to us into 4 separate class; A class for the bot, a class for the princess, a class for the grid, and a class for the Path used to find the princess. While the bot and the princess were both hardcoded into the grids that hackerrank supplied, and could easily have just been incorporated into the grid class, I chose to store them as objects belonging to their own class for ease of use later on.

#### Bot

Originally when I created the bot class, I created it with only the two coordinates used to identify its starting location. Seeing as the bot's starting location in challenge one was always the center, I was able to hard code the coordinates, since the exact center of the grid would always be the grid's size minus one then divided by 2. Later on I added in a methods `updated_coords` so that I could check on what the coordinates were at any given time. Originally I stored this as an instance variable, but I realized doing so made the coordinates static which would result in an infinite loop when comparing them to the princess' coordinates to determine which move the bot needed to make next.

#### Grid

My next focus was on the grid. Since the grid is supplied by the user, I made its primary functionality storing the arguements provided by HackerRank as well as identifying the location of the princess. Since I knew that the princess would always spawn in one of the four corners, I simply needed to check each corner's index within the grid until I found which one she resided in. Once I did this, I returned the coordinates of the princess corner so that they could be retrieved by calling the `locate_princess` method. 

The grid class was also where I stored my error responses in the event a user tried to pass parameters outside of those allowed by the code challenge. I did this by raising an `ArgumentError` which would inform the user in how to submit valid parameters.

#### Princess

The princess class exists only to store the princesses coordinates. She is initialized with a grid object so that she can obtain the parameters from the grid's locate_princess method. Since her x and y values are static upon her creation, I chose to initial her with a `coords` instance variable along with the individual `x` and `y` values.

#### Path

The path class is where the bulk of the logic exists in this challenge. A path object is initialized taking bot and princess objects as arguments. I chose this as these objects contained everything that was needed in order to successfully navigate the bot to the princess. Originally, I mistakenly included the grid as an arguement I initialized path with, only to realize that all of the grid logic now lived in bot and princess and was not used on its own. 

The path class essentially solves the challenge by utilizing three methods:
1. `path_to_princess`
2. `movement`
3. `output`

The `path_to_princess` method calls the `movement` method, then checks whether or not the bot's coordinates match those of the princess. It will repeat this process until they match, at which point it calls the `output` method.

The `movement` method checks the bot's x and y coordinates individually to see whether the values are greater or less than that of the princess's coordinates. It increase them or decrease them accordingly, then store the move that was made in the `@output_moves` instance variable.

The `output` method iterates over the `@output_moves` instance variable, and prints each stored move to it's own line of the terminal, thus fulfilling the requirements of the challenge.

## Bot Saves Princess 2

### Approach

This challenge was very similar to the first, but with several added twists. This time I was required to account for the bot and princess both being added randomly. Additionally, there was no longer a requirement for the board size to be an even number. The only stipulation was the the size needed to be less than 100. Finally, I was only required to print the next step the bot needed to take to reach the princess rather than all of them.

My goal with this challenge was to successfully and efficiently meet the requirements while reusing as much code from the first challenge as possible. I was successful in this as very much of my code was in fact reuseable. All of the same classes were present, and all changes are listed below.

#### Bot

The bot class was no longer defaulted to the center of the board, however, the row and column of the bot's coordinates were passed by hackerrank, allowing for me to once again hard code them. 

#### Grid

Since the princess was no longer confined to the corners, I needed to broaden my search to include all the spaces within the grid array. I did this by altering the `locate_princess` method and using the `.any?` enumerable to check if any of the strings within the grid array contained the substring `"p"`. Upon finding this string, I shoveled the index of this string into a variables labeled `coords`. I then shoveled the index of the substring `p` within the aforementioned string in coords as well. I then had the method return the coords variable so that the princess class could use the same method in order to store her coordinates.

#### Princess

Unchanged.

#### Path

Very little needed to be changed in order to make the path class work for the second challenge. `Output` and `movement` remained the same. The `path_to_princess` method was renamed to `path_next_step`, and rather than running the `movement` method until the bot coords matched the princess coords, it would only check to make sure that they were not the same, then run `movement` once before running `output` which would then print the stored moves.
