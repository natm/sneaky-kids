# CLAUDE.md

Guidance for Claude when working on Sneaky Kids, a small browser platform game Nat made with Claude for the family (Nat, 2026-11-14).

## What it is

It's 2am at Llwynygorras. Seth and Dylan sneak from the back bedroom down to the snug to watch TV without waking the house. It is published with GitHub Pages at <https://natm.github.io/sneaky-kids/> from `main` (root).

- All game work lives in this repo, not in `natm/llwyngorras-home` (Nat, 2026-11-14).
- The repo is public. Nat chose to keep the real names (Seth, Dylan, Molly, Penny, Mum and Dad, "Llwynygorras") and the real Home Assistant entity names in the game (Nat, 2026-11-14). Don't add anything more private than that (no address, network details or credentials).
- The design was also published as a private Claude artifact during development: <https://claude.ai/artifact/Aw97HRrtaoAuJDbymW1Xni>. This repo is now the source of truth.

## How it's built

- One self-contained file, `index.html`: inline CSS and JS, no build step, no libraries. Fonts from Google Fonts with fallbacks; sound is synthesised with Web Audio.
- World is 540 units tall; the view width follows the screen shape. The route runs: back bedroom → main landing → stairs → downstairs hallway → kitchen → snug.
- The game saves itself to `localStorage` every second so a reload (pull-to-refresh, switching apps) can carry on.
- **Versioning and cache busting** (Nat, 2026-11-14): `version.json` holds the current version, and `index.html` has the same number in `GAME_VERSION`. Open games fetch `version.json` (no cache) 1.5 s after opening, every minute, and when the tab comes back into view; if it differs, they save, reload with `?v=<version>` to skip GitHub Pages' 10-minute cache, and carry on where they were. **Run `scripts/bump-version.sh` before every commit that changes the game**, so both numbers change together (a UTC timestamp, `YYYYMMDDHHMM`).

## Game rules (current)

- Both boys must reach the snug sofa; they stick together (one can't get more than 240 units ahead), except while Mum is chasing.
- Dressing gowns: press E (✋) by the hook to put one on. Without a gown a boy gets cold and shivers (an alert). The gown's pockets carry items: Seth 2, Dylan 1 (Dylan always holds his toy dog).
- Items in the bedroom (choose 3 of 4): torch (shows floor hazards in the dark), slippers (no creaks), dog food (feeds a woken dog, 2 portions), chocolate (bribes Mum once).
- Hazards: motion sensors (only see movement), door reed switches (need a fridge magnet), creaky boards, random clothes on the landing and wrappers in the kitchen (jump over), sleeping dogs Molly and Penny (tiptoe; woken dogs chase), Dad dozing on the lounge sofa (about 1 game in 4; game over if he sees you move past the door), Mum (about 2 games in 5; chases, sends both boys back to bed).
- Difficulty is picked at the start of **every** game (Nat, 2026-11-14), in `MODES` in `index.html`. Normal is the original game.

  | | Simple | Normal | Hard |
  |---|---|---|---|
  | Alerts before Dad wakes | 8 | 5 | 3 |
  | Motion sensor looking | 1.6 s of 5.2 s | 2.2 s of 4.6 s | 2.8 s of 4.6 s |
  | Dad on the sofa / looks for | never | 1 in 4 / 1.4 s | 1 in 2 / 2 s |
  | Mum chases / her speed | 15% / 130 | 40% / 160 | 70% / 185 |
  | Clothes + wrappers | none | 0–2 each | 2–3 + 2 |
  | Dog wake distance / chase speed | 70% / 150 | 100% / 200 | 120% / 225 |
  | Seconds before cold without a gown | 20 | 10 | 7 |
  | How far apart the boys can get | 320 | 240 | 200 |

## Working with Nat

- Be concise and use plain English. Keep chat replies short.
- Ask questions with lettered options, the last always "something else", one question at a time.
- It's played mostly on phones: check every change at phone size (about 390×664) and desktop size, with no sideways scroll and all touch buttons visible.
- Test changes in a headless browser before saying they work, and say what wasn't tested (sound can't be checked headless).
- Commit and push straight to `main`.
