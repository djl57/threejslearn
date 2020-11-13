## renderers 渲染器

### WebGLMultisampleRenderTarget 调用了WebGLRenderTarget

### WebGLCubeRenderTarget 调用了WebGLRenderTarget

### WebGLRenderTarget

### WebGLRenderer 用的

``` js
  let renderer = new THREE.WebGLRenderer({
    antialias: true, // true/false表示是否开启反锯齿
    alpha: true, // true/false 表示是否可以设置背景色透明
    precision: 'highp', // highp/mediump/lowp 表示着色精度选择
    premultipliedAlpha: false, // true/false 表示是否可以设置像素深度（用来度量图像的分辨率）
    preserveDrawingBuffer: true, // true/false 表示是否保存绘图缓冲
    maxLights: 3, // 最大灯光数
    stencil: false // false/true 表示是否使用模板字体或图案
  });
```
### WebGL1Renderer 调用了WebGLRenderer