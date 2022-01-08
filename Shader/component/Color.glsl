// 색상 혼합을 하고 싶을 떈 mix 함수를 사용 합니다.
// 백분율 범위는 0.0 과 1.0 사이의 값 입니다.


#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse; 
uniform float u_time;

vec3 colorA = vec3(0.149,0.141,0.912);
vec3 colorB = vec3(1.000,0.833,0.224);

float plot (vec2 st, float pct) {
    return smoothstep( pct-0.01, pct, st.y) -
           smoothstep( pct, pct+0.01, st.y);
}

void main() {
    vec2 st = gl_FragColor.xy/u_resolution.xy;
    vec3 color = vec3(0.0);

    vec3 pct = vec3(st.x); 
    // abs -> 0 과 1 사이를 오가는 값. 
    // pct 는 결과는 0 과 1 사이 오가는 값. 
    // 0 일떈 컬러 A    
    // 1 일댼 컬러 B 
    float pct = abs(sin(u_time));

    pct.r = smoothstep(0.0, 1.0, st.x); 
    pct.g = sin(st.x*PI); 
    pct.b = pow(st.x, 2.0);
    // color = mix(colorA, colorB, pct);

    // mix 는 pct 라는 변수에 x 좌표로.
    // 컬러 A와 컬러 B mix 해 줍니다. pct 라는 근거로. (그라데이션) 
    // vec3 mix 하면 어떻게 mix 되느냐? r g b 
    // 따로 따로 ColorA,B R,G,B value, 따로따로.  

    // smoothstep r 값에 부여를 하면은 조금 바뀌게 되는데,
    color = mix(colorA, colorB, pct); 

    // R 값만 골라서 빨간색으로 바꿔줍니다.
    color = mix(color,vec3(1.0, 0.0, 0.0),plot(st,pct.r));

    // sin 모양으로 대입. sin 해당 하는 부분만 plot 활성화(초록색)
    color = mix(color,vec3(0.0, 1.0, 0.0),plot(st,pct.g)); 

    // 곡선모양을 만들어 줍니다. glsl 본인이 직접 이해를 해서 한 순간 꺠달음을 얻는 것이 중요합니다.
    color = mix(color,vec3(0.0, 0.0, 1.0),plot(st,pct.b)); 


    gl_FragColor = vec4(color,1.0);
}



