Dads = Dads or {}
Dads.cfg = {}
-- // Configs \\
Dads.cfg.minboxes = 1
Dads.cfg.maxboxes = 15
Dads.cfg.minjobs = 3
Dads.cfg.maxjobs = 7
Dads.cfg.jobscount = 20
Dads.cfg.minpayperbox = 120
Dads.cfg.maxpayperbox = 400
Dads.cfg.menucooldown = 120

compylogos = { -- the order dosen't metter
    "https://i.imgur.com/p6ERxu0.png",
    "https://i.imgur.com/S8p43LU.png",
    "https://i.imgur.com/XGc4ID4.png",
    "https://i.imgur.com/QSIDSYm.png"
}

-- Translates start in the line , if configs dosen't metter jusd to CTRL + F and search for translate

-- LocationNames[line] for LocationNames[line]
-- If the association is nil, LocationNames[1] will be used
teleportColors = {
    Color(255,0,0), -- Red
    Color(0,255,0) -- Blue
}

-- // translate \\
LocationNames = {
    "Brooklyn",
    "Flatwood hiils condom",
    "Insdustrial area",
    "Xalalau's neighborhood",
    "Lagoon neighborhood"
}

jobdescs = {
    "Jus go the local and delivery the boxes",                                            
    "They need this for yesterday ",
    "May be a little heavy",
    "Fragille packge, take care!",
    "Some mechanic parts",
    "Put carefuly on the ground, or it may explodes",
     "Some braziliam food",
    "I realy don't now what feijao minds, but you have to delivery it",
     "Normal job, get in front of the place and kick the box to the door",
    "Delivery it in the next hours"
}

Dads.cfg.menus = {
    ["$"] = "$",
    ["Delivery Man"] = "Delivery Man",
    ["PayCheck"] = "PayCheck",
    ["Job Description"] = "Job Description",
    ["Time to complete the job"] = "Time to Complete the Job"
}

Dads.cfg.compylogos = #compylogos
Dads.cfg.locationnames = #LocationNames
Dads.cfg.jobdescs = #jobdescs