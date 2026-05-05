# Dream Duel Party - Godot Style Guide

## Overview

This document outlines the visual language, design standards, and best practices for developing Dream Duel Party in Godot. All team members should follow these guidelines to ensure consistency across the Steam app, mini-games, and UI elements.

---

## Visual Style

### Aesthetic Direction
- **Style:** Hand-drawn/Illustrative
- **Tone:** Friendly, modern, expressive
- **Consistency:** All mini-games share the same visual language and cohesive look
- **Goal:** Warm, approachable, indie game feel

### Influences
- Hand-drawn digital art (not traced from photographs)
- Expressive character animations
- Organic shapes with intentional design
- Playful, approachable visual language

---

## Color Palette

### Core Neutrals (Base Colors)
These form the foundation of all UI and backgrounds. They lean **cool** with blue and purple undertones.

```
Primary Background:    #0F1419  (Deep cool gray/blue-black)
Secondary Background:  #1A1F2E  (Cool dark gray)
Tertiary Background:   #25293D  (Slightly lighter cool gray)
Text (Primary):        #E8EAED  (Off-white, high contrast)
Text (Secondary):      #9CA3AF  (Medium cool gray, for less important text)
Text (Tertiary):       #6B7280  (Darker cool gray, for disabled/muted text)
Border Color:          #374151  (Cool gray for dividers)
```

### Accent Colors (Pop Colors)
Choose **1-2** from this vibrant palette to create visual interest and guide player attention.

#### Option A: Vibrant Green + Hot Pink
```
Primary Accent:        #00FF88  (Vibrant Neon Green)
Secondary Accent:      #FF006E  (Hot Magenta/Pink)
```

#### Option B: Vibrant Green + Bright Cyan
```
Primary Accent:        #00FF88  (Vibrant Neon Green)
Secondary Accent:      #00D9FF  (Bright Cyan)
```

#### Option C: Hot Pink + Neon Purple
```
Primary Accent:        #FF006E  (Hot Magenta/Pink)
Secondary Accent:      #9D4EDD  (Neon Purple)
```

**Recommendation:** Use **Option A** (Neon Green + Hot Pink) for maximum visual pop and playfulness.

### State Colors
Use these colors consistently for user feedback across all UI and mini-games.

```
Success:               #10B981  (Emerald Green)
Warning:               #F59E0B  (Amber/Gold)
Error:                 #EF4444  (Red)
Info:                  #3B82F6  (Blue)
Disabled:              #6B7280  (Cool gray, text color)
```

### Usage Guidelines
- **Backgrounds:** Use primary and secondary neutrals
- **Text:** High contrast with off-white on dark backgrounds
- **Accent Elements:** Use accent colors sparingly for CTAs, highlights, and feedback
- **Mini-Games:** Keep the same color palette; vary accent application per game
- **Consistency:** Never introduce new colors without team approval

---

## Typography

### Font Selection

#### Primary Font (UI & Body Text)
- **Name:** Montserrat
- **Fallback:** Arial, sans-serif
- **Usage:** All UI text, labels, descriptions, body copy

#### Display Font (Headings & Titles - Custom/Indie Feel)
- **Name:**  Montserrat Bold
- **Fallback:** Arial, sans-serif
- **Usage:** Game titles, major headings, splash screens, player names

### Font Weights & Sizes

| Element | Font | Weight | Size | Line Height | Notes |
|---------|------|--------|------|-------------|-------|
| **Large Heading** | Display | Extra Bold (900) | 48px | 1.2 | Game titles, splash screens |
| **Medium Heading** | Display | Bold (700) | 32px | 1.3 | Mini-game titles, major sections |
| **Small Heading** | Display | SemiBold (600) | 24px | 1.3 | Section headers, rankings |
| **Body Text** | Primary | Regular (400) | 16px | 1.5 | General UI text, instructions |
| **Small Body** | Primary | Regular (400) | 14px | 1.5 | Secondary info, captions |
| **Label** | Primary | Medium (500) | 12px | 1.4 | Button labels, tags |
| **Tiny** | Primary | Regular (400) | 11px | 1.3 | Tooltips, metadata |

### Typography Rules
- **Hierarchy:** Use weight (not size alone) to create visual hierarchy
- **Readability:** Maintain minimum 14px for body text on mobile
- **Contrast:** All text must meet WCAG AA standards (4.5:1 ratio for normal text)
- **Custom Font Files:** Store in `res://assets/fonts/` with `.ttf` or `.otf` extension
- **Godot Setup:** Use `DynamicFont` or `Font` resources for consistency

