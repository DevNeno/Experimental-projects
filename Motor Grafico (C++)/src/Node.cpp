#include "Node.h"

Node::Node(Node* root, std::string name){
    this->root = root;
    this->name = name;
}

Node::~Node(){
    for(auto& element : this->nodes){
        delete element.second;
    }
    this->nodes.clear();
}

void Node::addNode(Node* new_node){
    this->nodes.emplace(new_node->getName(), new_node);
}

void Node::rename(std::string new_name){
    this->name = new_name;
}

// GETTERS
std::string Node::getName(){
    return this->name;
}
Node* Node::getRoot(){
    return this->root;
}

        // SETTERS
void Node::setRoot(Node* root){
    this->root = root;
}