#include <allegro5/allegro_primitives.h>
#include <allegro5/color.h>

class Colission{
    protected:
    float x;
    float y;
    float ancho;
    float alto;
    ALLEGRO_COLOR color;
    public:
    Colission();
    //Colission(float x, float y, float ancho, float alto);
    Colission(float x, float y, float ancho, float alto, ALLEGRO_COLOR color);

    // GETTERS
    float getPosX();
    float getPosY();
    float getAncho();
    float getAlto();
    ALLEGRO_COLOR getColor();

    ~Colission();
    void dibujar();
};
