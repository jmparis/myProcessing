

import controlP5.*;

ControlFrame cf;


final  int  WIN_WIDTH    =  800;
final  int  WIN_HEIGHT   =  800;

int  GRID_X_SIZE    =  10;
int  GRID_Y_SIZE    =  10;
int  GRID_X_OFFSET  =  80;
int  GRID_Y_OFFSET  =  80;
int  GRID_CELL_SIZE =  80;

int  squareSizeMAX  =  50;
int  squareOffsetMAX=  10;


void  settings() {
  size( WIN_WIDTH + GRID_X_OFFSET * 2, WIN_HEIGHT + GRID_Y_OFFSET * 2 );
  //fullScreen();
}

void  setup()  {
  cf = new ControlFrame(this, 400, 800, "Controls");

  // Postion from upper-left corner for the Sketch window
  surface.setLocation(420, 10);

  // ADD r, g, b channels
  blendMode(ADD);
}


boolean freeze_screen = false;

void  draw()  {
  
  if ( !freeze_screen ) {
    background ( 0 );
    //text( "Type 'f' to freeze screen animation", 5, 15 );

    int i = 0;
    while ( i < GRID_X_SIZE )  {
//    println("");
//    print( i + "  " );

      int j = 0;
      while ( j < GRID_Y_SIZE )  {
//      print( j + " " );
    
        float  squareOffset  =  random( squareOffsetMAX );
        float  squareSize    =  random( squareSizeMAX   );
        float  myCol         =  random( 255 );

        int    posX = i * GRID_CELL_SIZE;
        int    posY = j * GRID_CELL_SIZE;

        fill( myCol,     0,     0 );
        rect( posX + squareOffset * 0 + GRID_X_OFFSET, posY + squareOffset * 0 + GRID_Y_OFFSET, squareSize, squareSize );
    
        fill(     0, myCol,     0 );
        rect( posX + squareOffset * 1 + GRID_X_OFFSET, posY + squareOffset * 1 + GRID_Y_OFFSET, squareSize, squareSize );

        fill(     0,     0, myCol );
        rect( posX + squareOffset * 2 + GRID_X_OFFSET, posY + squareOffset * 2 + GRID_Y_OFFSET, squareSize, squareSize );
    
        j = j + 1;
      }
  
      i = i + 1;
    }
  }
}


void  keyPressed  ()  {
  if ( key == ESC )  {
    stop();
  }

  if ( key == 'f' || key =='F' ) {
    freeze_screen = !freeze_screen;
  }
}

//
