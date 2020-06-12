AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("dads.openderma")
util.AddNetworkString("dads.values")

function ENT:Initialize()
	self:SetModel("models/gman_high.mdl")
	self:SetHullType(HULL_HUMAN)
	self:SetHullSizeNormal()
	self:SetNPCState(NPC_STATE_IDLE)
	self:SetSolid(SOLID_BBOX)
	self:SetUseType(SIMPLE_USE)
	self:SetBloodColor(BLOOD_COLOR_RED)
end

function ENT:Use( ent, ply )

	net.Start("dads.openderma")
	net.Send(ply)

end

function ENT:OnRemove()
	
end

function ENT:Think(ent)

end

function ENT:AcceptInput(name, activator, caller)
	if name == "Use" and caller:IsPlayer() then
	end
end
