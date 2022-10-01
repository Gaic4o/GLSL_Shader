#ifdef GL_ES
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;


float random(float f) {
    return fract(sin(f*654.876)*915.876); 
}

float noise(float val) {
    float i = floor(val);
    float f = fract(val);

    float ret; 
    // ret = random(i);
    ret = mix(random(i), random(i+1.), f);
    f = f*f*f*(f*(f*6.-15.)+10.);
    ret = mix(random(i), random(i+1.), smoothstep(0., 1., f));
    return ret;         
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y; 

    vec3 col = vec3(noise(coord.x * 10.)); 

    gl_FragColor = vec4(col, 1.0);
}