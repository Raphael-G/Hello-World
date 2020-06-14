 --cl_init

include("shared.lua")
ENT.RenderGroup = RENDERGROUP_BOTH
surface.CreateFont( "DadsFontDPoint", {
	font = "Tahoma",
	extended = true,
	size = 30,
	weight = 900,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})
function ENT:Initialize()
end
function ENT:Draw()
hook.Add( "HUDPaint", "ToScreenExample", function()	
	local points = ents.FindByClass( "dads_ballpoint" )

	for id, ent in pairs( points ) do

		local point = ent:GetPos() + ent:OBBCenter()
		local data2D = point:ToScreen() 

		if ( not data2D.visible ) then continue end

		local triangle = {
			{ x = data2D.x - 40, y = data2D.y + 10 },
			{ x = data2D.x - 0, y = data2D.y - 60 },
			{ x = data2D.x + 40, y = data2D.y + 10}
		}

		surface.SetDrawColor( 255, 0, 0, 255 )
		draw.NoTexture()
		surface.DrawPoly( triangle )
		draw.SimpleText( "Delivery Point", "DadsFontDPoint", data2D.x, data2D.y-70, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )

	end

end )
end

function ENT:DrawTranslucent()
	self:Draw()
end

