#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float pct) {
                
    return smoothstep( pct-0.02, pct, st.y ) -
            smoothstep( pct, pct+0.02, st.y );
}

void main() {

    // gl_FragCoord 어떤 점이라도 동일하게 적용 됩니다. 
    vec2 st = gl_FragCoord.xy/u_resolution;

    float y = st.x;

    vec3 color = vec3(y);

    // Flot a line
    // 해당 픽셀이 가지고 있는 y 값에 따라 색을 넣어줍니다. 
    float pct = plot(st,y);
    color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

    gl_FragCoord = vec4(color, 1.0);
}

// y = smoothstep(0.0, 1.0, x); 
// 0에서 1로 서서히 곡선이 이동합니다. 

