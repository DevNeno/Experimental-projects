#include "Person.h"

class Player : public Person{
    private:
    public:
    using Person::Person;

    void move(bool active);
    void mover(float dx, float dy);
    void dibujar();

};