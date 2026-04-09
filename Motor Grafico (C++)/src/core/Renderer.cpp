#include "Renderer.h"

Renderer::Renderer(){}

Renderer::~Renderer(){}

void Renderer::start(GLFWwindow* window){
    glfwSwapBuffers(window);
}

void Renderer::setBackground(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha){
    glClearColor(red, green, blue, alpha);
    glClear(GL_COLOR_BUFFER_BIT);
}

void Renderer::drawTriangle(Vertex vertex1, Vertex vertex2, Vertex vertex3){
    GLfloat vertices[] = {
        vertex1.x, vertex1.y, vertex1.z,
        vertex2.x, vertex2.y, vertex1.z,
        vertex3.x, vertex3.y, vertex3.z
    };
}