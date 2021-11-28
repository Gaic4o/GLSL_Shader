#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {

    // 모든 픽셀에 동일하게 적용됩니다. 
    // 어떤 픽셀이나 결국에는 갖는 코드는 이 코드로 동일 합니다.
    // 동일 코드를 받는데, 다른 색이 나옵니다.
    // 같은 input에는 같은 output 이 나옵니다.
    
    // 어떤 값을 대입 해 줍니다.

    // 가운데 중앙에 있는 px 기준으로. 

    // 화면 중앙 px 이 해당 glsl 코드를 인식하는 과정. 
    // 화면 가운데 px 일 경우, st 경우.
    // vec2 st = vec2(250./500., 250./500.);
	vec2 st = gl_FragCoord.xy/u_resolution;
    

    // 어떤 색을 띄울 것인가를 생각.
    // 어느 픽셀?
	gl_FragColor = vec4(st.x,st.y,0.0,1.0);
}