AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("dads.openderma")
util.AddNetworkString("dads.values")
util.AddNetworkString("dadas_menuclose")

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
	self:EmitSound("vo/canals/gunboat_herelook.wav")

end
function ENT:OnRemove()
	
end

function ENT:Think(ent)
net.Receive("dadas_menuclose",function(ent, ply)
	self:EmitSound("vo/eli_lab/airlock_cit01.wav")
end)

end

function ENT:AcceptInput(name, activator, caller)
	if name == "Use" and caller:IsPlayer() then
	end
end
