<h1> Battleships </h1>
Block 2 Project for Computer Science Year 1 @ Middlesex University 

<h3> Description: </h3>

  In this very simple version on the Battleships board game, two players can play against each other on the same machine, taking turns at aiming at coordinates to try to take down the opponents Battleships.
   
  The grid has 16 coordinates - A1 to D4 - in which the player can place their Cruiser (3 pieces long) and their Destroyer (2 pieces long). After placing their ships, the players take turns at aiming at the opponent's ships, but will have to turn around after each turn, as the screen is shared.
  
  The first one to shoot down both ships wins!

<h2> Index:</h2>

Battleship:
  1. Battleship.rkt - Original racket file
  2. Battlship.exe - Stand-alone executable of the Battleships game
  3. Presentation.pptx - Powerpoint presentation
  4. Battleship/Docs - Supporting Documents:
  
      4.1 - Activity_BS.png - UML Activity Diagram
      
      4.2 - Topdown_BS.png - Top Down Diagram
      
      4.3 - Usecase_BS.png - Use Case
  5. Battleship/Reference - Material and handouts used.


<h2> INSTRUCTIONS: </h2>


1. Download files <a href="https://github.com/guilhermemmeirelles/Battleship/releases/tag/v0.1-alpha">here</a>.

2. Run Battleship.exe.
  
3. New Game will show the grid. Pressing start will allow you to start placing pieces.
  
4. To place the ships, enter the desired coordinate (A1 to D4) into the text-box above "start" and press enter.
  
      4.1 The first ship is 3 pieces long, so they must all be placed together. Same for the second (2 piece long) ship.

5. After both player place their ships, they can use the same text-box to aim at a coordinate in the grid and try to take down the opponents ships.
 
6. After a hit, the player gets another turn. If they miss, the coordinate will turn black, so they know it can't be shot again.
  
7. When a player shoots down both of the opponents ships, they win.  
  
  
  
<h2> Additional info </h2>

  <h3>Specification: </h3>
  
  Our goal was to create an accurate representation of the Battleship board game using, first of all a 10x10 grid and 5 ships. 
  Since it is a video-game based version of the board game, we also originally planned to have mouse controls and allow for online play.
  
  <h3> Implementation </h3>
    
  Due to time and resource constraints, we opted to reduce the size of the grid to 4x4 and reduce the number of ships to 2. This way, we were able to finish the game and create most of the functions that would allow us to extend it after the project, should we wish to.
  Mouse controls were replaced by keyboard coordinate inputs due to their compability with hash maps which allow for much easier testing of the game rules and conditions.
  Networking has also not been implemented for the time being (v.0.1).
  
 
  
  
 

  
  
  
  
  
