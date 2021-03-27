#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform vec2 ScreenSize;

in vec2 texCoord0;
in float vertexDistance;
in vec4 vertexColor;
in vec4 normal;

out vec4 fragColor;

void main() {
    if(vertexColor.r + vertexColor.g + vertexColor.b < 1.0){
        fragColor = vec4(0.0,0.0,0.0,0.0);
        return;
    }
    vec4 vtc = vec4((1 - vertexColor.b) * (gl_FragCoord.y / ScreenSize.y + 0.5), vertexColor.b , vertexColor.b * (gl_FragCoord.y / ScreenSize.y + 0.8), 0.3);
    vec4 color = texture(Sampler0, texCoord0) * vtc * ColorModulator;
    if (color.a < 0.1) {
        discard;
    }
    fragColor = linear_fog(color, vertexDistance, 240, 560, FogColor);
}
