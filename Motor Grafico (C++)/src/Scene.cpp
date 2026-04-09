#include "Scene.h"

Scene::Scene(std::string name){
    this->name = name;
}

void Scene::addNode(Node* root, Node* node){
    if (this->root_node == nullptr){
        this->root_node = node;
    }else{
        root->addNode(node);
    }
}
void deleteNode(Node* node){
    delete node;
}