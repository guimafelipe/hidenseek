shader_type canvas_item;

uniform float blur_amount = 0.0;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_nearest_mipmap;

void fragment() {
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV, blur_amount);
}
