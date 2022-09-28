#ifdef GL_ES 
precision mediump float;
#endif 

#define QUAR_PI .785
#define ROOT2 1.414

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

mat2 rotate2d(float _angle) {
    return mat2(cos(_angle), -sin(_angle),
        sin(_angle), cos(_angle));
}

float rect(vec2 coord, vec2 size) {
    // 사각형의 중심 좌표.
    vec2 center = vec2(.0);
    
    // 가로 기준.
    float hor = step(center.x-size.x, coord.x) - step(center.x+size.x, coord.x); 
    // 세로 기준
    float ver = step(center.y-size.y, coord.y) - step(center.y+size.y, coord.y); 

    return hor*ver;  
} 

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;

    coord *= 3.;
    coord = fract(coord); // 패턴 시킬 수 있습니다.
    coord -= .5; 
    coord *= rotate2d(QUAR_PI);
    // coord *= rotate2d(0.); // 사각형 자기가 속해 있는 원점으로 rotate 함수는 원점을 중심축으로 돕니다. 
    // 원점에 각각에 0.0 독자적으로 가지므로 각각의 원점에 맞게 돌게 됩니다. 
    // 사각형을 45도 정두 돌려주면 다이아몬드를 만들 수 있습니다.
    

    vec3 col = vec3(rect(coord, vec2(.5/ROOT2))); // 가로 0.3 세로 0.3 짤린 사각형 -> 화면 중앙으로 옮기기  
    gl_FragColor = vec4(col, 1.);
}