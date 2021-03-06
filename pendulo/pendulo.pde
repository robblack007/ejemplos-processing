/*
 * Pendulo
 * por Roberto Cadena Vega
 *
 * Crea una animación de un pendulo.
 */

// Se declara el objeto p de la clase pendulo.
Pendulo p;
// Se declaran variables utiles con respecto al aspecto en pantalla.
int tamanoGrafica = 500;
int colorFondo    = 200;
// Se declaran variables utiles con respecto a la física.
int m = 100;
int f = 60;
float g   = 9.81;
float tau = TWO_PI;
// Se inicializa el entorno grafico.
void setup(){
  frameRate(f);                                       // Se actualiza la pantalla 30 veces cada segundo
  size(tamanoGrafica, tamanoGrafica);                 // Se define el tamaño de pantalla en 500px x 500px
  hint(ENABLE_STROKE_PURE);                           // Se piden trazos limpios
  p = new Pendulo(tamanoGrafica/2, tamanoGrafica/2);  // Se inicializa el pendulo con origen en el centro de la pantalla
}
// Se dibuja el pendulo.
void draw(){
  background(colorFondo); // El color de fondo es gris claro
  p.animar();             // Se llama a la función que despliega el siguiente cuadro del pendulo
}
// Se declara la clase Pendulo.
class Pendulo{
  color colorGrafica = color(#63AA37);
  PVector coorOrigen;
  PVector coorMasa;
  float r;
  float th;
  float om;
  float al;
  // Se declara el constructor de la clase Pendulo.
  Pendulo(int origenX, int origenY) {
    coorOrigen = new PVector(origenX, origenY);
    r = 2*m;
    th = tau/8;
    om = 0;
    al = 0;
    coorMasa = new PVector(origenX + r*sin(th), origenY + r*cos(th));
  }
  // Se declara la función que desplegara en pantalla el pendulo.
  void dibujar(){
    stroke(colorGrafica);
    fill(colorGrafica);
    line(coorOrigen.x, coorOrigen.y, coorMasa.x, coorMasa.y);
    ellipse(coorMasa.x, coorMasa.y, 20, 20);
  }
  // Se declara la función que actualizará la posición de la masa del pendulo.
  void actualizar(){
    al = -1*g*sin(th)/(r*f);
    om += al;
    th += om;
    coorMasa.x = coorOrigen.x + r*sin(th);
    coorMasa.y = coorOrigen.y + r*cos(th);
  }
  // Se declara una función sencilla para llamar, que actualize y despliegue en pantalla al pendulo.
  void animar(){
    actualizar();
    dibujar();
  }
}