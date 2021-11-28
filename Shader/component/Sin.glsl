#ifdef GL_ES
precision mediump float;
#endif

// time 변수 하나 쓰고 있습니다. 
uniform float u_time;

void main() {
    // gl_FragColor 변수에는 vec4 타입으로 해서.
    // 뭔가 조잡한 모양 함수를 쓰고 있습니다.

    // r value 값에 따라 동작. 
    // 이 친구가 1을 찍을 떈 빨간색 0을 찍을떈 검정색. 

    // abs 
    // sin 왔다 갔다 함 그래프. -1 과 1 이 오가는 함수. 
    // 절대 값으로 치환 해 줍니다. u_time 

	gl_FragColor = vec4(abs(sin(u_time)),0.0,0.0,1.0);
}
