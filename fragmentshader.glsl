#version 120

uniform vec4 Ambient;
uniform vec3 LightD1;
uniform vec3 LightD2;
uniform vec3 LightC1;
uniform vec3 LightC2;
uniform vec3 Half1;
uniform vec3 Half2;

varying vec3 pass_normal;
varying vec4 pass_color;

void main(){
vec3 N = pass_normal;
   vec3 amb = vec3(Ambient);


  float diffuse1 = max(dot(N, normalize(LightD1)), 0.0);
  float specular1 = max(dot(N, normalize(Half1)), 0.0);
  float diffuse2 = max(dot(N, normalize(LightD2)), 0.0);
  float specular2 = max(dot(N, normalize(Half2)), 0.0);

  if (diffuse1 == 0.0)
      specular1 = 0.0;
  else
      specular1 = pow(specular1, 5);
  if (diffuse2 == 0.0)
      specular2 = 0.0;
  else specular2 = pow(specular2, 5);

  vec3 scatteredLight = Ambient.rgb + LightC1 * diffuse1 + LightC2 * diffuse2;
  vec3 reflectedLight = LightC1 * specular1 * 5;
  vec3 reflectedLight2 = LightC2 * specular2 * 5;

  vec3 rgb = min( (pass_color.rgb * amb) * scatteredLight + reflectedLight + reflectedLight2, vec3(1.0));

  gl_FragColor = vec4(rgb, pass_color.a);
}
