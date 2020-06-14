--init.lua
--all the goods go here
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Full = false
ENT.PDMIng = true

function ENT:Initialize()
	util.AddNetworkString("dads_drawpoint")
	self:SetModel("models/hunter/misc/sphere025x025.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then phys:Wake() end
	self:SetUseType(SIMPLE_USE)
	self:SetMoveType(MOVETYPE_NONE)
	local pos = self:GetPos()
	self:SetTrigger(true)
	self:SetColor(Color(0,0,255))
	self:SetMaterial("models/debug/debugwhite")
end

function ENT:Use( ent, ply )
end

function ENT:OnRemove()
	
end

function ENT:Think()

end

function ENT:StartTouch( ent )
end