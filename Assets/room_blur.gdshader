shader_type canvas_item;

uniform float blur_amount = 0.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest_mipmap;
uniform sampler2D ROOM : filter_linear_mipmap;

void fragment() {
	float actual_blur = blur_amount;
	vec4 blurred = textureLod(SCREEN_TEXTURE, SCREEN_UV, actual_blur);
	COLOR = blurred;
}
