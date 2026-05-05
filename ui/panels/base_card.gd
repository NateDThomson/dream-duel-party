extends PanelContainer
## Base card component with consistent styling
## Provides a styled container for content

class_name BaseCard

# Card size variants
enum CardSize {
	SMALL,
	MEDIUM,
	LARGE
}

@export var card_size: CardSize = CardSize.MEDIUM
@export var has_shadow: bool = true
@export var is_selectable: bool = false
@export var is_selected: bool = false

var style_constants = StyleConstants

func _ready():
	apply_styling()
	if is_selectable:
		mouse_entered.connect(_on_mouse_entered)
		mouse_exited.connect(_on_mouse_exited)
		gui_input.connect(_on_gui_input)

func apply_styling():
	"""Apply base card styling"""
	
	# Create panel style
	var panel_style = StyleBoxFlat.new()
	panel_style.bg_color = style_constants.COLOR_SECONDARY_BG
	panel_style.border_color = style_constants.COLOR_BORDER
	panel_style.set_border_enabled(SIDE_TOP, true)
	panel_style.set_border_enabled(SIDE_BOTTOM, true)
	panel_style.set_border_enabled(SIDE_LEFT, true)
	panel_style.set_border_enabled(SIDE_RIGHT, true)
	panel_style.border_width_left = 1
	panel_style.border_width_right = 1
	panel_style.border_width_top = 1
	panel_style.border_width_bottom = 1
	panel_style.set_corner_radius_all(style_constants.RADIUS_CARD)
	
	# Add shadow if enabled
	if has_shadow:
		panel_style.shadow_color = style_constants.SHADOW_SUBTLE
		panel_style.shadow_offset = Vector2(0, 2)
		panel_style.shadow_size = 4
	
	add_theme_stylebox_override("panel", panel_style)
	
	# Set padding based on card size
	var margin = MarginContainer.new()
	match card_size:
		CardSize.SMALL:
			margin.add_theme_constant_override("margin_left", style_constants.SPACING_MD)
			margin.add_theme_constant_override("margin_right", style_constants.SPACING_MD)
			margin.add_theme_constant_override("margin_top", style_constants.SPACING_MD)
			margin.add_theme_constant_override("margin_bottom", style_constants.SPACING_MD)
			custom_minimum_size = Vector2(200, 100)
		CardSize.MEDIUM:
			margin.add_theme_constant_override("margin_left", style_constants.SPACING_LG)
			margin.add_theme_constant_override("margin_right", style_constants.SPACING_LG)
			margin.add_theme_constant_override("margin_top", style_constants.SPACING_LG)
			margin.add_theme_constant_override("margin_bottom", style_constants.SPACING_LG)
			custom_minimum_size = Vector2(300, 150)
		CardSize.LARGE:
			margin.add_theme_constant_override("margin_left", style_constants.SPACING_XL)
			margin.add_theme_constant_override("margin_right", style_constants.SPACING_XL)
			margin.add_theme_constant_override("margin_top", style_constants.SPACING_XL)
			margin.add_theme_constant_override("margin_bottom", style_constants.SPACING_XL)
			custom_minimum_size = Vector2(400, 200)

func _on_mouse_entered():
	"""Handle hover state"""
	if is_selectable:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_QUAD)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "modulate", Color(1.1, 1.1, 1.1, 1.0), style_constants.ANIM_FAST)

func _on_mouse_exited():
	"""Handle hover exit"""
	if is_selectable and not is_selected:
		var tween = create_tween()
		tween.set_trans(Tween.TRANS_QUAD)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(self, "modulate", Color(1.0, 1.0, 1.0, 1.0), style_constants.ANIM_FAST)

func _on_gui_input(event: InputEvent):
	"""Handle card selection"""
	if event is InputEventMouseButton and event.pressed and is_selectable:
		set_selected(!is_selected)

func set_selected(selected: bool) -> void:
	"""Toggle selected state with visual feedback"""
	is_selected = selected
	
	var panel_style = StyleBoxFlat.new()
	panel_style.bg_color = style_constants.COLOR_SECONDARY_BG
	
	if is_selected:
		panel_style.border_color = style_constants.COLOR_ACCENT_GREEN
		panel_style.border_width_left = 3
		panel_style.border_width_right = 3
		panel_style.border_width_top = 3
		panel_style.border_width_bottom = 3
	else:
		panel_style.border_color = style_constants.COLOR_BORDER
		panel_style.border_width_left = 1
		panel_style.border_width_right = 1
		panel_style.border_width_top = 1
		panel_style.border_width_bottom = 1
	
	panel_style.set_corner_radius_all(style_constants.RADIUS_CARD)
	add_theme_stylebox_override("panel", panel_style)
