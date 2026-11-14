# Sneaky Kids

A small browser platform game. It's 2am, and Seth and Dylan want to watch TV in the snug. Get both boys from the back bedroom down to the snug sofa without waking the house: motion sensors, door reed switches, creaky boards, sleeping dogs, and sometimes Mum or Dad.

Play it at <https://natm.github.io/sneaky-kids/>.

- One self-contained file, `index.html`: no build step, no libraries. Sound is made with Web Audio, and fonts come from Google Fonts.
- Works on computers (arrow keys, Space, Shift, Tab, E, M) and phones (on-screen buttons).
- The game saves itself to the browser's local storage every second, so a reload can carry on.
- Open games check `version.json` every minute and reload into a new version. Run `scripts/bump-version.sh` before committing a change to the game.