---

## UI Component Specifications

### Buttons

#### Primary Button (CTAs)
```
Background:  Accent Color (Neon Green)
Text:        Dark (use cool gray or black for contrast)
Text Weight: SemiBold (600)
Padding:     12px vertical, 24px horizontal
Border:      Rounded 8px
Hover State: Slightly darker accent color (20% darker)
Active State: Accent color + 2px border highlight
Disabled:    60% opacity, text color = disabled color
```

#### Secondary Button
```
Background:  Transparent
Border:      2px solid, Accent Color (Neon Green)
Text:        Accent Color
Text Weight: Medium (500)
Padding:     10px vertical, 20px horizontal
Border:      Rounded 8px
Hover State: Slight background color (10% of accent)
Active State: Full background color
Disabled:    40% opacity
```

#### Tertiary Button (Minimal)
```
Background:  Transparent
Border:      None
Text:        Accent Color or Secondary Text
Text Weight: Regular (400)
Padding:     8px vertical, 16px horizontal
Hover State: Underline or slight opacity change
Active State: Bold weight or accent highlight
Disabled:    Tertiary text color
```

### Input Fields

```
Background:        Secondary Background (#1A1F2E)
Border:            1px solid, Border Color (#374151)
Border (Focus):    2px solid, Accent Color
Text:              Primary Text Color
Placeholder:       Secondary Text Color (60% opacity)
Padding:           10px
Border Radius:     6px
Line Height:       1.5
```

### Cards / Panels

```
Background:        Secondary Background (#1A1F2E)
Border:            1px solid, Border Color
Border Radius:     12px
Padding:           16px
Box Shadow:        None (flat design) or subtle (0px 4px 12px rgba(0,0,0,0.3))
Hover State:       Slight background lightening (5%)
Selected State:    Accent color border highlight
```

### Badges / Tags

```
Background:        Accent Color (Neon Green) or State Color
Text:              Dark (use cool gray or black)
Text Weight:       Medium (500)
Padding:           4px vertical, 8px horizontal
Border Radius:     4px (pill-shaped: 20px)
Font Size:         12px
```

### Loading Spinner / Progress

```
Color:             Accent Color (Neon Green)
Opacity:           100% on animation frames
Thickness:         2-3px
Speed:             0.8s per rotation
Background Track:  Border Color (#374151) at 30% opacity
```

---

## Spacing & Layout

### Spacing Scale
Use this consistent spacing scale throughout the app:

```
xs:   4px    (minimal spacing, text-level)
sm:   8px    (tight spacing, between adjacent elements)
md:  12px    (standard spacing, between components)
lg:  16px    (generous spacing, between sections)
xl:  24px    (large spacing, between major sections)
2xl: 32px    (extra large spacing, page margins)
3xl: 48px    (splash screens, hero sections)
```

### Grid System
- **Base Unit:** 4px
- **Column Grid:** 12-column layout for responsive design
- **Gutter:** 16px between columns
- **Mobile:** Stack to 1 column with 16px margins
- **Tablet:** 2-column layout with 12px gutters
- **Desktop:** Full multi-column layout

### Margins & Padding
- **Page/Container:** 16px on mobile, 24px on desktop
- **Component Padding:** 12-16px standard
- **Element Spacing:** 8-12px between adjacent elements
- **Section Spacing:** 24-32px between major sections

---

## Corner Radius

All UI elements should use **rounded corners** for a friendly, modern feel.

```
Buttons:           8px
Cards/Panels:      12px
Input Fields:      6px
Large Components:  16px
Badges/Tags:       4px (or 20px for pill-shaped)
Dialogs/Modals:    12px
```

---

## Animation & Motion

### Animation Philosophy
Use **purposeful, balanced animations** only:
- Animations should serve a functional purpose (indicate state, guide attention)
- Avoid purely decorative animations
- Keep animations snappy (200-400ms for most interactions)
- Ease functions: Ease-in-out for natural motion

### Standard Animation Timings

| Action | Duration | Easing | Purpose |
|--------|----------|--------|---------|
| Button Hover | 200ms | ease-out | Feedback |
| Fade In/Out | 300ms | ease-in-out | State change |
| Slide | 300-400ms | ease-out | Navigation |
| Scale (Pop) | 200ms | ease-out | Emphasis |
| Rotation | 300ms | linear | Loading |
| Color Transition | 200ms | ease-out | Feedback |

