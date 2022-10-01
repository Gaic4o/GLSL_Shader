#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float random(vec2 v) { 
    float f = dot(v, vec2(23.53, 32.124));
    return fract(sin(f*12.432)*6234.12412);
}

// 따로 저장에 놓고 필요할 떄 쓰면 됩니다.
float noise(vec2 v) {
    
    vec2 i = floor(v);
    vec2 f = fract(v); 

    vec2 v1 = i;
    vec2 v2 = i+vec2(1., 0.);
    vec2 v3 = i+vec2(0., 1.);
    vec2 v4 = i+vec2(1., 1.);
    
    float r1 = random(v1);
    float r2 = random(v2);
    float r3 = random(v3);
    float r4 = random(v4);

    f = smoothstep(0., 1., f);
    float bot = mix(r1, r2, f.x);
    float top = mix(r3, r4, f.x); 
    float ret = mix(bot, top, f.y);

    return ret;
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;
    coord *= 10.;

    vec3 col = vec3(noise(coord));

    gl_FragColor = vec4(col, 1.0);
}