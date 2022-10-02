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
    coord.x *= u_resolution.x/u_resolution.y;

    vec2 mouse = u_mouse/u_resolution; // 정규화
    mouse.x *= u_resolution.x/u_resolution.y;

    const int num = 10; 
    vec2 cells[num];

    for (int i=0; i<num-1; ++i) {
        cells[i] = random(float(i));
    }
    cells[num-1] = mouse;
    // cells[0] = vec2(0.250, 0.700);
    // cells[1] = vec2(0.780, 0.280);
    // cells[2] = vec2(0.800, 0.710);
    // cells[3] = vec2(0.160, 0.220);
    // cells[4] = mouse;

    float md = 100.;
    
    // 나의 소속되어 있는 세포의 핵. 
    vec2 picked_cell; 

    for (int i = 0; i < num; i++) {
        float d = distance(cells[i], coord); 
        if (d < md) {
            md = d;
            picked_cell = cells[i];
        }
    }

    vec3 col = md<0.01 ? vec3(1.) : vec3(md);
    // vec3 col = vec3(picked_cell, abs(sin(md*100.)));
    gl_FragColor = vec4(col, 1.0);
}