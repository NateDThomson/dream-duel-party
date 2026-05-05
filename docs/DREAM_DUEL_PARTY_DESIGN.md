# Dream Duel Party - Game Design Document

## Executive Summary

**Dream Duel Party** is a party game for 2-8 friends that blends the competitive, board-game experience of Mario Party with the accessible, phone-based gameplay of Jackbox Games. Players gather around a central display while controlling their characters on their personal mobile devices, competing in fast-paced mini-games to accumulate the most points.

---

## Core Concept

### Game Overview
- **Genre:** Party Game / Mini-game Collection
- **Player Count:** 2-8 players
- **Session Length:** Player-customizable (typically 4-8 mini-games = 15-40 minutes)
- **Target Audience:** Friends, family gatherings, parties (ages 10+)
- **Platforms:** Steam (host display) + Mobile Web (player controllers)

### The Experience
One player launches the game on Steam, creating a session code. Other players join via their phones using a web browser. Everyone plays simultaneous mini-games in real-time on their devices while results display on the central Steam screen. After each game, rankings are shown, and players either randomly select or take turns choosing the next mini-game. Winner is determined by highest cumulative points.

---

## Game Architecture

### Core Loop (One Session)

1. **Lobby Phase**
   - Host launches Steam app and creates session
   - Session code displayed on main screen
   - Players join via mobile web, enter nickname, and select avatar
   - Host starts session when ready

2. **Mini-Game Phase** (Repeats until session ends)
   - Game selected (random or player choice)
   - All players play simultaneously on their devices (2-5 minutes)
   - Results calculated in real-time based on skill + luck
   - Points awarded in tiered system (1st place gets most, 8th gets least)
   - Rankings displayed between games

3. **End of Session**
   - Final standings shown
   - Winner announced
   - Option to play again or return to lobby

---

## Gameplay Mechanics

### Victory Conditions
- **Primary Win:** Highest cumulative points across all mini-games
- **Session Structure:** Player decides how many games to play before session starts (e.g., "Best of 5")

### Mini-Games (10-15 Total at Launch)
Each mini-game lasts 2-5 minutes and features a mix of:
- **Skill-based challenges:** Reaction time, pattern recognition, precision
- **Luck-based elements:** Random events, chance mechanics, unpredictability
- **Balanced difficulty:** Games should reward both skilled and casual players

**Example Categories:**
- Reaction/Timing (Quiz races, tap challenges)
- Pattern/Logic (Memory games, match-3 variants)
- Drawing/Creative (Quick sketch challenges)
- Reflex (Dodge games, catch games)
- Strategy Lite (Resource allocation in timed rounds)

### Points & Scoring
- **Tiered Point System:**
  - 1st Place: 8 points
  - 2nd Place: 6 points
  - 3rd Place: 4 points
  - 4th Place: 3 points
  - 5th Place: 2 points
  - 6th Place: 1 point
  - 7th-8th Place: 0 points
  
  *(Scales for 2-6 player games proportionally)*

### Game Selection
- **Option 1 (Random):** System randomly selects next mini-game
- **Option 2 (Rotational):** Players take turns choosing from available games
- Players can configure game selection mode before session starts

### Rankings & Progression
- **Between Games:** Rankings displayed for 15-30 seconds
- **Visibility:** All players see current standings
- **End of Session:** Final leaderboard with winner highlighted

---

## Platform & Technology

### Steam App (Godot)
- **Purpose:** Host application, main display, session management
- **Responsibilities:**
  - Create and manage game sessions
  - Display mini-game visuals on central screen
  - Show rankings and results
  - Manage game state and server communication
  - Handle cloud session sync

### Mobile Web (React)
- **Purpose:** Player controllers, lightweight input interface
- **Responsibilities:**
  - Render game-specific UI for each mini-game
  - Capture player input (taps, swipes, holds, drags, etc.)
  - Display player-specific information
  - Real-time sync with host via WebSocket

