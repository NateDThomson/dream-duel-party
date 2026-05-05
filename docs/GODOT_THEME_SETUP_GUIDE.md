# Godot Theme & Style System Setup Guide

## Overview

Dream Duel Party uses a centralized theming system to ensure consistency across all scenes. This guide explains how to set up and use the theme, constants, and reusable components.

---

## File Structure

```
res://
├── constants/
│   └── style_constants.gd          # Central constants file (colors, sizes, spacing)
├── resources/
│   └── theme.tres                   # Godot Theme resource (fonts, styles)
├── assets/
│   └── fonts/
│       ├── montserrat_900.ttf       # Display font (headings)
│       └── montserrat_regular.ttf   # Body font (UI text)
└── scenes/
    └── ui/
        ├── buttons/
        │   └── base_button.gd       # Reusable button component
        └── panels/
            └── base_card.gd         # Reusable card component
```

---

## Step 1: Add Fonts to Your Project

### Before You Can Use the Theme

✅ **You already have the fonts!** You've added:
- `Montserrat-Black.ttf` (for titles/headings - weight 900)
- `Montserrat-Regular.ttf` (for body text - weight 400)
- `Montserrat-Light.ttf` (optional, for lighter text)
- `Montserrat-Medium.ttf` (optional, for medium emphasis)

**The theme.tres file is already configured to use these exact filenames:**
```
path="res://assets/fonts/Montserrat-Black.ttf"
path="res://assets/fonts/Montserrat-Regular.ttf"
```

**If you need to update UIDs:**
1. Right-click each font file in Godot's file explorer
2. Copy the UID
3. Update `theme.tres` with the new UIDs if they don't match

---

## Step 2: Set Up Auto-load for StyleConstants

The `StyleConstants` must be accessible from any scene in your project.

### In Godot Editor:
1. Go to **Project → Project Settings → Autoload**
2. Add `res://constants/style_constants.gd`
3. Name it: **StyleConstants**

Now you can access it from any script with:
```gdscript
StyleConstants.COLOR_ACCENT_GREEN
StyleConstants.SPACING_LG
StyleConstants.ANIM_NORMAL
```

---

## Step 3: Apply the Theme to Your Project

### Option A: Apply to Root Scene (Recommended)
1. Open your main scene
2. Select the root node
3. In the Inspector → **Theme** property
4. Drag `res://resources/theme.tres` into the Theme field
5. All child nodes will inherit the theme

### Option B: Apply Individually
For specific scenes, you can set the theme directly:
```gdscript
# In your scene script
func _ready():
    theme = load("res://resources/theme.tres")
```

---

## Step 4: Using the Theme in Scenes

### Example 1: Using Theme Colors in Labels

```gdscript
extends Label

func _ready():
    # This uses the theme color
    add_theme_color_override("font_color", StyleConstants.COLOR_TEXT_PRIMARY)
```

### Example 2: Using Theme Fonts

The theme is already applied to your root scene, so Label, Button, etc. will automatically use Montserrat fonts. You can also explicitly apply:

```gdscript
extends Label

func _ready():
    # Use the font from theme
    add_theme_font_override("font", theme.get_font("font", "Label"))
```

### Example 3: Creating Styled Elements Programmatically

```gdscript
extends Control

func _ready():
    # Create a styled label
    var label = Label.new()
    label.add_theme_color_override("font_color", StyleConstants.COLOR_TEXT_PRIMARY)
    label.add_theme_font_size_override("font_size", StyleConstants.FONT_SIZE_BODY)
    label.text = "Hello, World!"
    add_child(label)
```

---

## Using the Reusable Components

### BaseButton

Create a button with consistent styling and animations:

```gdscript
extends Control

func _ready():
    var btn = BaseButton.new()
    btn.text = "Click Me"
    btn.button_size = BaseButton.ButtonSize.MEDIUM
    btn.button_style = BaseButton.ButtonStyle.PRIMARY
    btn.pressed.connect(_on_button_pressed)
    add_child(btn)

func _on_button_pressed():
    print("Button pressed!")
```

**Button Style Options:**
```
PRIMARY    - Filled with accent color (green)
SECONDARY  - Outlined/bordered
TERTIARY   - Text-only, minimal
```

**Button Size Options:**
```
SMALL      - 100x32px
MEDIUM     - 140x44px  (default)
LARGE      - 200x52px
```

### BaseCard

Create a styled card/panel:

