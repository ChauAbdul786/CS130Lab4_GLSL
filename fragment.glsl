varying vec4 position;
varying vec3 normal;
varying vec4 world_position;

float pi=4.0*atan(1.0);

void main()
{
    vec4 ambient = vec4(1, 0, 0, 1);
    vec4 diffuse = vec4(0, 1, 0, 1);
    vec4 specular = vec4(0, 0, 1, 1);

    ambient = gl_lightModel.ambient * gl_FrontMaterial.ambient * glLightSource[0].ambient;

    diffuse = gl_LightSource[0].diffuse * gl_FrontMaterial.diffuse * (float)(max(0.0, (float)(dot(normal, light_direction))));

    vec3 ray = vec3(0,0,0);
    ray = 2.0 * (float)(dot(light_direction, normal)) * normal - light_direction;
    vec4 reflection = vec4(r[0], r[1], r[2], 0);

    specular = gl_FrontMaterial.specular * (float)(pow((float)(max(0.0, dot(-position, reflection))), gl_FrontMaterial.shininess));

    gl_FragColor = ambient + diffuse + specular;
}
