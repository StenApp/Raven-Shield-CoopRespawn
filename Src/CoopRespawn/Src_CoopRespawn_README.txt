CoopRespawn – Compile Notes / Compile-Hinweise
==============================================

EN
--
What this package does:
- Adds respawn for Coop Terrorist Hunt.
- Only triggers on real death during an active round
  (checks m_bGameStarted and skips InBetweenRoundMenu / PostBetweenRoundTime).
- No respawn on join or between rounds.

How to compile:
1. Copy both .uc files into your SDK project Classes\ folder
   (or place the whole CoopRespawn package into the SDK Code Environment).
2. Compile with ucc make / SDK ToolBelt.
3. Copy the new CoopRespawn.u + CoopRespawn.ini to system\
   (for yourself and any partners/servers that need the mod).

Required .mod entries (host/server):
  m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn
  ServerPackages=CoopRespawn

If you use OpenRVS, keep its ServerActors and also add ServerPackages=CoopRespawn.
Do not leave ServerActors=IpDrv.UdpBeacon when OpenRVS is installed.

Config: system/CoopRespawn.ini
  bRespawnEnabled=True
  fRespawnDelay=3.000000
  bOnlyIfTeammateAlive=True


DE
--
Was dieses Package macht:
- Respawn für Coop Terrorist Hunt.
- Nur bei echtem Tod in laufender Runde
  (prüft m_bGameStarted und überspringt InBetweenRoundMenu / PostBetweenRoundTime).
- Kein Respawn beim Join oder zwischen den Runden.

So kompilierst du:
1. Beide .uc-Dateien in den Classes\-Ordner deines SDK-Projekts kopieren
   (oder das ganze CoopRespawn-Package in die SDK Code Environment legen).
2. Mit ucc make / SDK ToolBelt kompilieren.
3. Neue CoopRespawn.u + CoopRespawn.ini nach system\ kopieren
   (für dich und Partner/Server, die den Mod brauchen).

Erforderliche .mod-Einträge (Host/Server):
  m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn
  ServerPackages=CoopRespawn

Bei OpenRVS die OpenRVS-ServerActors behalten und zusätzlich
ServerPackages=CoopRespawn eintragen.
ServerActors=IpDrv.UdpBeacon entfernen, wenn OpenRVS installiert ist.

Config: system/CoopRespawn.ini
  bRespawnEnabled=True
  fRespawnDelay=3.000000
  bOnlyIfTeammateAlive=True
