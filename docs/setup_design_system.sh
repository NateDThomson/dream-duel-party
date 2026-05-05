#!/bin/bash
# Dream Duel Party - Design System Setup Script
# Run this in your project root: bash setup_design_system.sh

set -e

echo "🎨 Setting up Dream Duel Party Design System..."

# Create directories
echo "📁 Creating directories..."
mkdir -p autoload
mkdir -p ui/buttons
mkdir -p ui/panels
mkdir -p themes
mkdir -p docs

# Create style_constants.gd
echo "📝 Creating style_constants.gd..."
cat > autoload/style_constants.gd << 'EOF'
extends Node
## StyleConstants - Central singleton for all design constants
## Autoload this in Project Settings → Autoload as "StyleConstants"
## Access from anywhere: StyleConstants.COLOR_ACCENT_GREEN, etc.

# ============================================================================
# COLOR PALETTE - Cool Neutrals Base
# ============================================================================

const COLOR_PRIMARY_BG = Color("#0F1419")      # Deep cool gray-blue
const COLOR_SECONDARY_BG = Color("#1A1F2E")   # Cool dark gray
const COLOR_TERTIARY_BG = Color("#25293D")    # Slightly lighter cool gray

const COLOR_TEXT_PRIMARY = Color("#E8EAED")   # Off-white, high contrast
const COLOR_TEXT_SECONDARY = Color("#9CA3AF") # Medium cool gray
const COLOR_TEXT_TERTIARY = Color("#6B7280")  # Darker cool gray, disabled/muted

const COLOR_BORDER = Color("#374151")         # Cool gray for dividers

# ============================================================================
# ACCENT COLORS - Vibrant Green + Hot Pink
# ============================================================================

const COLOR_ACCENT_GREEN = Color("#00FF88")   # Vibrant Neon Green
const COLOR_ACCENT_PINK = Color("#FF006E")    # Hot Magenta/Pink

# ============================================================================
# STATE COLORS - Feedback
# ============================================================================

const COLOR_SUCCESS = Color("#10B981")        # Emerald Green
const COLOR_WARNING = Color("#F59E0B")        # Amber/Gold
const COLOR_ERROR = Color("#EF4444")          # Red
const COLOR_INFO = Color("#3B82F6")           # Blue

# ============================================================================
# TYPOGRAPHY - Font Sizes
# ============================================================================

# Display Font Sizes (Montserrat Black - Headings & Titles)
const FONT_SIZE_LARGE_HEADING = 48
const FONT_SIZE_MEDIUM_HEADING = 32
const FONT_SIZE_SMALL_HEADING = 24

# Body Font Sizes (Montserrat Regular - UI & Body Text)
const FONT_SIZE_BODY = 16
const FONT_SIZE_SMALL_BODY = 14
const FONT_SIZE_LABEL = 12
const FONT_SIZE_TINY = 11

# ============================================================================
# TYPOGRAPHY - Font Weights (Montserrat variants)
# ============================================================================

const FONT_WEIGHT_REGULAR = 400      # Body text (Montserrat Regular)
const FONT_WEIGHT_MEDIUM = 500       # Labels, secondary headings
const FONT_WEIGHT_SEMIBOLD = 600     # Minor headings
const FONT_WEIGHT_BOLD = 700         # Major headings
const FONT_WEIGHT_EXTRA_BOLD = 900   # Display font weight (Montserrat Black)

# ============================================================================
# TYPOGRAPHY - Line Heights
# ============================================================================

const LINE_HEIGHT_TIGHT = 1.2        # Headings
const LINE_HEIGHT_NORMAL = 1.3       # Section headers
const LINE_HEIGHT_RELAXED = 1.4      # Labels
const LINE_HEIGHT_LOOSE = 1.5        # Body text
const LINE_HEIGHT_VERY_LOOSE = 1.6   # Accessibility-focused

# ============================================================================
# SPACING SCALE (4px base unit)
# ============================================================================

