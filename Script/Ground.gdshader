shader_type spatial;

uniform float roughness : hint_range(0, 1) = 0.9;
uniform float metallic : hint_range(0, 1) = 0.2;

void fragment() {
    ALBEDO = vec3(0.3, 0.2, 0.1); // Warna tanah
    ROUGHNESS = roughness;
    METALLIC = metallic;
}
