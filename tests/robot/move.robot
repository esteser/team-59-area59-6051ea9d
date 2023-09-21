*** Settings ***
Documentation     I want to move my character. If they attempt to move past a boundary, the move results in no change in position.
Test Template     Move character
Library           MoveLibrary.py

*** Test Cases ***                   StartingX     StartingY     StartingMoveCount     Direction     EndingX     EndingY     EndingMoveCount
Move in the middle of the board      3             2             1                     NORTH         3           3           2
Move from corner                     0             0             3                     NORTH         0           1           4
Move on the edge of the board        0             0             5                     SOUTH         0           0           6
Move from (0,0) coord of board       0             0             0                     EAST          1           0           1
Move from (0,0) coord of board       0             0             0                     WEST          0           0           1
Move from (0,0) coord of board       0             0             0                     NORTH         0           1           1
Move from (0,0) coord of board       0             0             0                     SOUTH         0           0           1
Move from (0,9) coord of board       0             9             0                     EAST          1           9           1
Move from (0,9) coord of board       0             9             0                     WEST          0           9           1
Move from (0,9) coord of board       0             9             0                     NORTH         0           9           1
Move from (0,9) coord of board       0             9             0                     SOUTH         0           8           1
Move from (9,9) coord of board       9             9             0                     EAST          9           9           1
Move from (9,9) coord of board       9             9             0                     WEST          8           9           1
Move from (9,9) coord of board       9             9             0                     NORTH         9           9           1
Move from (9,9) coord of board       9             9             0                     SOUTH         9           8           1
Move from (9,0) coord of board       9             0             0                     EAST          9           0           1
Move from (9,0) coord of board       9             0             0                     WEST          8           0           1
Move from (9,0) coord of board       9             0             0                     NORTH         9           1           1
Move from (9,0) coord of board       9             0             0                     SOUTH         9           0           1
Move from (5,5) coord of board       5             5             0                     EAST          6           5           1
Move from (5,5) coord of board       5             5             0                     WEST          4           5           1
Move from (5,5) coord of board       5             5             0                     NORTH         5           6           1
Move from (5,5) coord of board       5             5             0                     SOUTH         5           4           1



*** Keywords ***
Move character
    [Arguments]    ${startingX}    ${startingY}    ${startingMoveCount}    ${direction}    ${endingX}    ${endingY}    ${endingMoveCount}
    Initialize character xposition with  ${startingX}
    Initialize character yposition with  ${startingY}
    Initialize character moveCount with  ${startingMoveCount}
    Move in direction                    ${direction}
    Character xposition should be        ${endingX}
    Character yposition should be        ${endingY}
    Character moveCount should be        ${endingMoveCount}