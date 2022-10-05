#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


vec2 random(float f) {
    float x = fract(sin(f*1306.346)*1252.12512);
    float y = fract(cos(f*2407.125)*2105.12569);
    return vec2(x,y); // 0-1
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord *= 4.;
    coord.x *= u_resolution.x/u_resolution.y;

    vec2 coord_i = floor(coord); 
    vec2 coord_f = fract(coord); 

    for (float y = -1.; y<2.; ++y) {
        for (float x = -1.; x < 2.; ++x) {
            vec2 center = coord_i + vec2(x, y) + vec2(0.5);
            
            // 움직이기 
            vec2 temp = 
        }
    }

    vec3 col;

    gl_FragColor = vec4(col, 1.0);
}