#include "/home/user/Portafolio/Mas proyectos abandonados/miProyecto/src/header/Colission.h"

Colission::Colission(float x, float y, float ancho, float alto, ALLEGRO_COLOR color){
    this->x = x;
    this->y = y;
    this->ancho = ancho;
    this->alto = alto;
    this->color = color;
}

Colission::~Colission(){

}

float Colission::getPosX(){
    return this->x;
}
float Colission::getPosY(){
    return this->y;
}
float Colission::getAncho(){
    return this->ancho;
}
float Colission::getAlto(){
    return this->alto;
}
ALLEGRO_COLOR Colission::getColor(){
    return this->color;
}

void Colission::dibujar() {
    al_draw_filled_rectangle(x, y, x + ancho, y + alto, color);
}