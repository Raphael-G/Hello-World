
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "testes"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminSpawnable = false
ENT.Category = "Dom's Advanced Delivery system"
AddCSLuaFile()

if SERVER then
	function ENT:Initialize()
		self:SetModel("models/props_phx/construct/metal_plate1.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then phys:Wake() end
		phys:EnableMotion( false )
		self:SetUseType(SIMPLE_USE)
        self:SetColor(Color(255,0,0))
        self:SetOwner(world)
		
		local cooldown = 0
	end


	function ENT:Use( act, ply )

		cooldown = CurTime() + 2

        local a = ents.Create("dads_ballpoint")
        a:SetPos(self:GetPos()+Vector(0,0,20))
        a:Spawn()
        a:SetOwner(world)
		--if cooldown <=CurTime() then
			net.Start("dads_drawpoint")
			net.Send(ply)
		--end
	end

	function ENT:OnRemove()
        hook.Stop("HUDPaint","3d_camera_example")

	end
	
	function ENT:Think(ply)
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
