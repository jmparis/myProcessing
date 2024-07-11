int    n=999;
int    i;
int    s;
float  a[]  =  new float[n*5], r, d, k;

void  setup()  {
  size( 800, 800 );

  for ( i = 0; i < n ; i++ ) {
      r = TAU * noise( i );
      d = 400 * noise( i*2 );
      a[ i       ] = d * sin(r) + 400;
      a[ i + n   ] = d * cos(r) + 450;
      a[ i + n*4 ] = random( 30 ) + 5;
  }
}

void draw() {
  background( #F0E0D0 );
  noStroke();
  fill( 0, 50 );
  
  for (i = 0 ; i < n ; i++ ) {
     for (s = 0 ; s < n ; s++ ) {
       if ( i != s ) {
          d = dist( a[ i ], a[ i + n ], a[ s ], a[ s + n] );
          k = a[ s + n*4 ] * a[ i + n*4 ] / d / d / 5e4;
          a[ i + n*2 ] += (a[s    ] - a[ i   ]) * k;
          a[ i + n*3 ] += (a[s + n] - a[ i+n ]) * k;
       }
     }
     
     a[ i     ] += a[ i + n*2 ];
     a[ i + n ] += a[ i + n*3 ];

     circle( a[ i ], a[ i + n ], a[ i + n*4 ]);
  }
}
