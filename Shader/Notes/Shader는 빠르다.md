<h1>Shader 는 빠르다</h1>


https://thebookofshaders.com/00/

1. Vertex Shader (정점 세이더)
2. Fragment Shader (픽셀 세이더)


복잡하고 화려한 시각을 빠른 속도로 처리할 수 있다는 장점이 있습니다.
어떤 이유에서 빠를 수 있는건가요?

CPU vs GPU 차이점을 이해해야 합니다.

일 처리를 한다는 점에서 

CPU 한 대의 대포.
GPU 대포에 비하면 파괴력이 약한 소총 여러다발. 

픽셀 by 픽셀 작업을 해야 할 떄가 있습니다.
각각 접근해서 일일히 색을 지정 해 주어야 합니다.

``` javascript
for (int y; y < height; y++) {
    for (int x=0; x<width; x++) {
        set(x, y, color(255));
    }
}
```




https://thebookofshaders.com/01/
