#version 430

layout (location = 1) uniform float Time;
layout (location = 5) uniform ivec4 win_const;

in vec3 gpu_Vertex;
in vec2 gpu_TexCoord;
in vec4 gpu_Color;
uniform mat4 gpu_ModelViewProjectionMatrix;

// out vec4 color;
out vec2 texCoord;

void main (void)
{
    texCoord = gpu_TexCoord;

    vec3 final_vertex = gpu_Vertex;

    // final_vertex.y += 15.0*sin(Time*2);

    gl_Position = gpu_ModelViewProjectionMatrix * vec4(final_vertex, 1);
}