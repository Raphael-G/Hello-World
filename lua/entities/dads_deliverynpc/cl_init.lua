include("shared.lua")
AddCSLuaFile("configs.lua")

function ENT:Initialize()
end

--You don't need to touch anthing here, just go to autorun paste ;)
local menucooldown = 0
local comyimage = math.random(Dads.cfg.compylogos)
local jcount = 0
local jjcount = 1

surface.CreateFont( "DadsFont", {
	font = "Rastafari",
	extended = true,
	size = 12,
	weight = 560,
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
net.Receive("dads.openderma", function()
    -- The menu and the deatils ;)	

	print(jjcount)

		local DDmenu = vgui.Create ( "DFrame")
		DDmenu:SetSize( ScrW() * 0.620, ScrH() * 0.720 )
		DDmenu:SetPos(260,115)
		DDmenu:SetTitle( "" ) 
		DDmenu:SetVisible( true ) 
		DDmenu:SetDraggable( false ) 
		DDmenu:ShowCloseButton( false )
		DDmenu.Paint = function( self, w, h )
			draw.RoundedBox( 10, 0, 0, w, h, Color( 30, 31, 38, 255 ) )
		end 

	local Menu = vgui.Create( "DFrame" )
		Menu:SetSize( ScrW() * 0.600, ScrH() * 0.700 )
		Menu:Center()
		Menu:SetTitle( "" ) 
		Menu:SetVisible( true ) 
		Menu:SetDraggable( false ) 
		Menu:MakePopup()
		Menu:ShowCloseButton( false )
		Menu.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 40, 54, 85, 255 ) )
		end 

		local Dmenu = Menu:Add ( "DPanel", Menu)
			Dmenu:SetPos(0,0)
			Dmenu:SetSize(1000,15)
			Dmenu.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, Color( 30, 31, 38, 255 ) )
		end 

	local DScrollPanel = vgui.Create( "DScrollPanel", Menu )
		DScrollPanel:Dock( FILL )

	while jcount < jjcount do
		jcount = jcount +1
		jjcount = math.random(Dads.cfg.jobscount)

		local totalpackges = math.random(Dads.cfg.minboxes,Dads.cfg.maxboxes)
		local testloc = LocationNames[math.random(Dads.cfg.locationnames)]
		local time = 2*totalpackges // = minues
		local payperbox = math.random(Dads.cfg.minpayperbox,Dads.cfg.maxpayperbox)

		local SubMenu = DScrollPanel:Add ( "DPanel", Menu)
			SubMenu:Dock(TOP)
			SubMenu:SetSize(0,100)
			SubMenu:DockMargin(5,5,5,5)
			SubMenu.Paint = function( self, w, h )
				draw.RoundedBox( 0, 0, 0, w, h, Color( 77, 100, 141, 60 ) )
			end 
		
		local Jtext = vgui.Create( "DLabel", SubMenu )
			Jtext:SetPos(80,-50)
			Jtext:SetFont("DadsFont")
			Jtext:SetSize(1000,200)
			Jtext:SetTextColor(Color(208, 225, 249))
			Jtext:SetText( testloc.."\n\nJob Description:\n"..jobdescs[math.random(Dads.cfg.jobdescs)].."\n\nPackges Count:"..totalpackges.."\nPayCheck: ")

		local MText = vgui.Create("DLabel", SubMenu)
			MText:SetPos(140,-14)
			MText:SetSize(1000,200)
			MText:SetTextColor( Color( 0, 255, 0) )
			MText:SetText(Dads.cfg.menus["$"]..payperbox*totalpackges)

		local HTML = vgui.Create("HTML", SubMenu )
			HTML:SetPos(10,20)
			HTML:SetSize(60,60)
			HTML:OpenURL(compylogos[math.random(Dads.cfg.compylogos)])
		
		local JobButton = vgui.Create("DButton", SubMenu)
			JobButton:SetText( "Get The It" )
			JobButton:SetTextColor(Color(221, 221, 221))
			JobButton:SetFont("HudHintTextLarge")
			JobButton:SetSize( 100, 20 )
			JobButton:SetPos( 670,50)
			JobButton.Paint = function( self, w, h )
			draw.RoundedBox( 0, 0, 0, w, h, Color( 77, 100, 141, 255 ) ) 
				JobButton.DoClick = function()
					net.Start("dads.values")
						jcount = 0
						Menu:Close()
						DDmenu:Close()
						net.WriteString(testloc)
						net.WriteString(totalpackges)
						net.WriteString(payperbox*totalpackges)
					net.SendToServer()
				end
			end
	end
    -- Buttons
	local CloseButton = vgui.Create("DButton", DDmenu)
		CloseButton:SetText( "" )
		CloseButton:SetSize( 6, 60 )
		CloseButton:SetPos( 836, DDmenu:GetTall() - 295 )
		CloseButton.Paint = function( self, w, h )
			draw.RoundedBox( 20, 0, 0, w, h, Color( 221, 221, 221, 255 ) )
		end 
		CloseButton.DoClick = function()
			jcount = 0
			Menu:Close()
			DDmenu:Close()
		end
end)

function ENT:Draw()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
		Ang:RotateAroundAxis(Ang:Forward(), 90)
		Ang:RotateAroundAxis(Ang:Right(), 270)
	local TextAbove = Dads.cfg.menus["Delivery Man"]
	local TextWidth = surface.GetTextSize(TextAbove)

	surface.SetFont("DermaLarge")

	cam.Start3D2D(Pos - Ang:Right() * 45 + Ang:Up(), Ang, 0.16)
		draw.WordBox(0, -TextWidth*0.5 - 5, -201, TextAbove, "DermaLarge", Color(0, 0, 0, 1), Color(255,255,0,255))
	cam.End3D2D()

	self:DrawModel()
end