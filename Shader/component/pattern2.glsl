#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;

    coord *= 3.;
    coord = fract(coord);

    // r g b -> float 데이터를 넣어주면 됩니다.
    // r,g value 가 x,y 좌표로 대체 됩니다.
    vec3 col = vec3(coord, 1.); // b value 값을 1. 로 설정. 
    gl_FragColor = vec4(col, 1.);
}