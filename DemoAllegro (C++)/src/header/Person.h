#include <allegro5/color.h>
#include <allegro5/allegro_primitives.h>
#include "Colission.h"


class Person : public Colission{
    protected:
    int vida;
    int hambre;
    int sed;
    int energia;

    public:
    using Colission::Colission;
    void dibujar();
    // SETTERS
    void setPosX(float dx);
    void setPosY(float dy);
};