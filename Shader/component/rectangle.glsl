#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
 
// 위치변수, 크기 ... 논리에 맞게 생각해서 인자 넣기. 
vec3 rect(vec2 coord, vec2 loc, vec2 size) {    
    // 사각형을 만들 떈 고정된 2개의 점이 필요 합니다.
    vec2 sw = loc-size/2.;
    vec2 ne = loc+size/2.;
    vec2 pct = step(sw, coord); 
    pct -= step(ne, coord);

    return vec3(pct.x * pct.y);
} 
 
void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution; // 좌표를 0 ~ 1 사이로 normalize 

    vec3 col = rect(coord, vec2(.5), vec2(.5));

    gl_FragColor = vec4(col, 1.);
}