```gdscript
extends Control

func _ready():
    var card = BaseCard.new()
    card.card_size = BaseCard.CardSize.MEDIUM
    card.has_shadow = true
    card.is_selectable = true
    add_child(card)
    
    # Add content to the card
    var label = Label.new()
    label.text = "Card Content"
    card.add_child(label)
```

**Card Size Options:**
```
SMALL      - 200x100px
MEDIUM     - 300x150px (default)
LARGE      - 400x200px
```

---

## Color Palette Reference

### Primary Colors (Use for backgrounds)
```gdscript
StyleConstants.COLOR_PRIMARY_BG        # #0F1419 - Deep cool gray-blue
StyleConstants.COLOR_SECONDARY_BG      # #1A1F2E - Cool dark gray
StyleConstants.COLOR_TERTIARY_BG       # #25293D - Slightly lighter
```

### Text Colors
```gdscript
StyleConstants.COLOR_TEXT_PRIMARY      # #E8EAED - Off-white
StyleConstants.COLOR_TEXT_SECONDARY    # #9CA3AF - Medium cool gray
StyleConstants.COLOR_TEXT_TERTIARY     # #6B7280 - Dark cool gray (disabled)
```

### Accent Colors (Use for CTAs, highlights)
```gdscript
StyleConstants.COLOR_ACCENT_GREEN      # #00FF88 - Neon green
StyleConstants.COLOR_ACCENT_PINK       # #FF006E - Hot pink
```

### State Colors (Feedback)
```gdscript
StyleConstants.COLOR_SUCCESS           # #10B981 - Emerald green
StyleConstants.COLOR_WARNING           # #F59E0B - Amber/gold
StyleConstants.COLOR_ERROR             # #EF4444 - Red
StyleConstants.COLOR_INFO              # #3B82F6 - Blue
```

---

## Spacing Scale Reference

Use these for consistent spacing throughout the app:

```gdscript
StyleConstants.SPACING_XS              # 4px   - Minimal
StyleConstants.SPACING_SM              # 8px   - Tight
StyleConstants.SPACING_MD              # 12px  - Standard
StyleConstants.SPACING_LG              # 16px  - Generous
StyleConstants.SPACING_XL              # 24px  - Large
StyleConstants.SPACING_2XL             # 32px  - Extra large
StyleConstants.SPACING_3XL             # 48px  - Hero sections
```

### Example: Using Spacing in Layouts

```gdscript
extends VBoxContainer

func _ready():
    add_theme_constant_override("separation", StyleConstants.SPACING_MD)
    
    # Add labeled controls
    var label = Label.new()
    label.text = "Email:"
    add_child(label)
    
    # Space between label and input
    var spacer = Control.new()
    spacer.custom_minimum_size.y = StyleConstants.SPACING_SM
    add_child(spacer)
    
    var input = LineEdit.new()
    add_child(input)
```

---

## Typography Reference

### Font Sizes

```gdscript
# Headings (use Montserrat 900)
StyleConstants.FONT_SIZE_LARGE_HEADING    # 48px
StyleConstants.FONT_SIZE_MEDIUM_HEADING   # 32px
StyleConstants.FONT_SIZE_SMALL_HEADING    # 24px

# Body (use Montserrat Regular)
StyleConstants.FONT_SIZE_BODY             # 16px
StyleConstants.FONT_SIZE_SMALL_BODY       # 14px
StyleConstants.FONT_SIZE_LABEL            # 12px
StyleConstants.FONT_SIZE_TINY             # 11px
```

### Example: Creating Styled Text

```gdscript
extends Control

func _ready():
    # Large heading
    var title = Label.new()
    title.text = "Game Over!"
    title.add_theme_font_size_override("font_size", StyleConstants.FONT_SIZE_LARGE_HEADING)
    title.add_theme_color_override("font_color", StyleConstants.COLOR_TEXT_PRIMARY)
    add_child(title)
    
    # Body text
    var body = Label.new()
    body.text = "Congratulations, you won!"
    body.add_theme_font_size_override("font_size", StyleConstants.FONT_SIZE_BODY)
    body.add_theme_color_override("font_color", StyleConstants.COLOR_TEXT_SECONDARY)
    add_child(body)
```

---

## Animation Timings

All animations should use these standard durations:

