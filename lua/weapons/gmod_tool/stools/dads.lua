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

function TOOL:LeftClick(tr)
	return true
end

function TOOL:RightClick(tr)
	return true
end

function TOOL:Reload(tr)
	return true
end

function TOOL.BuildCPanel(CPanel)
	CPanel:SetName("#tool.dads.name")
	CPanel:Help("#tool.dads.desc")
end