### Backend (Cloud-Hosted)
- **Responsibilities:**
  - Session management and persistence
  - Real-time data synchronization (WebSocket)
  - Player state tracking
  - Game logic execution
  - Scalability for multiple concurrent sessions

### Tech Stack Summary
```
Steam App:        Godot (GDScript)
Mobile Interface: React (TypeScript/JavaScript)
Communication:    WebSocket (real-time sync)
Backend:          Cloud-hosted (TBD: Node.js, Python, etc.)
Hosting:          Cloud platform (AWS, Firebase, Heroku, etc.)
```

---

## Player Experience

### Customization
- **Avatars:** Pre-designed character options (16-20 options at launch)
- **Nicknames:** Custom text names (max 15 characters)
- **Both set at session start**

### Social Features
- **Communication:** No in-game chat
- **Focus:** Gameplay and reactions (winners celebrated, funny moments via visual feedback)

### Accessibility
- Colorblind-friendly mini-games
- Large, readable fonts on mobile devices
- Support for portrait and landscape orientations

---

## Game Tone & Aesthetic

### Overall Vibe
- **Competitive:** Leaderboards and point systems drive friendly competition
- **Chill:** Low-stress, fun atmosphere; anyone can win
- **Silly:** Humorous game names, funny animations, unexpected outcomes

### Visual Style
- Bright, energetic color palette
- Playful, modern UI
- Quick animations to keep pace engaging
- Consistent branding across Steam and mobile

### Audio
- Upbeat background music
- Satisfying sound effects for wins/interactions
- Celebratory audio for point gains

---

## Future Considerations (Post-Launch)

### Cosmetics & Progression
- Additional avatar packs
- Name color customization
- Achievement badges
- Seasonal cosmetics

### Content Updates
- New mini-games (monthly or seasonal)
- Themed mini-game packs
- Special events

### Advanced Features
- Game statistics & leaderboards
- Replay system
- Custom game mode creation
- Accessibility improvements

---

## Success Metrics

### Launch Goals
1. Smooth session creation and joining (mobile web performance)
2. Real-time synchronization with <100ms latency
3. Positive player feedback on mini-game variety and balance
4. Stable cloud infrastructure supporting 100+ concurrent sessions

### Long-term Goals
1. Build active player community
2. Regular content updates (new mini-games)
3. Expand to additional platforms (console ports, etc.)
4. Establish Dream Duel Party as a go-to party game

---

## Development Roadmap (Suggested)

### Phase 1: MVP (Foundation)
- [ ] Steam app skeleton with session management
- [ ] Mobile web prototype (React setup)
- [ ] Cloud backend for session sync
- [ ] 3-5 core mini-games
- [ ] Basic UI/UX

### Phase 2: Core Gameplay
- [ ] Expand to 10-15 mini-games
- [ ] Polish mini-game balance
- [ ] Implement tiered scoring system
- [ ] Avatar selection & customization
- [ ] Rankings display

### Phase 3: Polish & Launch
- [ ] Performance optimization
- [ ] Visual polish and animations
- [ ] Sound design & music
- [ ] Testing (QA, friends, beta)
- [ ] Launch on Steam

### Phase 4: Post-Launch
- [ ] Community feedback integration
- [ ] New mini-games & cosmetics
- [ ] Bug fixes & balance patches
- [ ] Platform expansion

---

## Questions for Development

1. **Backend:** What cloud platform/service? (AWS, Firebase, self-hosted, etc.)
2. **Mini-Game Design:** Start with simple games (tap, swipe) or more complex mechanics?
3. **Monetization:** Free-to-play, one-time purchase, cosmetic DLC?
4. **Cross-Platform:** Plans for console/mobile app versions down the line?
5. **Networking:** Latency tolerance for real-time gameplay?

---

## Notes

- Keep mini-games short and snappy (2-5 min per game)
- Ensure fairness between skill and luck
- Mobile-first design for responsive web UI
- Cloud infrastructure must handle scaling for parties
