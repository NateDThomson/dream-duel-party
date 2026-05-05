extends Button
## Base button component with consistent styling and animations
## Handles state changes, hover effects, and animations

class_name StyledButton

# Button size variants
enum ButtonSize {
	SMALL,
	MEDIUM,
	LARGE
}

# Button style variants
enum ButtonStyle {
	PRIMARY,      # Filled with accent color
	SECONDARY,    # Outlined/bordered
	TERTIARY      # Minimal/text-only
}

@export var button_size: ButtonSize = ButtonSize.MEDIUM
@export var button_style: ButtonStyle = ButtonStyle.PRIMARY
@export var is_icon_button: bool = false

func _ready():
	apply_styling()
	connect_signals()

func apply_styling():
	"""Apply base styling based on button type"""
	
	match button_style:
		ButtonStyle.PRIMARY:
			apply_primary_style()
		ButtonStyle.SECONDARY:
			apply_secondary_style()
		ButtonStyle.TERTIARY:
			apply_tertiary_style()
	
	# Set size based on variant
	match button_size:
		ButtonSize.SMALL:
			custom_minimum_size = Vector2(100, 32)
		ButtonSize.MEDIUM:
			custom_minimum_size = Vector2(140, 44)
		ButtonSize.LARGE:
			custom_minimum_size = Vector2(200, 52)

func apply_primary_style():
	"""Apply primary button styling (filled with accent color)"""
	add_theme_color_override("font_color", StyleConstants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_hover_color", StyleConstants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_pressed_color", StyleConstants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_focus_color", StyleConstants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_disabled_color", StyleConstants.COLOR_TEXT_TERTIARY)
	
	# Create primary button background
	var style_normal = StyleBoxFlat.new()
	style_normal.bg_color = StyleConstants.COLOR_ACCENT_GREEN
	style_normal.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("normal", style_normal)
	
	# Hover state (darker)
	var style_hover = StyleBoxFlat.new()
	style_hover.bg_color = StyleConstants.get_hover_color(StyleConstants.COLOR_ACCENT_GREEN)
	style_hover.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("hover", style_hover)
	
	# Pressed state
	var style_pressed = StyleBoxFlat.new()
	style_pressed.bg_color = StyleConstants.get_hover_color(StyleConstants.COLOR_ACCENT_GREEN, 0.3)
	style_pressed.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("pressed", style_pressed)
	
	# Focus state (with border)
	var style_focus = StyleBoxFlat.new()
	style_focus.bg_color = StyleConstants.COLOR_ACCENT_GREEN
	style_focus.border_color = StyleConstants.COLOR_ACCENT_PINK
	style_focus.set_border_enabled(SIDE_TOP, true)
	style_focus.set_border_enabled(SIDE_BOTTOM, true)
	style_focus.set_border_enabled(SIDE_LEFT, true)
	style_focus.set_border_enabled(SIDE_RIGHT, true)
	style_focus.border_width_left = StyleConstants.FOCUS_BORDER_WIDTH
	style_focus.border_width_right = StyleConstants.FOCUS_BORDER_WIDTH
	style_focus.border_width_top = StyleConstants.FOCUS_BORDER_WIDTH
	style_focus.border_width_bottom = StyleConstants.FOCUS_BORDER_WIDTH
	style_focus.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("focus", style_focus)
	
	# Disabled state
	var style_disabled = StyleBoxFlat.new()
	style_disabled.bg_color = StyleConstants.get_disabled_color(StyleConstants.COLOR_ACCENT_GREEN)
	style_disabled.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("disabled", style_disabled)

