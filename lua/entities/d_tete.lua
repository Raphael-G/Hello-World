
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Receiver"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Dom's Advanced Delivery system"
AddCSLuaFile()

if SERVER then
	net.Receive("dads.values", function(len, ply)
		neighborhood = net.ReadString()
		packagesQuantity = net.ReadString()
		paychek = net.ReadString()

		for k,v in pairs(ents.GetAll()) do
			if v:GetClass() == "d_tete" then
				if v.neighborhood == neighborhood then
					v:SetPackageInfo(packagesQuantity, paychek)
				end
			end
		end
	end)

	function ENT:Initialize()
		self:SetModel("models/props_phx/construct/metal_plate1.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)

		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:EnableMotion( false )
		end
	end

	function ENT:SetArea(neighborhood)
		self.neighborhood = neighborhood
	end

	function ENT:SetPackageInfo(packagesQuantity, paychek)
		self.packagesQuantity = packagesQuantity
		self.paychek = paychek
	end

	function ENT:Use(act, ply)
		print("Informações atuais:")
		print(self.neighborhood)
		print(self.packagesQuantity)
		print(self.paychek)
	end

	function ENT:SetPlatColor()
		local found = false

		if not self.neighborhood then
			return
		end

		for k,v in pairs(LocationNames) do
			if LocationNames[k] == self.neighborhood then
				if teleportColors[k] then
					dt:SetColor(teleportColors[k])
					found = true
				end

				break
			end
		end

		if not found then
			dt:SetColor(teleportColors[1])
		end
	end

	function ENT:OnRemove()
	end
end

function ENT:OnRemove()
end

function ENT:Think()
end