#ifdef GL_ES 
precision mediump float;
#endif 

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main() {
    vec2 coord = gl_FragCoord.xy/u_resolution;
    coord.x *= u_resolution.x/u_resolution.y;

    // 화면은 자동으로 *3 곱해주면 0부터 3의 canvas 로 생성됩니다.
    coord *= 3.; // 0,0 에서 -> 3,3 으로 화면이 훨씬 더 광범위 해지면서 원이 작게 보여 집니다.
    coord = mod(coord, 1.); // 동일 효과 fract와
    coord = fract(coord); // 원이 갑자기 9개로 patern 을 그리게 됩니다.

    // mod 는 범위를 지정할 수 있어서 (큰 번위로 1.5 .. 3 ) y = mod(x, 3.0); 
    // fract 는 0 부터 1사이로 짤라 줍니다. 매개변수 하나만 받습니다. 

    // step .3 기준으로 거리를 step 현재 임의 좌표 coord, .5 임의 픽셀이 화면 중앙으로 부터 
    // .3 반지름 기준으로 0 검은색 원.
    // .3 밖은 하얀색.
    vec3 col = vec3(step(.3, distance(coord, vec2(.5)))); 
    
    gl_FragColor = vec4(col, 1.);   
}