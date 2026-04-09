#ifndef NODE_H
#define NODE_H

#include <map>
#include <string>

class Node{
    private:
        std::string name;
        Node* root;
        std::map<std::string, Node*> nodes;
    public:
        Node(Node* root, std::string name);
        ~Node();

        void rename(std::string new_name);

        void addNode(Node* new_node);

        // GETTERS
        std::string getName();
        Node* getRoot();

        // SETTERS
        void setRoot(Node* root);
};
#endif