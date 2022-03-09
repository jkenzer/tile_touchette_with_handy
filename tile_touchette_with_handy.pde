import org.gicentre.handy.*;
import processing.svg.*;
 
HandyRenderer h;
Integer tileWidth = 55;
Integer SPACING = 12;
Double tilesX;
Double tilesY;

 
void setup() {
  size(900,768, SVG, "touchette.svg");
  rectMode(CENTER);
  h = new HandyRenderer(this);
  noLoop();
  noFill();
  strokeWeight(2);
  stroke(0);
  tilesX = Math.floor(width / (tileWidth + SPACING));
  tilesY = Math.floor(height / (tileWidth + SPACING));
}
 
void draw() {
  //background(235,215,182);
  translate(SPACING, SPACING);
  for (Integer x = 0; x < tilesX; x += 1) {
    for (Integer y = 0; y < tilesY; y += 1) {
      drawTile(
        x * (tileWidth + SPACING),
        y * (tileWidth + SPACING),
        Math.random() < 0.5 ? 0 : 90
      );
    }
  }
}

void drawTile(Integer x, Integer y, Integer a) {
  pushMatrix();
  translate(x + tileWidth / 2, y + tileWidth / 2);
  rotate(radians(a));
  strokeWeight(2);
  h.rect(0, 0, tileWidth + 2, tileWidth + 2);
  strokeWeight(4);
  h.arc(
    (-1 * tileWidth) / 2,
    (-1 * tileWidth) / 2,
    tileWidth - 15,
    tileWidth - 15,
    radians(0),
    radians(90)
  );
  h.arc(
    (-1 * tileWidth) / 2,
    (-1 * tileWidth) / 2,
    tileWidth + 15,
    tileWidth + 15,
    radians(0),
    radians(90)
  );
  h.arc(tileWidth / 2, tileWidth / 2, tileWidth - 15, tileWidth - 15, radians(180), radians(270));
  h.arc(tileWidth / 2, tileWidth / 2, tileWidth + 15, tileWidth + 15, radians(180), radians(270));
  popMatrix();
}
