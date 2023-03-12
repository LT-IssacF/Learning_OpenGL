#version 330 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec3 FragPos;
out vec3 normal;
out vec2 texCoords;

uniform mat4 model, view, projection;

void main() {
    FragPos = vec3(model * vec4(aPos, 1.0f));
    normal = normalize(mat3(transpose(inverse(model))) * aNormal); // 保证法向量在不成比例缩放操作后依然正确，但交给GPU来计算影响性能，应该利用CPU计算
    texCoords = aTexCoords;
    gl_Position = projection * view * vec4(FragPos, 1.0f);
}
