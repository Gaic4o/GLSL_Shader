#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float rand(float f) {
    // 특정 임의 큰 숫자를 곱해주고 주기가 자글자글 해진 sin 함수를 fract 시켜줌으로 나오는 한정 되는 범위가 0~1 한정 될 수 있도록.
    return fract(sin(f*6534.124)*7654.2457);
}

float rand(vec2 v2) {
    float y; 
    // vec2 데이터를 float 화 시키는 skill 로 dot 연산. 
    float f = dot(v2, vec2(24.125, 45.658));
    return fract(sin(f*13.124)*72121.325);
}

vec3 line(vec2 coord, bool toggle) {
    float y = coord.x; 
    float r = 0.132; 
    float ret; 
    
    if (toggle) {
        y = coord.x;
    } else {
        y = 1.-coord.x;
    }

    ret = smoothstep(y-r, y, coord.y) - smoothstep(y, y+r, coord.y);
    // ret 이 1이 가까우면 흰색 return 0에 가까우면 검은색 return 
    return mix(vec3(0.), vec3(1.), ret);
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord *= 15.;

    // floor 시켜주면 해당 타일들에서 고유 좌표변수 들을 다 정수부분만 남겨줌.
    bool dir = rand(floor(coord)) > 0.5 ? true : false; 
    coord = fract(coord);
    coord.x *= u_resolution.x/u_resolution.y; 

    vec3 col = line(coord, dir);
    gl_FragColor = vec4(col, 1.0); 
}