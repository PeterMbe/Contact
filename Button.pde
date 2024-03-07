class Button {
  float xPos;
  float yPos;
  float Width;
  float Height;
  String label;

  Button(float xp, float yp, float wd, float ht) {
    xPos = xp;
    yPos = yp;
    Width = wd;
    Height = ht;
  }

  public void setLabel(String label){
    this.label = label;
  }

  boolean isWithinBounds(int mx, int my) {
    return mx > xPos && mx < xPos + Width && my > yPos && my < yPos + Height;
  }

  public void display() {     
    fill(100,100,100); 
    rect(xPos, yPos, Width, Height); 

    if (label != null) { 
      fill(0); 
      text(label, xPos + 10, yPos + Height / 2 + 15); 
    }
  }
}
