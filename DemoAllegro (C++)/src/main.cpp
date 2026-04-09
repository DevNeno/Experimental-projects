#include <allegro5/allegro.h>
#include <allegro5/allegro_primitives.h>
#include <allegro5/color.h>
#include <allegro5/keycodes.h>
#include "header/Player.h"
using namespace std;



int main() {
    

    al_init();
    al_init_primitives_addon();
    al_install_keyboard();

    const int screenWidth = 800;
    const int screenHeight = 600;
    ALLEGRO_DISPLAY* display = al_create_display(screenWidth, screenHeight);

    ALLEGRO_EVENT_QUEUE* queue = al_create_event_queue();
    ALLEGRO_TIMER* timer = al_create_timer(1.0 / 60);
    al_register_event_source(queue, al_get_keyboard_event_source());
    al_register_event_source(queue, al_get_timer_event_source(timer));
    al_register_event_source(queue, al_get_display_event_source(display));

    Player pj(100, 100, 50, 50, al_map_rgb(255, 255, 255));
    Player test(200, 200, 50, 50, al_map_rgb(255, 0, 0));

    bool running = true;
    bool redraw = true;
    bool keys[ALLEGRO_KEY_MAX] = {false};
    al_start_timer(timer);

    while (running) {
        ALLEGRO_EVENT ev;
        al_wait_for_event(queue, &ev);

        if (ev.type == ALLEGRO_EVENT_TIMER) {
            redraw = true;
        }
        else if (ev.type == ALLEGRO_EVENT_KEY_DOWN) {

            if (ev.type == ALLEGRO_EVENT_KEY_DOWN){}
                keys[ev.keyboard.keycode] = true;
        }else if (ev.type == ALLEGRO_EVENT_KEY_UP){
            keys[ev.keyboard.keycode] = false;
        }

        




        if (keys[ALLEGRO_KEY_RIGHT]){pj.mover(2, 0);}
        if (keys[ALLEGRO_KEY_LEFT]){pj.mover(-2, 0);}
	if (keys[ALLEGRO_KEY_UP]){pj.mover(0, -2);}
        if (keys[ALLEGRO_KEY_DOWN]){pj.mover(0, 2);}



        
        
        


        /*if (keys[ALLEGRO_KEY_UP]){pj.mover(0, -2);}
        if (keys[ALLEGRO_KEY_DOWN]){pj.mover(0, 2);}*/
        


        if (keys[ALLEGRO_KEY_ESCAPE]){running = false;}

        else if (ev.type == ALLEGRO_EVENT_DISPLAY_CLOSE) {
            running = false;
        }

        if (redraw && al_is_event_queue_empty(queue)) {
            redraw = false;
            al_clear_to_color(al_map_rgb(0, 0, 0));  // Fondo negro
            pj.dibujar();
            test.dibujar();
            al_flip_display();
        }
    }

    al_destroy_display(display);
    al_destroy_event_queue(queue);
    al_destroy_timer(timer);
    return 0;
}