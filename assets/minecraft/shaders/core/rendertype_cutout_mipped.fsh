#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0);
    color = color * vertexColor * ColorModulator * vec4(0.8,0.8,1.4,1.0);
    if (color.a < 0.1) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, 16, 200, FogColor);
}