### Common Animation Patterns

**Button Interaction:**
```
Press: Scale down 95% + opacity fade (100ms)
Release: Scale back to 100% (150ms)
Hover (on desktop): Slight scale up 105% or glow effect
```

**Page Transition:**
```
Fade out current page (200ms)
Brief pause (50ms)
Fade in new page (300ms)
```

**Score/Feedback:**
```
Number pop up + fade in (300ms, ease-out)
Score text scales from 80% to 100%
Color flash (success/warning color, 400ms fade)
```

**Loading State:**
```
Spinner rotation (0.8s per full rotation, linear)
Pulsing opacity (0.5 - 1.0, 1.2s)
```

### Godot Animation Setup
- Use `Tween` for smooth animations
- Use `AnimationPlayer` for complex sequences
- Predefine reusable animation states
- Document custom easing curves in code comments

---

## Icons & Graphics

### Icon Style
- **Style:** Hand-drawn, matching the illustrative aesthetic
- **Consistency:** All icons follow the same line weight and style
- **Size:** Design at 24px, 32px, and 48px variants
- **Padding:** 2-4px internal padding around icon
- **Strokes:** 1.5-2px line weight for visibility

### Icon Usage
- **Navigation:** Clear, recognizable icons for main actions
- **Feedback:** Icons to reinforce success/error/warning states
- **Mini-Games:** Custom illustrated icons for each game
- **Players:** Avatar icons should use consistent hand-drawn style

### Storage
- Store all icons in `res://assets/icons/` 
- Organized by category: `navigation/`, `feedback/`, `games/`, etc.
- Export as `.svg` or `.png` (for high DPI support)

---

## Player Avatars

### Avatar Design
- **Style:** Hand-drawn, illustrative characters
- **Consistency:** All avatars use the same art style, proportions, and color palette
- **Color:** Each avatar uses 1-2 accent colors from the main palette
- **Variety:** 16-20 character options at launch (mix of expressions, styles, etc.)

### Avatar Technical Specs
- **Base Size:** 128x128px (scale down to 64x64px, 48x48px as needed)
- **Export Format:** `.png` with transparency
- **Storage:** `res://assets/avatars/avatar_[name].png`
- **Naming Convention:** `avatar_character_name` (e.g., `avatar_luna.png`)

---

## Mini-Game Consistency

### All Mini-Games Should:
1. **Use the same color palette** (cool neutrals + accent colors)
2. **Use the same typography** (primary and display fonts)
3. **Follow the same UI patterns** (buttons, progress, feedback)
4. **Apply consistent spacing** (use spacing scale)
5. **Use rounded corners** (8-12px throughout)
6. **Include smooth animations** (200-400ms state transitions)
7. **Provide clear feedback** (success/error/progress states)
8. **Support both portrait & landscape** (mobile-responsive)

### Mini-Game Template Structure (Godot)
```
MiniGameBase (Scene)
├── Background
├── GameContainer
│   ├── Title (Label)
│   ├── GameArea (Node2D/Control)
│   └── Instructions (Label)
├── UILayer
│   ├── Timer (Label)
│   ├── ScoreDisplay (Label)
│   └── ActionButtons (HBoxContainer)
└── AnimationPlayer
```

---

## Dark Mode Considerations

Dream Duel Party is designed with a **dark-first approach**:
- All backgrounds default to cool dark neutrals
- Text is light for high contrast
- Accent colors pop against dark backgrounds
- No light mode is planned at launch

---

## Accessibility Guidelines

### Color Contrast
- All text meets WCAG AA standards (4.5:1 ratio minimum)
- Don't rely on color alone to convey information
- Test with colorblind-friendly tools (Coblis)

### Readability
- Minimum font size: 14px for body text
- Maximum line length: 70-80 characters
- Use adequate line height (1.4-1.6)
- Avoid low-contrast text combinations

### Interactive Elements
- Buttons must be at least 44x44px (touch-friendly)
- Focus states must be visible (border or outline)
- Avoid auto-playing animations (allow user control)

---

## Godot-Specific Implementation

