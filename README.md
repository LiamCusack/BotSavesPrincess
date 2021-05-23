The grid class was also where I stored my error responses in the event a user tried to pass parameters outside of those allowed by the code challenge. I did this by raising ArgumentErrors which would inform the user in how to submit valid parameters.

#### Princess

The princess class exists only to store the princesses coordinates. She is initialized with a grid object so that she can obtain the parameters from the grid's locate_princess method. Since her x and y values are static upon her creation, I chose to initial her with a "coords" instance variable along with the individual x and y values.

#### Path

The path class is where the bulk of the logic exists in this challenge. A path object is initialized taking bot and princess objects as arguments. I chose this as these objects contained everything that was needed in order to successfully navigate the bot to the princess. Originally, I mistakenly included the grid as an arguement I initialized path with, only to realize that all of the grid logic now lived in bot and princess and was not used on its own. 

The path class essentially solves the challenge by utilizing three methods:
1. path_to_princess
2. movement
3. output

The path_to_princess method calls the movement method, then checks whether or not the bot's coordinates match those of the princess. It will repeat this process until they match, at which point it calls the output method.

The movement method checks the bot's x and y coordinates individually to see whether the values are greater or less than that of the princess's coordinates. It increase them or decrease them accordingly, then store the move that was made in the @output_moves instance variable.

The output method iterates over the @output_moves instance variable, and prints each stored move to it's own line of the terminal, thus fulfilling the requirements of the challenge.

## Bot Saves Princess 2

### Approach

This challenge was very similar to the first, but with several added twists. This time I was required to account for the bot and princess both being added randomly. Additionally, there was no longer a requirement for the board size to be an even number. The only stipulation was the the size needed to be less than 100. Finally, I was only required to print the next step the bot needed to take to reach the princess rather than all of them.

My goal with this challenge was to successfully and efficiently meet the requirements while reusing as much code from the first challenge as possible. I was successful in this as very much of my code was in fact reuseable. All of the same classes were present, and all changes are listed below.

#### Bot

The bot class was no longer defaulted to the center of the board, however, the row and column of the bot's coordinates were passed by hackerrank, allowing for me to once again hard code them. 

#### Grid

Since the princess was no longer confined to the corners, I needed to broaden my search to include all the spaces within the grid array. I did this by altering the locate_princess method and using the .any? enumerable to check if any of the strings within the grid array contained the substring "p". Upon finding this string, I shoveled the index of this string into a variables labeled "coords". I then shoveled the index of the substring "p" within the aforementioned string in coords as well. I then had the method return the coords variable so that the princess class could use the same method in order to store her coordinates.

#### Princess

Unchanged.

#### Path

Very little needed to be changed in order to make the path class work for the second challenge. Output and movement remained the same. The path_to_princess method was renamed to path_next_step, and rather than running the movement method until the bot coords matched the princess coords, it would only check to make sure that they were not the same, then run movement once before running output.
