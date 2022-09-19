#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;

    coord = coord*2. - 1.;

    vec2 point = vec2(.3);

    // abs 붙여 주는 순간 2 4 음의 값.
    // 화면이 4분할로 나눠지는 효과. 
    float d = distance(abs(coord), point);

    d = fract(d*10.);
    vec3 col = vec3(d);
    gl_FragColor = vec4(col, 1.);
}