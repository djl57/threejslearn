// 法线贴图片元着色器：main函数外
#ifdef USE_NORMALMAP
// 声明一个法线贴图变量
	uniform sampler2D normalMap;
	// normalScale变量对应材质的normalScale属性，表达深浅程度
	uniform vec2 normalScale;

	// Per-Pixel Tangent Space Normal Mapping
	// http://hacksoflife.blogspot.ch/2009/11/per-pixel-tangent-space-normal-mapping.html
// 声明一个函数
// 输入eye_pos：顶点经过模型、视图矩阵变换后插值得到的顶点位置坐标
// 输入surf_norm：几何表面法向量插值后得到法向量数据
// 法线贴图的相关计算算法封装
	vec3 perturbNormal2Arb( vec3 eye_pos, vec3 surf_norm ) {

		// Workaround for Adreno 3XX dFd*( vec3 ) bug. See #9988

		vec3 q0 = vec3( dFdx( eye_pos.x ), dFdx( eye_pos.y ), dFdx( eye_pos.z ) );
		vec3 q1 = vec3( dFdy( eye_pos.x ), dFdy( eye_pos.y ), dFdy( eye_pos.z ) );
		vec2 st0 = dFdx( vUv.st );
		vec2 st1 = dFdy( vUv.st );

		float scale = sign( st1.t * st0.s - st0.t * st1.s ); // we do not care about the magnitude
		scale *= float( gl_FrontFacing ) * 2.0 - 1.0;

		vec3 S = normalize( ( q0 * st1.t - q1 * st0.t ) * scale );
		vec3 T = normalize( ( - q0 * st1.s + q1 * st0.s ) * scale );
		vec3 N = normalize( surf_norm );

		vec3 mapN = texture2D( normalMap, vUv ).xyz * 2.0 - 1.0;
		mapN.xy = normalScale * mapN.xy;
		mat3 tsn = mat3( S, T, N );
		return normalize( tsn * mapN );

	}

#endif
