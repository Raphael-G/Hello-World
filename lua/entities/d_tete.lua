
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Receiver"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Dom's Advanced Delivery system"
AddCSLuaFile()

if SERVER then
	local d = "d"
	local o = "o"
	local m = "m"
	local s = "s"
	
	util.AddNetworkString("dads_set_teleport")

	function ENT:Initialize()
		self:SetModel("models/props_phx/construct/metal_plate1.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then phys:Wake() end
		phys:EnableMotion( false )
		self:SetUseType(SIMPLE_USE)
		self.group = "A"
		net.Receive("dads_loc", function(len,ply)
			s = net.ReadString()
			group = s
			print(group)
		end)
		net.Receive("dads.values", function(len,ply)
			d = net.ReadString()
			o = net.ReadString()
			m = net.ReadString()
			print("D "..d.."\nO "..o.."\nM "..m)
			--print(group)
		end)
	end


	function ENT:Use( act, ply )
		print(s)
	end

	function ENT:OnRemove()
	end
	
	function ENT:Think()
		if d == group then
			self:SetColor(Color(math.random(255),math.random(255),math.random(255)))
  		end
	end
end

function ENT:OnRemove()
end

function ENT:Think()
end

if SERVER then
	function ENT:Use( act, ply )
		print(s)
	end

	net.Receive("dads_set_teleport", function(len, ply)
		local selected = net.ReadString()
		local position = net.ReadVector()

		dt = ents.Create("d_tete")

		dt:SetPos(position)

		-- Color
		do
			local found = false
	
			for k,v in pairs(LocationNames) do
				if LocationNames[k] == selected then
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

		dt:Spawn()
	end)
end
