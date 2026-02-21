shader_type canvas_item;

uniform bool is_active = false;
uniform float blur_amount = 5.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest_mipmap;
uniform sampler2D ROOM : filter_linear_mipmap;

void fragment() {
	if (is_active)
	{
		vec4 blurred = texture(ROOM, UV);
		COLOR = blurred;
	}
}
