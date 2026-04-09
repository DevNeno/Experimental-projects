#ifndef PROJECT_H
#define PROJECT_H

#include "Scene.h"

#include <map>
#include <string>

class Project{
    private:
        std::string name;
        std::map<std::string, Scene*> scenes;
    public:
        Project(std::string name);
        ~Project();

        void run();
        void stop();

        void addScene(Scene* scene);
        void deleteScene(Scene* scene);
}; 

#endif