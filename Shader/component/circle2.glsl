#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    // 화면의 좌표들을 0 ~ 1 normalize 
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    // 화면이 줄어들어도 (비율) 내가 만든 원의 비율은 달라지지 않습니다. 
    // 원리를 파악 해 보기. 
    // x/y 로 나눴을 떄 1보다 큰 비율. 
    // 가로 비율이 클 떈 y 1보디 작은 ..
    // 세로 비율이 클 떈 y 1보다 큰 사이 1보다 작은 0~1 사이.
    // 단위 픽셀 길이를 조정 해 줍니다.
    st.x *= u_resolution.x/u_resolution.y;
    vec3 color = vec3(0.0);
    float d = 0.0;

    // 화면의 원점을 화면의 중심으로 가져오는 것을 고정 해주기.
    st = st * 2.-1.;
    d = length( abs(st)-.3 );

    gl_FragColor = vec4(vec3(fract(d*10.0)),1.0);
} 