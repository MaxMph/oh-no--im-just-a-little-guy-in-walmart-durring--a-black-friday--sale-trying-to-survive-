shader_type canvas_item;

uniform vec2 scale = vec2(1.0, 1.0);

varying vec2 global_pos;

void vertex() {
    global_pos = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy;
}

void fragment() {
    vec2 uv = (global_pos / vec2(textureSize(TEXTURE, 0))) * scale;
    COLOR = texture(TEXTURE, uv);
}