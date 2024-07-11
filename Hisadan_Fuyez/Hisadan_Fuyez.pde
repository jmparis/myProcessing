//
// hisadan
// https://scrapbox.io/hisadan/%E9%80%83%E3%81%92%E3%82%8B_(2024%2F6%2F20)
//

int n=999, i, s;
float a[]=new float[n*2], x, y, e, f, d, k=400;
void setup() {
  size(800, 800);
  for (i=0; i<n*2; i++)a[i]=random(-k, k);
}
void draw() {
  noStroke();
  fill(0, 9);
  square(0, 0, 800);
  translate(k, k);
  fill(-1);
  for (i=1; i<n; i++  ) {
    x=0;
    y=0;
    for (s=1; s<n; s++) {
      if (i!=s) {
        d=dist(a[i], a[i+n], a[s], a[s+n]);
        e=(a[s]-a[i])/d/d;
        f=(a[s+n]-a[i+n])/d/d;
        x+=d<50?-9*e:e;
        y+=d<50?-9*f:f;
      }
    }
    d=dist(a[i], a[i+n], a[0], a[n]);
    a[i]+=x-200*(a[0]-a[i])/d/d;
    a[i+n]+=y-200*(a[n]-a[i+n])/d/d;
    circle(a[i]*=abs(a[i])>k?-1:1, a[i+n]*=abs(a[i+n])>k?-1:1, 5);
  }
  fill(#FF0000);
  circle(a[0]+=(a[1]-a[0])/99, a[n]+=(a[n+1]-a[n])/99, 30);
}
