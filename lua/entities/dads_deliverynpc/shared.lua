AddCSLuaFile("configs.lua")
ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.PrintName = "Delivery man"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Dom's Advanced Delivery system"

ENT.AutomaticFrameAdvance = true
function ENT:SetAutomaticFrameAdvance( enable )
	self.AutomaticFrameAdvance = enable
end 