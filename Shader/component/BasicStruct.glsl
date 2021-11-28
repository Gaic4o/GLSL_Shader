#ifdef GL_ES
precision mediump float;
#endif

uniform float u_time;

// main 함수를 가지고 있습니다. 
// shader는 어떤 색상 값을 띄울 것인가가 glsl 궁극적 목표.

// color 는 FragColor 에 값이 매겨집니다. 
// gl_FragColor 기존 내장 변수 중 하나.

vec3 red() {
    return vec3(1.,0.,0.); 
}

vec3 green() {
    return vec3(0., 1., 0.); 
}

void main() {
    // vec4 는 float 데이터 4개를 가지고 있습니다. 
    // 화면에 띄울 값을 r g b a 로 나타내고 이것을 Vec4 로 관리합니다.
    // 1을 넘어 버리는 숫자를 넣으면 변함이 없습니다.
	gl_FragColor = vec4(red(),1.0);
    float f = 1.; // 1 로 표현하면 오류가 발생합니다. 




}