
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Receiver"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Dom's Advanced Delivery system"

if SERVER then
	util.AddNetworkString("dads_set_teleport")
end

function ENT:Initialize()
	self:SetModel("models/props_phx/construct/metal_plate1.mdl")
	self:SetMaterial("models/wireframe")

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	if SERVER then
		self:SetUseType(SIMPLE_USE)
	end

	self.HeldOres = 0
	self.Refining = false
	self.Ready = false

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
		phys:EnableMotion( false )
	end
end

function ENT:OnRemove()
end

function ENT:Think()
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end

if SERVER then
	function ENT:Use( act, ply )
		print(s)
	end

	net.Receive("dads_set_teleport", function(len, ply)
		print("funcao vazia esperando por algo")
	end)
end
