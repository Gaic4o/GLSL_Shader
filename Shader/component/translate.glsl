#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

// 직사각형 모양.
float bar(vec2 loc, vec2 size, vec2 coord) {
    vec2 sw = loc - size/2.; 
    vec2 ne = loc + size/2.; 

    vec2 ret = step(sw, coord) - step(ne, coord);
    return ret.x * ret.y; 
}

// 십자가 모양.
float cross(vec2 loc, vec2 size, vec2 coord) {
    float b1 = bar(loc, size, coord);
    float b2 = bar(loc, vec2(size.y, size.x), coord);

    return max(b1, b2);
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;   
    
    coord = coord*2. - 1.;
    // 원점. 
    coord += vec2(0.0, 0.3);

    float rad = 0.5; 
    vec2 loc = vec2(0.) + vec2(sin(u_time), cos(u_time)*rad);
    vec3 col = vec3(cross(loc, vec2(0.650, 0.080), coord));

    gl_FragColor = vec4(col, 1.);
}