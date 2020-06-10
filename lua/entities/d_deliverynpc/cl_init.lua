include("shared.lua")
AddCSLuaFile("configs.lua")
function ENT:Initialize()
end

--You don't need to touch anthing here, just go to autorun paste ;)
local menucooldown = 0
local comyimage = math.random(Dads.cfg.compylogos)
local jcount = 0
local jjcount = 1
net.Receive("OpenDerma", function()
    -- The menu and the deatils ;)	

	print(jjcount)

	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:Center()
	DermaPanel:SetSize( 1,1 )
	DermaPanel:SetTitle( "Testing Derma Stuff" ) 
	DermaPanel:SetVisible( true )
	DermaPanel:SetBackgroundBlur( true )
	DermaPanel:SetDraggable( true )
	DermaPanel:ShowCloseButton( true )
	DermaPanel:MakePopup()

	local Menu = vgui.Create( "DFrame" )
	Menu:SetSize( ScrW() * 0.500, ScrH() * 0.700 )
	Menu:Center()
	Menu:SetTitle( "Dom's Advanced Delivery System" ) 
	Menu:SetVisible( true ) 
	Menu:SetDraggable( false ) 
	Menu:MakePopup()
	Menu:ShowCloseButton( false )
	Menu.Paint = function( self, w, h )
		draw.RoundedBox( 10, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
	end 



	local DScrollPanel = vgui.Create( "DScrollPanel", Menu )
	DScrollPanel:Dock( FILL )

	--timer.Create()

	while jcount < jjcount do
		jcount = jcount +1
		jjcount = math.random(Dads.cfg.jobscount)
	local totalpackges = math.random(Dads.cfg.minboxes,Dads.cfg.maxboxes)
	local testloc = LocationNames[math.random(Dads.cfg.locationnames)]
	local time = 2*totalpackges // = minues
	local payperbox = math.random(Dads.cfg.minpayperbox,Dads.cfg.maxpayperbox)

		local SubMenu = DScrollPanel:Add ( "DPanel")
		SubMenu:Dock(TOP)
		SubMenu:SetSize(0,100)
		SubMenu:DockMargin(5,5,5,5)
		SubMenu.Paint = function( self, w, h )
			draw.RoundedBox( 10, 0, 0, w, h, Color( 0, 0, 0, 230 ) )
		end 
		
		local Jtext = vgui.Create( "DLabel", SubMenu )
		Jtext:SetPos(80,-50)
		Jtext:SetSize(1000,200)
		Jtext:SetText( testloc.."\n\nJob Description:\n"..jobdescs[math.random(Dads.cfg.jobdescs)].."\n\nPackges Count:"..totalpackges.."\n PayCheck: ")
		local MText = vgui.Create("DLabel", SubMenu)
		MText:SetPos(135,-11)
		MText:SetSize(1000,200)
		MText:SetTextColor( Color( 0, 255, 0) )
		MText:SetText(Dads.cfg.menus["$"]..payperbox*totalpackges)

		

		local HTML = vgui.Create("HTML", SubMenu )
		HTML:SetPos(10,20)
		HTML:SetSize(60,60)
		HTML:OpenURL(compylogos[math.random(Dads.cfg.compylogos)])
		
		local JobButton = vgui.Create("DButton", SubMenu)
		JobButton:SetText( "Get The Packges" )
		JobButton:SetSize( 100, 20 )
		JobButton:SetPos( 500,50)
		JobButton.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
		draw.RoundedBox( 10, 0, 0, w, h, Color( 255, 255, 255, 255 ) ) -- Draw a red box instead of the frame
			JobButton.DoClick = function()
				print(testloc)
				print(totalpackges)
			end
		end
	end

    -- Buttons
	local CloseButton = vgui.Create("DButton", Menu)
	CloseButton:SetText( "" )
	CloseButton:SetSize( 20, 10 )
	CloseButton:SetPos( 658, CloseButton:GetTall() - 6 )
	CloseButton.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
		draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 0, 0, 255 ) ) -- Draw a red box instead of the frame
	end 
	CloseButton.DoClick = function()
	jcount = 0
	Menu:Close()
	DermaPanel:Close()
	end

end)

function ENT:Draw()
	self:DrawModel()
	local Pos = self:GetPos()
	local Ang = self:GetAngles()
	Ang:RotateAroundAxis(Ang:Forward(), 90)
	Ang:RotateAroundAxis(Ang:Right(), 270)
	local TextAbove = Dads.cfg.menus["Delivery Man"]
	
	surface.SetFont("DermaLarge")
	local TextWidth = surface.GetTextSize(TextAbove)
	
	cam.Start3D2D(Pos - Ang:Right() * 45 + Ang:Up(), Ang, 0.16)
		draw.WordBox(0, -TextWidth*0.5 - 5, -201, TextAbove, "DermaLarge", Color(0, 0, 0, 1), Color(255,255,0,255))
	cam.End3D2D()
end