### File Organization
```
res://
├── assets/
│   ├── fonts/
│   │   ├── primary_font.ttf
│   │   └── display_font.ttf
│   ├── icons/
│   │   ├── navigation/
│   │   ├── feedback/
│   │   └── games/
│   ├── avatars/
│   │   └── avatar_*.png
│   ├── backgrounds/
│   │   └── background_*.png
│   └── ui/
│       └── texture_*.png
├── scenes/
│   ├── ui/
│   │   ├── buttons/
│   │   ├── panels/
│   │   └── components/
│   ├── mini_games/
│   │   └── [game_name]/
│   └── screens/
├── scripts/
│   ├── ui/
│   ├── games/
│   └── managers/
├── themes/
│   └── theme.tres
└── constants/
    └── style_constants.gd
```

### Theme Resource (theme.tres)
Create a centralized Godot `Theme` resource with:
- All colors defined
- Font assignments
- Button styles
- Panel styles
- Icon sizes

**Example:**
```gdscript
# In theme.tres or style_constants.gd
const COLOR_PRIMARY_BG = Color("#0F1419")
const COLOR_SECONDARY_BG = Color("#1A1F2E")
const COLOR_TEXT_PRIMARY = Color("#E8EAED")
const COLOR_ACCENT_GREEN = Color("#00FF88")
const COLOR_ACCENT_PINK = Color("#FF006E")
const COLOR_SUCCESS = Color("#10B981")
const COLOR_WARNING = Color("#F59E0B")
const COLOR_ERROR = Color("#EF4444")

const FONT_SIZE_LARGE = 48
const FONT_SIZE_MEDIUM = 32
const FONT_SIZE_BODY = 16
const FONT_SIZE_SMALL = 12

const SPACING_XS = 4
const SPACING_SM = 8
const SPACING_MD = 12
const SPACING_LG = 16
const SPACING_XL = 24

const CORNER_RADIUS_BUTTON = 8
const CORNER_RADIUS_CARD = 12
```

### Reusable UI Components
Create base scenes for common UI elements:
- `BaseButton.tscn` (handles styling, animations, states)
- `BaseCard.tscn` (panel with consistent padding/border)
- `BaseInputField.tscn` (input with focus states)
- `BaseModal.tscn` (dialog with overlay)

---

## Design Review Checklist

Before submitting code/scenes, verify:

- [ ] Colors match the palette (no unauthorized colors)
- [ ] Typography follows the scale (sizes, weights, line height)
- [ ] Buttons are consistent (styling, padding, corner radius)
- [ ] Spacing uses the defined scale (4px multiples)
- [ ] Animations are purposeful and 200-400ms
- [ ] Corner radius matches specifications (8-12px for buttons/cards)
- [ ] Text contrast is WCAG AA compliant
- [ ] Mini-game matches the overall visual language
- [ ] Icons and avatars match the illustrative style
- [ ] All interactive elements have visible hover/focus states
- [ ] Layout is responsive (mobile portrait & landscape)
- [ ] No unauthorized fonts are used

---

## Resources & References

### Godot Documentation
- [Godot Theme System](https://docs.godotengine.org/en/stable/tutorials/ui/gui_using_theme_overrides.html)
- [Godot Tween](https://docs.godotengine.org/en/stable/tutorials/animation/tween.html)
- [Godot UI Best Practices](https://docs.godotengine.org/en/stable/tutorials/ui/index.html)

### Design Tools
- **Color Picker:** https://coolors.co/
- **Contrast Checker:** https://webaim.org/resources/contrastchecker/
- **Colorblind Simulator:** https://www.color-blindness.com/coblis-color-blindness-simulator/
- **Font Pairing:** https://fontjoy.com/

### Art & Animation
- **Icon Resources:** Lucide Icons, Tabler Icons
- **Hand-drawn Asset Inspiration:** itch.io, OpenGameArt.org

---

## Questions & Clarifications

For questions about the style guide, reach out to the team. Updates and clarifications should be noted in this document with a changelog at the bottom.

### Changelog
- **v1.0** (Initial) - Foundation colors, typography, components, spacing

---

## Notes for Developers

1. **Before starting a new scene:** Check this style guide first
2. **When adding new colors/fonts:** Get team approval and update the guide
3. **Use constants, not magic numbers:** Always reference `StyleConstants.gd`
4. **Test on mobile:** Always preview on mobile devices (portrait & landscape)
5. **Animate purposefully:** Every animation should have a functional reason
6. **Accessibility first:** High contrast, readable fonts, touch-friendly buttons
