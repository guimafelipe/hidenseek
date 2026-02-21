shader_type canvas_item;

uniform bool is_active = false;
uniform float blur_amount = 2.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest_mipmap;
uniform sampler2D ROOM : filter_linear_mipmap;

void fragment() {
	float actual_blur = blur_amount;
	if (!is_active)
	{
		actual_blur = 0.0;
	}
	vec4 blurred = textureLod(SCREEN_TEXTURE, SCREEN_UV, actual_blur);
	COLOR = blurred;
}
