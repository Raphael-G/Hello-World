
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Receiver"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Dom's Advanced Delivery system"
AddCSLuaFile()

if SERVER then
	local s = "s"
	
	util.AddNetworkString("dads_loc")

	function ENT:Initialize()
		self:SetModel("models/props_phx/construct/metal_plate1.mdl")
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

		net.Receive("dads_loc", function(len,ply)
			s = net.ReadString()
			print(s)	
		end)

		print(s)
		if s == "Insdustrial area" then 
			self:SetColor(Color(255,0,0))
		elseif s == "Flatwood hiils condom" then
			self:SetColor(Color(0,255,0))
		end
	end

	function ENT:Use( act, ply )
		print(s)
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