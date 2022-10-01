#ifdef GL_ES 
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 random(vec2 v) {   
    float f1 = dot(v, vec2(56.37, 67.531));
    float f2 = dot(v, vec2(69.08641, 75.372839)); 

    float x = fract(sin(f1*6.7876)*154423.12312);
    float y = fract(cos(f2*1.34531)*163451.12512);
    return vec2(x,y) * 2.-1.; // range -1-1  
}

float noise(vec2 v) {
    vec2 i = floor(v);
    vec2 f = fract(v);

    vec2 i2 = i + vec2(1., 0.);
    vec3 i3 = i + vec2(0., 1.);
    vec2 i4 = i + vec2(1., 1.);
    
    vec2 r = random(i); 
    vec2 r2 = random(i2);
    vec2 r3 = random(i3);
    vec2 r4 = random(i4);

    f = smoothstep(0., 1., f);
    
    float d = dot(r, v-i);
    float d2 = dot(r2, v-i2);
    float d3 = dot(r3, v-i3);
    float d4 = dot(r3, v-i4);

    float bot = mix(d, d2, f.x); 
    float top = mix(d3, d4, f.x);
    float ret = mix(bot, top, f.y);

    return ret*0.5 + 0.5;  // range -1 ~ 1 -> 0 ~ 1  
    // 0 미만 시커멓게 
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord *= 10.;
    coord.x *= u_resolution.x/u_resolution.y;

    vec3 col = vec3(noise(coord));

    gl_FragColor = vec4(col, 1.0);
}