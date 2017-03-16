void setup()
{
  size(500, 500);
  
  board = new boolean[rows][cols];
  cellWidth = width / cols;
  cellHeight = height / rows;
  
  board[0][5] = true;
  board[1][5] = true;
  board[2][10] = true;
  board[3][5] = true;
  
}

boolean[][] board;
int cols = 100;
int rows = 100;
int cellWidth;
int cellHeight;

void makeGlider(int row, int col)
{      
  board[row][col + 1] = true;
  board[row + 1][col + 2] = true;
  board[row + 2][col] = true;
  board[row + 2][col + 1] = true;
  board[row + 2][col + 2] = true;
}

int countLiveCells(int row, int col)
{
  int count = 0;
  // Check to the left
  if ((col > 0) && (board[row][col - 1]))
  {
      count++;
  }
  // Check above left
  if ((col > 0) && (row > 0) && (board[row - 1][col - 1]))
  {
      count++;
  }
  // Check above
  if ((row > 0) && (board[row - 1][col]))
  {
      count++;
  }
  // Check above right
  if ((row > 0) && (col < (cols - 1)) && (board[row - 1][col + 1]))
  {
      count++;
  }
  // Check right
  if ((col < (cols - 1)) && (board[row][col + 1]))
  {
      count++;
  }

  // Check bottom right
  if ((row < (rows - 1) ) && (col < (cols - 1)) && (board[row + 1][col + 1]))
  {
      count++;
  }

  // Check bottom 
  if ((row < (rows - 1)) && (board[row + 1][col]))
  {
      count++;
  }

  // Check bottom left 
  if ((col >0) && (row < (rows - 1)) && (board[row + 1][col - 1]))
  {
      count++;
  }

  return count;
}

void drawMouse()
{
  int row = mouseY / cellHeight;
  int col = mouseX / cellWidth;
  board[row][col] = true;
}

void keyPressed()
{
  if (key == '1')
  {
    int row = mouseY / cellHeight;
    int col = mouseX / cellWidth;
    makeGlider(row, col);
  }
  if (key == 'r')
  {
    randomise();
  }
  if (key == 'c')
  {
    clearBoard();
  }
}

void clearBoard()
{
  for (int row = 0 ; row < rows ; row ++)
  {
    for (int col = 0 ; col < cols ; col ++)
    {
      board[row][col] = false;
    }   
  }
}

void randomise()
{
  for (int row = 0 ; row < rows ; row ++)
  {
    for (int col = 0 ; col < cols ; col ++)
    {
      if (random(0, 1) > 0.5)
      {
        board[row][col] = true;
      }
      else
      {
        board[row][col] = false;
      }
    }   
  }
}

void mousePressed()
{
  drawMouse(); 
}

void mouseDragged()
{
  drawMouse(); 
}
void draw()
{
  // Nested for loop that goes through the board array
  // And if the element is true, it draws a rect
  
  for (int row = 0 ; row < rows ; row ++)
  {
    for (int col = 0 ; col < cols ; col ++)
    {
      float x = col * cellWidth;
      float y = row * cellHeight;
      stroke(50);
      if (board[row][col])
      {
        fill(0, 255, 255);        
      }
      else
      {
        fill(0);        
      }
      rect(x, y, cellWidth, cellHeight);
    }
  }
  
  
}