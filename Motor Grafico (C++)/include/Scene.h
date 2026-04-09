#ifndef SCENE_H
#define SCENE_H

#include "Node.h"

#include <string>

class Scene{
    private:
        std::string name;
        Node* root_node = nullptr;
    public:
        Scene(std::string name);
        ~Scene();

        void addNode(Node* root, Node* node);
        void deleteNode(Node* node);
};

#endif