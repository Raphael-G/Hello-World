hook.Add( "PlayerDeath", "ResetOresAndMinerals", function( ply )

	ply:SetNWInt( "HeldOres", 0 )
	ply:SetNWInt( "HeldDiam", 0 )
	ply:SetNWInt( "HeldGold", 0 )
	ply:SetNWInt( "HeldRhod", 0 )
	ply:SetNWInt( "HeldPlat", 0 )

end )