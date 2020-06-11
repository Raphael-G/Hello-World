
ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "teste"
ENT.Author = "Dom"
ENT.Spawnable = true
ENT.AdminOnly = false
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.Category = "Dom's Advanced Delivery system"
AddCSLuaFile()

function ENT:Initialize()
    self:SetModel("models/Combine_Helicopter/helicopter_bomb01.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    local phys = self:GetPhysicsObject()
    if phys:IsValid() then phys:Wake() end
    phys:EnableMotion( false )

    if SERVER then
        self:SetUseType(SIMPLE_USE)
    else
        hook.Add( "PreDrawHalos", "AddPropHalos" .. tostring(self), function()
            halo.Add( { self } , Color( 255, 0, 0, 255 ), 5, 5, 5,true,true )
        end )
    end
end

if SERVER then

    function ENT:Use( act, ply )
		print(s)
	end

	function ENT:OnRemove()
	end
	
	function ENT:Think()
	end

end

if CLIENT then

    local matBall = Material( "sprites/sent_ball" )

    function ENT:Draw()

        render.SetMaterial( matBall )

        local pos = self:GetPos()
        local lcolor = render.ComputeLighting( pos, Vector( 0, 1, 1 ) )
        local c = (Color(255,0,0))

        lcolor.x = c.r * ( math.Clamp( lcolor.x, 0, 1 ) + 0.5 ) * 255
        lcolor.y = c.g * ( math.Clamp( lcolor.y, 0, 1 ) + 0.5 ) * 255
        lcolor.z = c.b * ( math.Clamp( lcolor.z, 0, 1 ) + 0.5 ) * 255

        local size = math.Clamp( 10, 4, 20 )
        render.DrawSprite( pos, size, size, Color( lcolor.x, lcolor.y, lcolor.z, 255 ) )
    end

end