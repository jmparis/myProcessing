import   ddf.minim.*;
import   ddf.minim.analysis.*;


Minim    minim;
AudioInput  myAudio;  // get the audio from microphone
FFT      myAudioFFT;

boolean  showVisualizer    =  true;  // Display the FFT spectrum

// Parameters for the FFT spectrum
int      myAudioRange      =   101;  // The amount of FFT samples
int      myAudioMax        =   100;  // The amount of sound coming in

float    myAudioAmp        =  40.0;  
float    myAudioIndex      =   0.2;
float    myAudioIndexAmp   =  myAudioIndex;
float    myAudioIndexStep  =  0.35;

float[]  myAudioData       =  new float[myAudioRange];  // An array for the FFT numbers Z being anaylised

// ---------------

int      rect  =  80;    // rec size
int      x     =  20;    // x position
int      y     =  20;    // y position
int      y_    =  rect;  // row

int[]    nums  =  new int[8];  // An array of rectangles


// ---------------

void  setup  ()  {

  size(700, 700);
  background( #202020 );

  minim    =  new Minim( this );
  myAudio  =  minim.getLineIn( Minim.MONO );  // My audio comes from minim. Thanks to Minim.getLineIn()
  
  //myAudio = minim.loadFile("my_file.wav");
  //myAudio.loop();
    
  myAudioFFT  =  new FFT( myAudio.bufferSize(), myAudio.sampleRate() );
  myAudioFFT.linAverages( myAudioRange );
  myAudioFFT.window( FFT.GAUSS );
  
  for ( int i = 0; i < nums.length; i++ ) {
      nums[ i ] = 80;  // The Array of the many rectangles to draw
  }
  
}


void  draw  ()  {

  myAudioFFT.forward( myAudio.mix );
  myAudioDataUpdate();
  
  background( #202020 );
  fill( 255, 255 );  // Fill colour, alpha
  stroke( 1 );
  round( 5 );

  for ( int i = 0; i < nums.length; i++ ) {  // another loop for rect
  
    int  fftFillColor  =  (int)  map( myAudioData[ i ], 0, myAudioMax, 0, 255 );  // Map it my audio data, from 0 to my audio max and paint it with 0 up to 255 or black to white
    fill( fftFillColor, 225 );
    
    rect( x           ,  y         , rect     , rect      );
    rect( x + i * rect,  y + y_ * 0, nums[ i ], nums[ i ] );
    rect( x + i * rect,  y + y_ * 1, nums[ i ], nums[ i ] );
    rect( x + i * rect,  y + y_ * 2, nums[ i ], nums[ i ] );
    rect( x + i * rect,  y + y_ * 3, nums[ i ], nums[ i ] );
    rect( x + i * rect,  y + y_ * 4, nums[ i ], nums[ i ] );
    rect( x + i * rect,  y + y_ * 5, nums[ i ], nums[ i ] );

  }

  if  (showVisualizer)
      myAudioDataWidget();

  String monitoringState = myAudio.isMonitoring() ? "enabled" : "disabled";
  text( "Input monitoring is currently " + monitoringState + ".", 5, 15 );
}


void  myAudioDataUpdate  ()  {

  for (int i = 0; i < myAudioRange; ++i) {  // A llop to analyse the sound of myAudioRange
      float  tempIndexAvg  =  (myAudioFFT.getAvg( i ) * myAudioAmp ) * myAudioIndexAmp;
      float  tempIndexCon  =  constrain( tempIndexAvg, 0, myAudioMax );
      myAudioData[ i ]     =  tempIndexCon;
      myAudioIndexAmp     +=  myAudioIndexStep;
  }

  myAudioIndexAmp  =  myAudioIndex;
}


void  myAudioDataWidget  ()  {  // myAudioData widget function generates the FFT sound spectrum.
  // noLights
  // hint( DISABLE_DEPTH_TEST );
  
  noStroke();
  fill(0, 200);
  rect(0, height - 112, width, 102);
  
  for (int i = 0; i < myAudioRange; ++i) {
      if  (i == 0)
          fill( #237D26 );
      else
          if  (i == 3)
              fill( #80C41C );
          else
              fill( #CCCCCC );

      rect(10 + (i * 5), (height - myAudioData[ i ]) - 11,   4, myAudioData[ i ]);
  }

  // hint(ENABLE_DEPTH_TEST);
}

void  keyPressed  ()  {
  if ( key == 'm' || key == 'M' )  {
    if ( myAudio.isMonitoring() )  {
      myAudio.disableMonitoring();
    }
    else  {
      myAudio.enableMonitoring();
    }
  }
}

void  stop  ()  {
    myAudio.close();
    minim.stop();
    super.stop();
}