const SPACING_XS = 4                 # Minimal spacing, text-level
const SPACING_SM = 8                 # Tight spacing between adjacent elements
const SPACING_MD = 12                # Standard spacing between components
const SPACING_LG = 16                # Generous spacing between sections
const SPACING_XL = 24                # Large spacing between major sections
const SPACING_2XL = 32               # Extra large spacing
const SPACING_3XL = 48               # Splash screens, hero sections

# ============================================================================
# CORNER RADIUS
# ============================================================================

const RADIUS_BUTTON = 8              # Buttons
const RADIUS_INPUT = 6               # Input fields
const RADIUS_CARD = 12               # Cards and panels
const RADIUS_LARGE = 16              # Large components
const RADIUS_BADGE = 4               # Badges and tags
const RADIUS_PILL = 20               # Pill-shaped badges

# ============================================================================
# ANIMATION TIMINGS (in seconds, for use with Tween)
# ============================================================================

const ANIM_QUICK = 0.15              # Quick feedback (150ms)
const ANIM_FAST = 0.2                # Button hover/press (200ms)
const ANIM_NORMAL = 0.3              # Standard transitions (300ms)
const ANIM_SLOW = 0.4                # Deliberate transitions (400ms)
const ANIM_VERY_SLOW = 0.6           # Extended animations (600ms)

# Loading/spinning animation
const ANIM_SPIN_DURATION = 0.8       # Full rotation (800ms)

# ============================================================================
# BUTTON SPECIFICATIONS
# ============================================================================

const BUTTON_PADDING_H = 24          # Horizontal padding
const BUTTON_PADDING_V = 12          # Vertical padding
const BUTTON_MIN_HEIGHT = 44         # Touch-friendly minimum height
const BUTTON_MIN_WIDTH = 44          # Touch-friendly minimum width

# ============================================================================
# COMPONENT SIZES
# ============================================================================

const AVATAR_SIZE_LARGE = 128        # Full avatar display
const AVATAR_SIZE_MEDIUM = 64        # Standard in-game use
const AVATAR_SIZE_SMALL = 48         # List/leaderboard display
const AVATAR_SIZE_TINY = 32          # Player indicator

const ICON_SIZE_LARGE = 48           # Primary icons
const ICON_SIZE_MEDIUM = 32          # Standard icons
const ICON_SIZE_SMALL = 24           # Inline icons
const ICON_SIZE_TINY = 16            # Decorative icons

# ============================================================================
# CONTAINER PADDING
# ============================================================================

const CONTAINER_PADDING_MOBILE = 16  # Mobile/default padding
const CONTAINER_PADDING_TABLET = 20  # Tablet padding
const CONTAINER_PADDING_DESKTOP = 24 # Desktop padding

const CARD_PADDING = 16              # Card internal padding
const MODAL_PADDING = 24             # Modal dialog padding
const SECTION_PADDING = 12           # Section spacing

# ============================================================================
# SHADOW & DEPTH
# ============================================================================

const SHADOW_NONE = Color.TRANSPARENT
const SHADOW_SUBTLE = Color(0, 0, 0, 0.2)    # 20% opacity black
const SHADOW_MEDIUM = Color(0, 0, 0, 0.3)    # 30% opacity black
const SHADOW_PROMINENT = Color(0, 0, 0, 0.4) # 40% opacity black

# ============================================================================
# FOCUS & ACCESSIBILITY
# ============================================================================

const FOCUS_BORDER_WIDTH = 2
const FOCUS_BORDER_COLOR = COLOR_ACCENT_GREEN
const FOCUS_OUTLINE_WIDTH = 2
const MIN_CONTRAST_RATIO = 4.5               # WCAG AA for normal text
const MIN_CONTRAST_LARGE = 3.0               # WCAG AA for large text

# ============================================================================
# UTILITY - Animation Easing
# ============================================================================

enum EasingType {
	LINEAR = Tween.TRANS_LINEAR,
	EASE_IN = Tween.TRANS_EASE_IN,
	EASE_OUT = Tween.TRANS_EASE_OUT,
	EASE_IN_OUT = Tween.TRANS_EASE_IN_OUT,
	EASE_OUT_BACK = Tween.TRANS_BACK,
	EASE_OUT_BOUNCE = Tween.TRANS_BOUNCE,
}

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

