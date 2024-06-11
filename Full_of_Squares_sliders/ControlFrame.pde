
class  ControlFrame  extends  PApplet  {

  int        w, h;
  String     name;
  PApplet    parent;
  ControlP5  cp5;

  public  ControlFrame(PApplet  _parent, int _w, int _h, String _name)  {
  
    super();
  
    parent =  _parent;
    w      =  _w;
    h      =  _h;
    name   =  _name;

    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public  void  settings  ()  {
    size(w, h);
  }

  public  void  setup     ()  {

    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);

    int  widgetXOffset = 80;
    int  widgetYOffset = 20;

    //
    // Grid
    //
    widgetYOffset += 30;
    cp5.addSlider("Grid X Size")
       .plugTo(parent, "GRID_X_SIZE")
       .setRange( 1, 12 )
       .setValue( 10 )
       .setPosition(widgetXOffset, widgetYOffset)
       .setSize    (200, 20);

    widgetYOffset += 30;
    cp5.addSlider("Grid Y Size")
       .plugTo(parent, "GRID_Y_SIZE")
       .setRange( 1, 12 )
       .setValue( 10 )
       .setPosition(widgetXOffset, widgetYOffset)
       .setSize    (200, 20);

    widgetYOffset += 30;
    cp5.addSlider("Grid X Offset")
       .plugTo(parent, "GRID_X_OFFSET")
       .setRange( 20, 120)
       .setValue( 80 )
       .setPosition( widgetXOffset, widgetYOffset )
       .setSize    (200, 20);

    widgetYOffset += 30;
    cp5.addSlider("Grid Y Offset")
       .plugTo(parent, "GRID_Y_OFFSET")
       .setRange( 20, 120)
       .setValue( 80 )
       .setPosition( widgetXOffset, widgetYOffset )
       .setSize    (200, 20);


    //
    // Square
    //
    widgetYOffset += 30;
    cp5.addSlider("square Offset Max")
       .plugTo(parent, "squareOffsetMAX")
       .setRange( 0, 10)
       .setValue( 10 )
       .setPosition( widgetXOffset, widgetYOffset )
       .setSize    (200, 20);

    widgetYOffset += 30;
    cp5.addSlider("square Size Max")
       .plugTo(parent, "squareSizeMAX")
       .setRange(10, 80)
       .setValue(50)
       .setPosition( widgetXOffset, widgetYOffset )
       .setSize    (200, 20);
       
  }

  void draw() {
    background(190);
  }
}
