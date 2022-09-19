#ifdef GL_ES 
precision mediump float;
#endif 
#define PI 3.141592

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time; 

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord = coord*2.-1.;
    coord.x *= u_resolution.x/u_resolution.y;

    float a = atan(coord.y, coord.x);
    
    // 같은 코드.
    // float d = distance(vec2(0.), coord);
    float d = length(coord);
    
    // 원을 그릴 떄 이루는 각 상관없이 동일 반지름을 가지고 있습니다.
    // 해당 좌표가 원의 중심으로부터 각의 크기에 따라 0으로 부터 시작해서 증가해서 0으로 감소 -> 한동안 감췄다가 다시 0에서 증가하고, 0으로 줄어듭니다.

    // 바람개비 3개가 나옵니다. 
    a *= 3.;


    float r = sin(a);
    vec3 col = vec3(step(r, d));


    gl_FragColor = vec4(col, 1.);

}
