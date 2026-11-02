class R6PlayerController_Respawn extends R6PlayerController;

// In RavenShield.mod / AthenaSword.mod / IronWrath.mod:
//   m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn
//   ServerPackages=CoopRespawn

function PawnDied()
{
    local R6MultiPlayerGameInfo G;

    Super.PawnDied();

    // Nur in laufender Coop-Runde reagieren – NICHT beim Login / zwischen den Runden
    G = R6MultiPlayerGameInfo(Level.Game);
    if (G == none)
        return;

    if (!G.m_bGameStarted)
        return;

    if (G.IsInState('InBetweenRoundMenu') || G.IsInState('PostBetweenRoundTime'))
        return;

    class'CoopRespawnHelper'.static.OnPawnDied(self);
}
