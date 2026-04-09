#ifndef RENDERER_H
#define RENDERER_H

#include <GLFW/glfw3.h>

struct Vertex{
    GLfloat x, y, z; // VERTEX COORDINATES
};

class Renderer{
    public:
    Renderer();
    ~Renderer();
    
    void start(GLFWwindow* window);
    void setBackground(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
    void drawTriangle(Vertex vertex1, Vertex vertex2, Vertex vertex3);
};
#endif