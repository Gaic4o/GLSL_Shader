#ifdef GL_ES
precision mediump float;
#endif

// uniform?
// CPU 에서 GPU 로 정보를 넘겨주는 변수. 
// GLSL processing 오픈프레임워크에서 웹캠과 현업.

// 웹캡을 켜서 웹캠에 담긴 장면들. GPU 할 수 있는 것이 아니라 CPU.
// 받아낸 정보를 가공할 떄 GLSL 로 넘겨줍니다. 
// 이런 사진을 찍었으니 원하는 효과를 나타내기 위해 GLSL 로 넘겨줍니다. 
// uniform 이라는 변수를 생성 해 Shader 로 넘겨줄 수 있습니다.


uniform vec2 u_resolution;

// x y 좌표.
uniform vec2 u_mouse;

// 경과되는 시간 float 
uniform float u_time;

void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy;
    st.x *= u_resolution.x/u_resolution.y;

    vec3 color = vec3(0.);
    color = vec3(st.x,st.y,abs(sin(u_time)));

    gl_FragColor = vec4(color,1.0);
}