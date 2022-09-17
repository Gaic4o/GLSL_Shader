#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;
 
vec3 circle(vec2 coord, vec2 location, float radius) { // 좌표, 위치, 반지름
    // return vec3(1.); 
    float d; 
    // disatnce 매개변수 2개 - 좌표의 거리. 
    // d = distance(coord, location); // 원이라는 것은 중심으로 부터 특정 거리, 반지름 만큼의 거리를 가지고 있는 점들의 모임.
    // lendth 매개변수 1개 - 원점과의 거리. (distance 보다 빠른 성능)
    d = length(coord - location); // 원의 중심으로부터 해당 픽셀의 좌표까지의 거리를 의미 합니다.
    // step 을 쓰면 경계선 부분이 계단형으로 깨집니다.
    // d = step(radius, d); // 반지름 r 를 기준으로 d가 r보다 작으면 0 크면 1 
    // smoothstep 사용하기.
    d = smoothstep(radius, radius+0.01, d);

    return vec3(d);
}

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    
    vec3 col = circle(coord, vec2(.5), .3); 
    
    gl_FragColor = vec4(col, 1.);
}