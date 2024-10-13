# Tic-Tac-Toe Command Line Game

Welcome to the **Tic-Tac-Toe** game! This is a command-line implementation of the classic game for two players. Each player takes turns to place their marker (X or O) on a 3x3 grid, and the goal is to be the first to get three markers in a row — horizontally, vertically, or diagonally.

## Table of Contents

- [Installation](#installation)
- [How to Play](#how-to-play)
- [Features](#features)
- [Technologies](#technologies)

## Installation

### Prerequisites

- Ruby 3.x or above installed on your system.
- Clone this repository to your local machine.

### Setup Instructions

1. Clone the repository:

2. Run the game:

   ```bash
   ruby main.rb
   ```

## How to Play

1. Run the game using the command `ruby main.rb`.
2. You will be prompted to enter Player 1 and Player 2 names.
3. Players will take turns choosing a cell (1 to 9) where they want to place their marker.
4. The game will announce a winner if three markers align in a row, column, or diagonal. If all cells are filled without a winner, the game ends in a tie.

## Features

- Two-player game.
- Board display with markers and options.
- Detects wins (horizontal, vertical, diagonal).
- Detects ties.
- Prevents players from choosing an occupied cell.

## Technologies

- **Ruby**: The game logic is written in Ruby.
- **Colorize Gem**: Used to add color to the game messages and board.

### Class Breakdown

- **Game**: Manages the flow of the game, including initializing players, controlling turns, and checking the game state.
- **Board**: Responsible for rendering the board, updating it with player moves, and checking for winning conditions.
- **Player**: Handles player input and ensures that valid moves are made.