## Get a color with modified opacity
func get_color_with_opacity(color: Color, opacity: float) -> Color:
	var result = color
	result.a = opacity
	return result

## Get a darkened version of a color (for hover states)
func get_hover_color(color: Color, darken_amount: float = 0.2) -> Color:
	return color.darkened(darken_amount)

## Get a lightened version of a color (for active states)
func get_active_color(color: Color, lighten_amount: float = 0.15) -> Color:
	return color.lightened(lighten_amount)

## Get a disabled version of any color (reduced opacity)
func get_disabled_color(color: Color) -> Color:
	return get_color_with_opacity(color, 0.5)

## Check if contrast ratio meets WCAG AA standards
func check_contrast_ratio(color1: Color, color2: Color) -> bool:
	var lum1 = (0.299 * color1.r + 0.587 * color1.g + 0.114 * color1.b)
	var lum2 = (0.299 * color2.r + 0.587 * color2.g + 0.114 * color2.b)
	var lighter = max(lum1, lum2)
	var darker = min(lum1, lum2)
	var contrast = (lighter + 0.05) / (darker + 0.05)
	return contrast >= MIN_CONTRAST_RATIO

## Print all constants (for debugging)
func print_all_constants() -> void:
	print("=== STYLE CONSTANTS ===")
	print("Colors: PRIMARY_BG, SECONDARY_BG, TEXT_PRIMARY, ACCENT_GREEN, ACCENT_PINK")
	print("Spacing: SPACING_XS (4) to SPACING_3XL (48)")
	print("Font Sizes: FONT_SIZE_TINY (11) to FONT_SIZE_LARGE_HEADING (48)")
	print("Animations: ANIM_QUICK (0.15s) to ANIM_VERY_SLOW (0.6s)")
	print("Radius: RADIUS_BUTTON (8) to RADIUS_LARGE (16)")
EOF

echo "✅ Created style_constants.gd"

# Create base_button.gd (shortened version for clarity)
echo "📝 Creating base_button.gd..."
cat > ui/buttons/base_button.gd << 'EOF'
extends Button
## Base button component with consistent styling and animations

class_name BaseButton

enum ButtonSize { SMALL, MEDIUM, LARGE }
enum ButtonStyle { PRIMARY, SECONDARY, TERTIARY }

@export var button_size: ButtonSize = ButtonSize.MEDIUM
@export var button_style: ButtonStyle = ButtonStyle.PRIMARY
@export var is_icon_button: bool = false

var style_constants = StyleConstants

func _ready():
	apply_styling()
	connect_signals()

func apply_styling():
	match button_style:
		ButtonStyle.PRIMARY:
			apply_primary_style()
		ButtonStyle.SECONDARY:
			apply_secondary_style()
		ButtonStyle.TERTIARY:
			apply_tertiary_style()
	
	match button_size:
		ButtonSize.SMALL:
			custom_minimum_size = Vector2(100, 32)
		ButtonSize.MEDIUM:
			custom_minimum_size = Vector2(140, 44)
		ButtonSize.LARGE:
			custom_minimum_size = Vector2(200, 52)

