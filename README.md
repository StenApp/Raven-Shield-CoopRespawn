# Raven Shield CoopRespawn

Respawn system for **Coop Terrorist Hunt** in *Rainbow Six 3: Raven Shield*.

If a player dies and at least one human teammate is still alive, they respawn at the start location after a configurable delay.

---

## Features

- Respawn only in **Coop Terrorist Hunt**
- Optional: respawn only if a teammate is still alive
- Configurable respawn delay (via INI)
- Compatible with **OpenRVS** (when integrated correctly)

---

## Installation

### 1. Copy files

Copy the contents of the `Files` folder into your Raven Shield directory:

```
system/CoopRespawn.u
system/CoopRespawn.ini
```

### 2. Edit RavenShield.mod (important!)

**Do not** simply overwrite the included `RavenShield.mod` if you are using OpenRVS.

Open `Mods/RavenShield.mod` and make sure the following lines exist:

```ini
[Engine.R6Mod]
m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn

[Engine.GameEngine]
ServerActors=OpenRVS.OpenServer
ServerActors=OpenRVS.OpenBeacon
ServerActors=OpenRenderFix.OpenFix
ServerPackages=OpenRenderFix
ServerPackages=CoopRespawn
```

> **Note:** Remove the old entry `ServerActors=IpDrv.UdpBeacon`, otherwise OpenRVS will not work correctly.

### 3. Done

Start the game and host/join a Coop Terrorist Hunt match.

---

## Configuration

Edit `system/CoopRespawn.ini`:

```ini
[CoopRespawn.CoopRespawnHelper]
bRespawnEnabled=True
fRespawnDelay=3.000000
bOnlyIfTeammateAlive=True
```

| Setting                  | Description                                      | Default |
|--------------------------|--------------------------------------------------|---------|
| `bRespawnEnabled`        | Enable/disable respawn                           | True    |
| `fRespawnDelay`          | Wait time in seconds until respawn               | 3.0     |
| `bOnlyIfTeammateAlive`   | Only respawn if a teammate is still alive        | True    |

Restart the map/server after changing the INI for the new values to take effect.

---

## OpenRVS Compatibility

The mod is compatible with OpenRVS **if** `RavenShield.mod` is merged correctly (see Installation).

Recommended order:
1. Install OpenRVS
2. Patch `R6GameService.dll` (eth0up patcher)
3. Copy CoopRespawn files
4. Manually merge `RavenShield.mod`

---

## Notes

- Only works in **Coop Terrorist Hunt**.
- Respawn places the player at the map start location.
- Minimum practical delay is about 0.5 seconds.
- Respawn only triggers on real death during an active round (not on join / between rounds).

---

## Compiling (for developers)

Requires the Raven Shield SDK (Twi).

See `Src/CoopRespawn/README.txt` for compile instructions.

---

## Credits

- Original mod: StenApp

---
---

# Raven Shield CoopRespawn (Deutsch)

Respawn-System für **Coop Terrorist Hunt** in *Rainbow Six 3: Raven Shield*.

Wenn ein Spieler stirbt und noch mindestens ein menschlicher Teamkollege lebt, respawnt er nach einer einstellbaren Verzögerung am Startpunkt.

---

## Features

- Respawn nur in **Coop Terrorist Hunt**
- Optional: Respawn nur, wenn noch ein Teammate lebt
- Einstellbare Respawn-Verzögerung (über INI)
- Kompatibel mit **OpenRVS** (bei korrekter Integration)

---

## Installation

### 1. Dateien kopieren

Inhalt des `Files`-Ordners in deinen Raven-Shield-Ordner kopieren:

```
system/CoopRespawn.u
system/CoopRespawn.ini
```

### 2. RavenShield.mod anpassen (wichtig!)

**Nicht** die mitgelieferte `RavenShield.mod` einfach überschreiben, wenn du OpenRVS nutzt.

Öffne `Mods/RavenShield.mod` und stelle sicher, dass folgende Zeilen vorhanden sind:

```ini
[Engine.R6Mod]
m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn

[Engine.GameEngine]
ServerActors=OpenRVS.OpenServer
ServerActors=OpenRVS.OpenBeacon
ServerActors=OpenRenderFix.OpenFix
ServerPackages=OpenRenderFix
ServerPackages=CoopRespawn
```

> **Hinweis:** Den alten Eintrag `ServerActors=IpDrv.UdpBeacon` entfernen, sonst funktioniert OpenRVS nicht korrekt.

### 3. Fertig

Spiel starten und eine Coop-Terrorist-Hunt-Runde hosten/joinen.

---

## Konfiguration

`system/CoopRespawn.ini` bearbeiten:

```ini
[CoopRespawn.CoopRespawnHelper]
bRespawnEnabled=True
fRespawnDelay=3.000000
bOnlyIfTeammateAlive=True
```

| Einstellung              | Beschreibung                                      | Standard |
|--------------------------|---------------------------------------------------|----------|
| `bRespawnEnabled`        | Respawn ein/aus                                   | True     |
| `fRespawnDelay`          | Wartezeit in Sekunden bis zum Respawn             | 3.0      |
| `bOnlyIfTeammateAlive`   | Nur respawnen, wenn noch ein Teammate lebt        | True     |

Nach Änderungen an der INI Map/Server neu starten, damit die Werte greifen.

---

## OpenRVS-Kompatibilität

Der Mod ist mit OpenRVS kompatibel, **wenn** die `RavenShield.mod` korrekt zusammengeführt wird (siehe Installation).

Empfohlene Reihenfolge:
1. OpenRVS installieren
2. R6GameService.dll patchen (eth0up-Patcher)
3. CoopRespawn-Dateien kopieren
4. `RavenShield.mod` manuell mergen

---

## Hinweise

- Funktioniert nur in **Coop Terrorist Hunt**.
- Der Respawn setzt den Spieler an den Startpunkt der Map.
- Praktisches Mindest-Delay liegt bei ca. 0.5 Sekunden.
- Respawn nur bei echtem Tod in laufender Runde (nicht beim Join / zwischen den Runden).

---

## Kompilieren (für Entwickler)

Benötigt das Raven Shield SDK (Twi).

Siehe `Src/CoopRespawn/README.txt` für die Compile-Anleitung.

---

## Credits

- Original-Mod: StenApp
