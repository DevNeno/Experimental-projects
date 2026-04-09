#include "/home/user/Portafolio/Mas proyectos abandonados/miProyecto/src/header/Player.h"
#include <allegro5/allegro_primitives.h>
#include <allegro5/color.h>
#include <allegro5/threads.h>
#include <allegro5/keycodes.h>
#include <iostream>

void Player::move(bool active){
    // MOVIMIENTO DEL PERSONAJE
    
    std::cout << "EJECUTANDO" << std::endl;

    if (ALLEGRO_KEY_UP || ALLEGRO_KEY_DOWN) {
        if (ALLEGRO_KEY_RIGHT){this->setPosX(1);}
        if (ALLEGRO_KEY_LEFT){this->setPosX(-1);}
    }else{
        if (ALLEGRO_KEY_RIGHT){this->setPosX(2);}
        if (ALLEGRO_KEY_LEFT){this->setPosX(-2);}
    }

    if (ALLEGRO_KEY_RIGHT || ALLEGRO_KEY_LEFT){
        if (ALLEGRO_KEY_UP){this->setPosY(1);}
        if (ALLEGRO_KEY_DOWN){this->setPosY(-1);}
    }else{
        if (ALLEGRO_KEY_UP){this->setPosY(2);}
        if (ALLEGRO_KEY_DOWN){this->setPosY(-2);}
    }
}

void Player::mover(float dx, float dy) {
    this->setPosX(dx);
    this->setPosY(dy);
}


void Player::dibujar() {
    al_draw_filled_rectangle(getPosX(), getPosY(), getPosX() + getAncho(), getPosY() + getAlto(), getColor());
}