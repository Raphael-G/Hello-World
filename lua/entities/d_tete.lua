
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Cocaine Refined"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "DCoca"
AddCSLuaFile()
if SERVER then

	function ENT:Initialize()
		self:SetModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then phys:Wake() end
		phys:EnableMotion( false )
		self:SetUseType(SIMPLE_USE)
		self.HeldOres = 0
		self.Refining = false
		self.Ready = false
		
	end
	
	function ENT:Use( act, ply )
	end

	function ENT:OnRemove()
	end
	
	function ENT:Think()
	end

end

if CLIENT then

	function ENT:Draw()
		self:DrawModel()
		
	end
	
end