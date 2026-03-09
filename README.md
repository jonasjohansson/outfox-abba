# ABBA Dance Experience

A custom [Project OutFox](https://projectoutfox.com/) theme inspired by the music and aesthetics of ABBA.

## Setup

1. [Download Project OutFox](https://projectoutfox.com/downloads) (or install via Steam)
2. Copy `Theme/ABBA/` into your OutFox `Appearances/Themes/` directory
3. Copy `Songs/ABBA Collection/` into your OutFox `Songs/` directory
4. Launch OutFox, go to Options > Display & Graphics > Theme, select "ABBA"

### OutFox directories

| Platform | Path |
|----------|------|
| macOS    | `~/Library/Application Support/Project OutFox/` |
| Windows  | `%APPDATA%/Project OutFox/` |
| Linux    | `~/.project-outfox/` |

## Adding Songs

Place song folders in `Songs/ABBA Collection/`. Each song needs:

```
SongName/
  song.ogg          # Audio (Ogg Vorbis)
  song.ssc           # Step chart (create with OutFox editor)
  banner.png         # 418x164
  background.png     # 640x480 or 1920x1080
```

## Theme Structure

```
Theme/ABBA/
  metrics.ini                              # Theme config
  BGAnimations/
    ScreenTitleMenu overlay.lua            # Title screen
    ScreenSelectMusic overlay.lua          # Song selection
    ScreenGameplay overlay.lua             # In-game overlay
    ScreenEvaluation overlay.lua           # Results screen
  Scripts/
    ABBA-Colors.lua                        # Shared color palette
  Languages/
    en.ini                                 # English strings
  Graphics/                                # (add custom assets)
  Fonts/                                   # (add custom fonts)
  Sounds/                                  # (add custom sounds)
```

## Customization

The theme uses a disco-inspired palette:
- Gold `#FFD700` — primary accent
- Blue `#1B3A8C` — backgrounds
- Dark blue `#0A1A4A` — deep backgrounds
- White/silver — text and highlights

Edit `Scripts/ABBA-Colors.lua` to adjust colors globally.
