class R6PlayerController_Respawn extends R6PlayerController;

// RavenShield.mod / AthenaSword.mod:
//   m_PlayerCtrlToSpawn=CoopRespawn.R6PlayerController_Respawn

function PawnDied()
{
    Super.PawnDied();
    class'CoopRespawnHelper'.static.OnPawnDied(self);
}
