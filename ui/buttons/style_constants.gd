extends Node
## Central constants file for all Dream Duel Party styling
## Reference this file across all scenes for consistency

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

# Display Font Sizes (Montserrat 900 - Headings & Titles)
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
const FONT_WEIGHT_BOLD = 700         # Major headings (Montserrat 900 = Ultra Bold)
const FONT_WEIGHT_EXTRA_BOLD = 900   # Display font weight (Montserrat 900)

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
# ANIMATION TIMINGS (milliseconds)
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

# Godot shadows: (offset_x, offset_y, blur, spread, color)
const SHADOW_NONE = Color.TRANSPARENT
const SHADOW_SUBTLE = Color(0, 0, 0, 0.2)    # 20% opacity black
const SHADOW_MEDIUM = Color(0, 0, 0, 0.3)    # 30% opacity black
const SHADOW_PROMINENT = Color(0, 0, 0, 0.4) # 40% opacity black

# ============================================================================
# FOCUS & ACCESSIBILITY
# ============================================================================

const FOCUS_BORDER_WIDTH = 2
const FOCUS_BORDER_COLOR = Color(COLOR_ACCENT_GREEN)
const FOCUS_OUTLINE_WIDTH = 2
const MIN_CONTRAST_RATIO = 4.5               # WCAG AA for normal text
const MIN_CONTRAST_LARGE = 3.0               # WCAG AA for large text

# ============================================================================
# UTILITY - Animation Easing
# ============================================================================

# For use with Tween.set_trans() and Tween.set_ease()
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
