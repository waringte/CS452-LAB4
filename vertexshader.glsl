#version 120

uniform mat4 Matrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 in_position;
attribute vec3 in_normal;
attribute vec4 in_color;
varying vec3 pass_normal;
varying vec4 pass_color;

void main(){
pass_normal = in_normal;
pass_color = in_color;
gl_Position=Matrix*viewMatrix*modelMatrix*vec4(in_position,1.0);
}
