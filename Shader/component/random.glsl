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
    // vec2 데이터를 float 화 시키는 skill 로 dot 연산. 
    float f = dot(v2, vec2(24.125, 45.658));
    return fract(sin(f*13.124)*72121.325);
}

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y; 

    vec3 color = vec3(rand(st));
    // color = vec3(st.x,st.y,abs(sin(u_time)));

    gl_FragColor = vec4(color, 1.0);
}