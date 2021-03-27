#version 150

#moj_import <fog.glsl>

uniform vec4 ColorModulator;
uniform float GameTime;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec2 ScreenSize;

in float vertexDistance;
out vec4 fragColor;

void main() {
    if(ColorModulator.r + ColorModulator.g + ColorModulator.b < 1.0){
        float value = (gl_FragCoord.y / ScreenSize.y + 3.0) / 4;
        fragColor = vec4(0.8  * value ,0.8  * value,0.8  * value,1.0);
        return;
    }
    float value = (gl_FragCoord.y / ScreenSize.y + 3.0) / 4;
    fragColor = vec4(1.0 ,0.8  * value,0.8  * value,1.0);
}