```gdscript
StyleConstants.ANIM_QUICK              # 0.15s - Quick feedback
StyleConstants.ANIM_FAST               # 0.2s  - Button hover/press
StyleConstants.ANIM_NORMAL             # 0.3s  - Standard transitions
StyleConstants.ANIM_SLOW               # 0.4s  - Deliberate transitions
StyleConstants.ANIM_VERY_SLOW          # 0.6s  - Extended animations
StyleConstants.ANIM_SPIN_DURATION      # 0.8s  - Loading spinner
```

### Example: Animate Button Scale

```gdscript
extends Control

func _ready():
    var button = Button.new()
    button.text = "Click"
    button.pressed.connect(_on_button_press)
    add_child(button)

func _on_button_press():
    var tween = create_tween()
    tween.set_trans(Tween.TRANS_BACK)
    tween.set_ease(Tween.EASE_OUT)
    tween.tween_property(button, "scale", Vector2(0.95, 0.95), StyleConstants.ANIM_QUICK)
    await tween.finished
    tween = create_tween()
    tween.tween_property(button, "scale", Vector2(1, 1), StyleConstants.ANIM_FAST)
```

---

## Helper Functions

The `StyleConstants` class includes useful helper functions:

```gdscript
# Get a color with modified opacity
var semi_transparent = StyleConstants.get_color_with_opacity(
    StyleConstants.COLOR_ACCENT_GREEN, 0.5
)

# Get a darker color (for hover states)
var hover_color = StyleConstants.get_hover_color(
    StyleConstants.COLOR_ACCENT_GREEN
)

# Get a lighter color (for active states)
var active_color = StyleConstants.get_active_color(
    StyleConstants.COLOR_ACCENT_GREEN
)

# Get a disabled version (50% opacity)
var disabled_color = StyleConstants.get_disabled_color(
    StyleConstants.COLOR_ACCENT_GREEN
)

# Check contrast ratio
var passes_wcag = StyleConstants.check_contrast_ratio(
    StyleConstants.COLOR_TEXT_PRIMARY,
    StyleConstants.COLOR_PRIMARY_BG
)
```

---

## Best Practices

### ✅ DO:
- Always use `StyleConstants` for colors, spacing, fonts, sizes
- Use the BaseButton and BaseCard components for consistency
- Apply the theme to your root scene
- Test on mobile devices (portrait & landscape)
- Use SPACING scale for all margins/padding

### ❌ DON'T:
- Don't hardcode colors (e.g., `Color("#FF0000")`)
- Don't use arbitrary spacing values (e.g., `15` or `23`)
- Don't create custom button styles without team approval
- Don't mix font sizes from different sources
- Don't add new colors to the palette without team consensus

---

## Troubleshooting

### Theme Not Applying
1. Ensure `theme.tres` is in `res://resources/`
2. Check that fonts are properly imported in `res://assets/fonts/`
3. Reload Godot (File → Reload Current Scene)
4. Clear Godot cache (delete `.godot/` folder)

### Fonts Look Wrong
1. Make sure you're using Montserrat 900 (for headings) and Montserrat Regular (for body)
2. Check font size is set correctly
3. Verify UIDs in `theme.tres` match your imported fonts

### Colors Don't Match
1. Verify you're using `StyleConstants.COLOR_*` constants
2. Check theme overrides aren't conflicting
3. Ensure primary background color is `#0F1419`

---

## Quick Start Checklist

- [x] ✅ Montserrat fonts already added to project
  - Montserrat-Black.ttf (for headings)
  - Montserrat-Regular.ttf (for body text)
  - Montserrat-Light.ttf (bonus, optional)
  - Montserrat-Medium.ttf (bonus, optional)
- [ ] Copy `style_constants.gd` to `res://constants/`
- [ ] Copy `theme.tres` to `res://resources/`
- [ ] Copy `base_button.gd` to `res://scenes/ui/buttons/`
- [ ] Copy `base_card.gd` to `res://scenes/ui/panels/`
- [ ] Add StyleConstants to Autoload (Project Settings)
  - Go to Project → Project Settings → Autoload
  - Add `res://constants/style_constants.gd` as **StyleConstants**
- [ ] Apply theme to your root scene
  - Select root node → Inspector → Theme property
  - Drag `res://resources/theme.tres` into the field
- [ ] Test colors, fonts, and spacing in a test scene
- [ ] Share with team and get feedback

---

## Questions?

Reference this guide or check the style guide (`STYLE_GUIDE.md`) for more details on design specifications.

Good luck, and have fun building! 🎮