func apply_primary_style():
	add_theme_color_override("font_color", style_constants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_hover_color", style_constants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_pressed_color", style_constants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_focus_color", style_constants.COLOR_PRIMARY_BG)
	add_theme_color_override("font_disabled_color", style_constants.COLOR_TEXT_TERTIARY)
	
	var style_normal = StyleBoxFlat.new()
	style_normal.bg_color = style_constants.COLOR_ACCENT_GREEN
	style_normal.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("normal", style_normal)
	
	var style_hover = StyleBoxFlat.new()
	style_hover.bg_color = style_constants.get_hover_color(style_constants.COLOR_ACCENT_GREEN)
	style_hover.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("hover", style_hover)
	
	var style_pressed = StyleBoxFlat.new()
	style_pressed.bg_color = style_constants.get_hover_color(style_constants.COLOR_ACCENT_GREEN, 0.3)
	style_pressed.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("pressed", style_pressed)
	
	var style_disabled = StyleBoxFlat.new()
	style_disabled.bg_color = style_constants.get_disabled_color(style_constants.COLOR_ACCENT_GREEN)
	style_disabled.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("disabled", style_disabled)

func apply_secondary_style():
	add_theme_color_override("font_color", style_constants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_hover_color", style_constants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_pressed_color", style_constants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_focus_color", style_constants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_disabled_color", style_constants.COLOR_TEXT_TERTIARY)
	
	var style_normal = StyleBoxFlat.new()
	style_normal.bg_color = Color.TRANSPARENT
	style_normal.border_color = style_constants.COLOR_ACCENT_GREEN
	style_normal.set_border_enabled(SIDE_TOP, true)
	style_normal.set_border_enabled(SIDE_BOTTOM, true)
	style_normal.set_border_enabled(SIDE_LEFT, true)
	style_normal.set_border_enabled(SIDE_RIGHT, true)
	style_normal.border_width_left = 2
	style_normal.border_width_right = 2
	style_normal.border_width_top = 2
	style_normal.border_width_bottom = 2
	style_normal.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("normal", style_normal)
	
	var style_hover = StyleBoxFlat.new()
	style_hover.bg_color = Color(style_constants.COLOR_ACCENT_GREEN.r, style_constants.COLOR_ACCENT_GREEN.g, style_constants.COLOR_ACCENT_GREEN.b, 0.1)
	style_hover.border_color = style_constants.COLOR_ACCENT_GREEN
	style_hover.set_border_enabled(SIDE_TOP, true)
	style_hover.set_border_enabled(SIDE_BOTTOM, true)
	style_hover.set_border_enabled(SIDE_LEFT, true)
	style_hover.set_border_enabled(SIDE_RIGHT, true)
	style_hover.border_width_left = 2
	style_hover.border_width_right = 2
	style_hover.border_width_top = 2
	style_hover.border_width_bottom = 2
	style_hover.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("hover", style_hover)
	
	var style_disabled = StyleBoxFlat.new()
	style_disabled.bg_color = Color.TRANSPARENT
	style_disabled.border_color = style_constants.COLOR_TEXT_TERTIARY
	style_disabled.set_border_enabled(SIDE_TOP, true)
	style_disabled.set_border_enabled(SIDE_BOTTOM, true)
	style_disabled.set_border_enabled(SIDE_LEFT, true)
	style_disabled.set_border_enabled(SIDE_RIGHT, true)
	style_disabled.border_width_left = 2
	style_disabled.border_width_right = 2
	style_disabled.border_width_top = 2
	style_disabled.border_width_bottom = 2
	style_disabled.set_corner_radius_all(style_constants.RADIUS_BUTTON)
	add_theme_stylebox_override("disabled", style_disabled)

func apply_tertiary_style():
	add_theme_color_override("font_color", style_constants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_hover_color", style_constants.COLOR_ACCENT_GREEN)
	add_theme_color_override("font_pressed_color", style_constants.COLOR_ACCENT_PINK)
	
	var style_transparent = StyleBoxFlat.new()
	style_transparent.bg_color = Color.TRANSPARENT
	add_theme_stylebox_override("normal", style_transparent)
	add_theme_stylebox_override("hover", style_transparent)
	add_theme_stylebox_override("pressed", style_transparent)

func connect_signals():
	pressed.connect(_on_pressed)

func _on_pressed():
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(0.95, 0.95), StyleConstants.ANIM_QUICK)
	await tween.finished
	
	tween = create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "scale", Vector2(1.0, 1.0), StyleConstants.ANIM_FAST)
EOF

echo "✅ Created base_button.gd"

echo ""
echo "✅ Design system files created!"
echo ""
echo "Next steps:"
echo "1. In Godot: Project → Project Settings → Autoload"
echo "2. Add res://autoload/style_constants.gd as 'StyleConstants'"
echo "3. Commit and push your changes to GitHub"
echo ""
echo "git add ."
echo "git commit -m 'feat: Add design system with StyleConstants and BaseButton'"
echo "git push origin main"
