TOOL.Category = "Dom's Adv. Delivery Sys."
TOOL.Name = "#tool.dads.name"
TOOL.Command = nil
TOOL.ConfigName	= ""
TOOL.Information = {
	{ name = "left" },
	{ name = "right" },
	{ name = "reload" }
}

if CLIENT then
	language.Add( "Tool.dads.name", "Dom's Advanced Delivery System" )
	language.Add( "Tool.dads.desc", "Some configs ;)" )
	language.Add( "Tool.dads.left", "Set The delivery points" )
	language.Add( "tool.dads.right", "Copy")
	language.Add( "tool.dads.reload", "Remove")
	language.Add( "Undone_dom", "Undone Stacked Prop(s)" )
end

function TOOL:DrawHUD(tr)
    local tr = LocalPlayer():GetEyeTrace()
    return true
end

function TOOL:LeftClick(tr)

	rc = ents.Create("d_tete")
	rc:SetPos(tr.HitPos)
	rc:Spawn()
	rc:SetMaterial("models/wireframe")
	rc:SetColor(Color(255,0,0))

	return true
end

function TOOL:RightClick(tr)

	print(tr.Entity)

	tr.Entity:Remove()
	return true
end

function TOOL:Reload(tr)
	return true
end

function TOOL:UpdateGhost(ent, ply)
	if ! IsValid(ent) then return end
	local trace = ply:GetEyeTrace()

	if ! trace.Hit || IsValid(trace.Entity) then
		ent:SetNoDraw( true )

		return
	end

	local min = ent:OBBMins()
	local ang = trace.HitNormal:Angle()
		ang.pitch = ang.pitch + 90

	ent:SetPos(trace.HitPos - trace.HitNormal * min.z)
	ent:SetAngles(ang)
	ent:SetNoDraw(false)
end

function TOOL:Think()
	if !IsValid(self.GhostEntity) then
		self:MakeGhostEntity("models/props_phx/construct/metal_plate1.mdl", Vector( 0, 0, 0 ), Angle( 0, 0, 0 ))
	end

	self:UpdateGhost(self.GhostEntity, self:GetOwner())
end

function TOOL.BuildCPanel(CPanel)
	CPanel:SetName("#tool.dads.name")
	CPanel:Help("#tool.dads.desc")

	local options = {}

	for k,v in pairs(LocationNames) do
		options[v] = { v }
	end

	local panel = CPanel:AddControl("ComboBox", {
        Label = "Locations",
        MenuButton = 0,
        Options = options
    })

	panel.OnSelect = function(self, index, text, data)
        for k,v in pairs(data) do
			net.Start("dads_loc")
				net.WriteString(v)
			net.SendToServer()
        end

		if options == nil then
			print("Please select a location")
		else 
			print(v)
		end	

    end
end