Coop Respawn (Raven Shield 1.60, Coop-Terroristenjagd) - ohne Polling
Gestorbene Spieler respawnen nach fRespawnDelay am Startpunkt, solange
ein anderer menschlicher Spieler lebt. Ereignisgesteuert ueber PawnDied()
des PlayerControllers; die Spielklasse und die Map-.ini bleiben unveraendert.

1. Compile: ToolBelt "Regular 1.60", Projekt CoopRespawn -> CoopRespawn.u
   (Classes: CoopRespawnHelper.uc, R6PlayerController_Respawn.uc)
2. Bei BEIDEN Spielern: CoopRespawn.u in den System-Ordner.
   Nur beim Host: CoopRespawn.ini in den System-Ordner.
3. Bei BEIDEN Spielern in der .mod des gespielten Mods (RavenShield.mod
   bzw. AthenaSword.mod) die Zeile aendern/ergaenzen:
       m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn
   m_ConfigClass wieder auf  Engine.R6ModConfig  (Original) setzen.
   Unter [Engine.GameEngine] nach den anderen ServerPackages ergaenzen:
       ServerPackages=CoopRespawn
   (Pflicht: sonst kann der Client die replizierte Controller-Klasse nicht
   aufloesen und haengt bei "Warten auf Serverantwort".)
   Iron Wrath (MP2Game.MP2PlayerController): noch nicht enthalten.
Rueckgaengig: m_PlayerCtrlToSpawn auf den Originalwert zuruecksetzen
   (RavenShield: R6Engine.R6PlayerController).
Log: im ravenshield.log nach "CoopRespawn:" suchen.
STATUS: nicht kompiliert, nicht getestet.
