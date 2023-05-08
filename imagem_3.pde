void setup() {
  size(400, 300);
  noLoop();
}

void draw() {
  PImage img = loadImage("Imagem3.jpg");
  PImage img2 = createImage(img.width, img.height, RGB);

  // Filtro de escala de cinza
  for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int media = (int) (red(img.pixels[pos]) + 
                            green(img.pixels[pos]) + 
                            blue(img.pixels[pos])) / 3;
         img2.pixels[pos] = color(media);
     }
   }
   
   // Filtro de Brilho
   for(int y = 0; y < img.height; y++) {
     for(int x = 0; x < img.width; x++) {
         int pos = y*img.width + x;
         int brilho = (int) red(img2.pixels[pos]) + 100;
         if (brilho > 255) brilho = 255;
         else if(brilho < 0) brilho = 0;
         img2.pixels[pos] = color(brilho);
     }
   }
  

  // Filtro de Limialização
  for(int y = 0; y < img.height; y++) {
    for(int x = 0; x < img.width; x++) {
      int pos = y * img.width + x;
      if(blue(img2.pixels[pos]) > 230 || y > 300 || x < 100 || x > 350) {
        img2.pixels[pos] = color(0);
      }
      else {
        img2.pixels[pos] = color(255);
      }
    }
  }
  
  image(img2, 0, 0);
  save("resultado.jpg");
}