func apply_secondary_style():
	"""Apply secondary button styling (outlined/bordered)"""
	add_theme_color_override("font_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_hover_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_pressed_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_focus_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_disabled_color", StyleConstants.COLOR_TEXT_TERTIARY)
	
	# Normal state (transparent with border)
	var style_normal = StyleBoxFlat.new()
	style_normal.bg_color = Color.TRANSPARENT
	style_normal.border_color = StyleConstants.COLOR_ACCENT_GREEN
	style_normal.set_border_enabled(SIDE_TOP, true)
	style_normal.set_border_enabled(SIDE_BOTTOM, true)
	style_normal.set_border_enabled(SIDE_LEFT, true)
	style_normal.set_border_enabled(SIDE_RIGHT, true)
	style_normal.border_width_left = 2
	style_normal.border_width_right = 2
	style_normal.border_width_top = 2
	style_normal.border_width_bottom = 2
	style_normal.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("normal", style_normal)
	
	# Hover state (slight background)
	var style_hover = StyleBoxFlat.new()
	style_hover.bg_color = Color(StyleConstants.COLOR_ACCENT_GREEN.r, StyleConstants.COLOR_ACCENT_GREEN.g, StyleConstants.COLOR_ACCENT_GREEN.b, 0.1)
	style_hover.border_color = StyleConstants.COLOR_ACCENT_GREEN
	style_hover.set_border_enabled(SIDE_TOP, true)
	style_hover.set_border_enabled(SIDE_BOTTOM, true)
	style_hover.set_border_enabled(SIDE_LEFT, true)
	style_hover.set_border_enabled(SIDE_RIGHT, true)
	style_hover.border_width_left = 2
	style_hover.border_width_right = 2
	style_hover.border_width_top = 2
	style_hover.border_width_bottom = 2
	style_hover.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("hover", style_hover)
	
	# Pressed state (full background)
	var style_pressed = StyleBoxFlat.new()
	style_pressed.bg_color = Color(StyleConstants.COLOR_ACCENT_GREEN.r, StyleConstants.COLOR_ACCENT_GREEN.g, StyleConstants.COLOR_ACCENT_GREEN.b, 0.3)
	style_pressed.border_color = StyleConstants.COLOR_ACCENT_GREEN
	style_pressed.set_border_enabled(SIDE_TOP, true)
	style_pressed.set_border_enabled(SIDE_BOTTOM, true)
	style_pressed.set_border_enabled(SIDE_LEFT, true)
	style_pressed.set_border_enabled(SIDE_RIGHT, true)
	style_pressed.border_width_left = 2
	style_pressed.border_width_right = 2
	style_pressed.border_width_top = 2
	style_pressed.border_width_bottom = 2
	style_pressed.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("pressed", style_pressed)
	
	# Focus state
	var style_focus = StyleBoxFlat.new()
	style_focus.bg_color = Color.TRANSPARENT
	style_focus.border_color = StyleConstants.COLOR_ACCENT_PINK
	style_focus.set_border_enabled(SIDE_TOP, true)
	style_focus.set_border_enabled(SIDE_BOTTOM, true)
	style_focus.set_border_enabled(SIDE_LEFT, true)
	style_focus.set_border_enabled(SIDE_RIGHT, true)
	style_focus.border_width_left = 3
	style_focus.border_width_right = 3
	style_focus.border_width_top = 3
	style_focus.border_width_bottom = 3
	style_focus.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("focus", style_focus)
	
	# Disabled state
	var style_disabled = StyleBoxFlat.new()
	style_disabled.bg_color = Color.TRANSPARENT
	style_disabled.border_color = StyleConstants.COLOR_TEXT_TERTIARY
	style_disabled.set_border_enabled(SIDE_TOP, true)
	style_disabled.set_border_enabled(SIDE_BOTTOM, true)
	style_disabled.set_border_enabled(SIDE_LEFT, true)
	style_disabled.set_border_enabled(SIDE_RIGHT, true)
	style_disabled.border_width_left = 2
	style_disabled.border_width_right = 2
	style_disabled.border_width_top = 2
	style_disabled.border_width_bottom = 2
	style_disabled.set_corner_radius_all(StyleConstants.RADIUS_BUTTON)
	add_theme_stylebox_override("disabled", style_disabled)

func apply_tertiary_style():
	"""Apply tertiary/minimal button styling (text-only)"""
	add_theme_color_override("font_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_hover_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_pressed_color", StyleConstants.COLOR_ACCENT_PINK)
	add_theme_color_override("font_focus_color", StyleConstants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_disabled_color", StyleConstants.COLOR_TEXT_TERTIARY)
	
	# All states transparent
	var style_transparent = StyleBoxFlat.new()
	style_transparent.bg_color = Color.TRANSPARENT
	add_theme_stylebox_override("normal", style_transparent)
	add_theme_stylebox_override("hover", style_transparent)
	add_theme_stylebox_override("pressed", style_transparent)
	add_theme_stylebox_override("focus", style_transparent)
	add_theme_stylebox_override("disabled", style_transparent)

func connect_signals():
	"""Connect button signals for animations"""
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_pressed():
	"""Animate button press"""
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	
	# Scale down slightly on press
	tween.tween_property(self, "scale", Vector2(0.95, 0.95), StyleConstants.ANIM_QUICK)
	await tween.finished
	
	# Scale back to normal
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), StyleConstants.ANIM_FAST)

func _on_mouse_entered():
	"""Handle hover state entry"""
	if not is_icon_button:
		pass # Hover styling is handled by theme overrides

func _on_mouse_exited():
	"""Handle hover state exit"""
	if not is_icon_button:
		pass # Hover styling is handled by theme overrides

## Set button text
func set_button_text(text: String) -> void:
	text = text

## Disable button with optional message
func disable_button() -> void:
	disabled = true

## Enable button
func enable_button() -> void:
	disabled = false
