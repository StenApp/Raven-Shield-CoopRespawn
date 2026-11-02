class CoopRespawnHelper extends Actor
    config(CoopRespawn);

// Gemeinsame Logik fuer alle PlayerController-Varianten.
// OnPawnDied() wird aus PawnDied() der Controller aufgerufen (ereignisgesteuert).
// Danach laeuft ein einmaliger Timer (Respawn-Verzoegerung), kein Polling.

var config bool  bRespawnEnabled;
var config float fRespawnDelay;
var config bool  bOnlyIfTeammateAlive;

var R6PlayerController m_PC;

static function OnPawnDied(R6PlayerController PC)
{
    local R6MultiPlayerGameInfo G;
    local CoopRespawnHelper H;

    if (!default.bRespawnEnabled || PC.Level.NetMode == NM_Client || PC.Role != ROLE_Authority)
        return;

    G = R6MultiPlayerGameInfo(PC.Level.Game);
    if (G == none || G.m_bGameOver)
        return;

    // Nur Coop-Terroristenjagd
    if (InStr(G.m_szGameTypeFlag, "TerroristHunt") < 0
        || !PC.Level.IsGameTypeCooperative(G.m_szGameTypeFlag))
        return;

    if (PC.IsPlayerPassiveSpectator())
        return;

    if (default.bOnlyIfTeammateAlive && CountAliveOthers(PC) <= 0)
    {
        log("CoopRespawn: kein Mitspieler lebt, kein Respawn");
        return;
    }

    log("CoopRespawn: Respawn geplant fuer " $ PC $ " Spieltyp=[" $ G.m_szGameTypeFlag $ "]");
    H = PC.Spawn(class'CoopRespawnHelper');
    H.m_PC = PC;
    H.SetTimer(FMax(default.fRespawnDelay, 0.5), false);
}

static function int CountAliveOthers(R6PlayerController Me)
{
    local Controller C;
    local R6PlayerController PC;
    local int N;

    for (C = Me.Level.ControllerList; C != none; C = C.nextController)
    {
        PC = R6PlayerController(C);
        if (PC != none && PC != Me && !PC.IsPlayerPassiveSpectator()
            && PC.Pawn != none && PC.Pawn.IsAlive())
            N++;
    }
    return N;
}

function Timer()
{
    local R6MultiPlayerGameInfo G;

    G = R6MultiPlayerGameInfo(Level.Game);

    if (G != none && m_PC != none && !m_PC.bDeleteMe && !G.m_bGameOver
        && !m_PC.IsPlayerPassiveSpectator())
    {
        // Lebt der Spieler wieder (z. B. AI-Backup), nichts tun
        if (m_PC.Pawn == none || !m_PC.Pawn.IsAlive())
        {
            // R6PlayerController.PawnDied laesst Pawn gesetzt;
            // ResetPlayerTeam startet nur neu, wenn kein R6Pawn zugeordnet ist
            m_PC.Pawn = none;
            G.ResetPlayerTeam(m_PC);
            log("CoopRespawn: ResetPlayerTeam fuer " $ m_PC $ " Pawn jetzt=" $ m_PC.Pawn);
        }
        else
            log("CoopRespawn: Respawn uebersprungen, Pawn lebt");
    }
    else
        log("CoopRespawn: Respawn uebersprungen (Spiel vorbei oder Spieler weg)");
    Destroy();
}

defaultproperties
{
    bRespawnEnabled=True
    fRespawnDelay=3.0
    bOnlyIfTeammateAlive=True
    RemoteRole=ROLE_None
    bHidden=True
}
