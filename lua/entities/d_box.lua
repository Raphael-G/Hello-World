util.AddNetworkString("kderma")
concommand.Add("killderma", function(ply)

    net.Start("kderma")
    net.Send(ply)
    
end)