if game.PlaceId == 9498006165 then

    lib:SetTitle("Z.hub Tapping Simulator")

    getgenv().autoTap = false;
    getgenv().autoRebirth = false; 
    
    local tab1 = lib:NewTab("Farming", "This is the auto farming tab.")

    tab1:NewToggle("Auto Tap",false,function(value)
        getgenv().autoTap = value
        print("AutoTap is:", value)
        if value == true then
            doTap()
        end
    end)

    function doTap()
        spawn(function() -- spawns a function (is usefull to run both blocks of code)
            while getgenv().autoTap == true do
                game:GetService("ReplicatedStorage").Events.Tap:FireServer()
                wait()
            end
        end)
    end 

    tab1:NewToggle("Auto Rebirth",false,function(value)
        getgenv().autoRebirth = value
        print("AutoRebirth is:", value)
        if value == true then
            doRebirth()
        end
    end)
    
    function doRebirth()
        spawn(function() -- spawns a function (is usefull to run both blocks of code)
            while getgenv().autoRebirth == true do
                local args = {[1] = 1}
                game:GetService("ReplicatedStorage").Events.Rebirth:FireServer(unpack(args))
                wait(0.1) 
            end
        end)
    end 

    local tab2 = lib:NewTab("Teleports", "Teleports are here.")

    tab2:NewButton("Teleport Forest Island",function()
        teleportForest()
    end)

    tab2:NewButton("Teleport Flower Island",function()
        teleportFlower()
    end)

    tab2:NewButton("Teleport Swamp Island",function()
        teleportSwamp()
    end)

    tab2:NewButton("Teleport Snow Island",function()
        teleportSnow()
    end)

    tab2:NewButton("Teleport Desert Island",function()
        teleportDesert()
    end)

    tab2:NewButton("Teleport to Death Island",function()
        teleportDeath()
    end)

    tab2:NewButton("Teleport to Beach Island",function()
        teleportBeach()
    end)

    tab2:NewButton("Teleport to Mine Island",function()
        teleportMine()
    end)

    tab2:NewButton("Teleport to Cloud Island",function()
        teleportCloud()
    end)

    tab2:NewButton("Teleport to Coral Island",function()
        teleportCoral()
    end)

    tab2:NewButton("Teleport to Darkheat Island (HIGHEST)",function()
        teleportDarkheat()
    end)

    function teleportForest()
        local args = {[1] = CFrame.new(-163.98446655273438, 987.5964965820312, -403.33941650390625) * CFrame.Angles(-0, 0, -0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args)) 
    end

    function teleportFlower()
        local args = {[1] = CFrame.new(-179.51564025878906, 1524.6309814453125, -682.4987182617188) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end


    function teleportSwamp()
        local args = {[1] = CFrame.new(-264.35888671875, 2123.06298828125, -694.6613159179688) * CFrame.Angles(3.1415927410125732, -0, -3.1415927410125732)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportSnow()
        local args = {[1] = CFrame.new(-201.77197265625, 2944.481689453125, -470.40875244140625) * CFrame.Angles(0, 1.5707963705062866, 0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportDesert()
        local args = {[1] = CFrame.new(-166.28515625, 4235.38916015625, -779.1531372070312) * CFrame.Angles(0, 1.5707963705062866, 0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportDeath()
        local args = {[1] = CFrame.new(-276.2012634277344, 5425.62158203125, -480.28778076171875) * CFrame.Angles(0, 1.5707963705062866, 0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportBeach()    
        local args = {[1] = CFrame.new(-140.3450927734375, 6881.630859375, -495.68212890625) * CFrame.Angles(0, 1.5707963705062866, 0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportMine()
        local args = {[1] = CFrame.new(-243.2586669921875, 8376.5166015625, -483.8897705078125) * CFrame.Angles(0, 1.5707963705062866, 0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportCloud()
        local args = {[1] = CFrame.new(-253.30348205566406, 11262.8818359375, -237.8885955810547) * CFrame.Angles(0, 1.5707963705062866, 0)} 
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportCoral()
        local args = {[1] = CFrame.new(-511.0211181640625, 13812.0322265625, -543.2418212890625) * CFrame.Angles(-0, -1.5707963705062866, 0)}
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    function teleportDarkheat()
        local args = {[1] = CFrame.new(-408.697509765625, 17180.138671875, -552.0464477539062) * CFrame.Angles(0, 1.5707963705062866, 0)}   
        game:GetService("ReplicatedStorage").Events.Teleport:FireServer(unpack(args))
    end

    local Character = lib:NewTab("Character", "In here there are character options")

    Character:NewSlider("Jumppower",50,750,50,function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value 
    end)

    Character:NewSlider("Walkspeed",50,750,50,function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value 
    end)

    Character:NewButton("Infinite jump (f to toggle)",function()
        getgenv().infinjump = true

        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        Mouse.KeyDown:connect(function(k)
        if getgenv().infinjump then
        if k:byte() == 32 then
        Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        Humanoid:ChangeState("Jumping")
        wait(0.1)
        Humanoid:ChangeState("Seated")
        end
        end
        end)

        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        Mouse.KeyDown:connect(function(k)
        k = k:lower()
        if k == "f" then
        if getgenv().infinjump == true then
        getgenv().infinjump = false
        else
        getgenv().infinjump = true
        end
        end
        end)
    end)

    Character:NewButton("Fly (BETA, x to toggle)",function()
            repeat wait() 
            until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
        local mouse = game.Players.LocalPlayer:GetMouse() 
        repeat wait() until mouse
        local plr = game.Players.LocalPlayer 
        local torso = plr.Character.Head 
        local flying = false
        local deb = true 
        local ctrl = {f = 0, b = 0, l = 0, r = 0} 
        local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        local maxspeed = 400 
        local speed = 5000 
        
        function Fly() 
        local bg = Instance.new("BodyGyro", torso) 
        bg.P = 9e4 
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
        bg.cframe = torso.CFrame 
        local bv = Instance.new("BodyVelocity", torso) 
        bv.velocity = Vector3.new(0,0.1,0) 
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        repeat wait() 
        plr.Character.Humanoid.PlatformStand = true 
        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
        speed = speed+.5+(speed/maxspeed) 
        if speed > maxspeed then 
        speed = maxspeed 
        end 
        elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
        speed = speed-1 
        if speed < 0 then 
        speed = 0 
        end 
        end 
        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
        lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
        elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
        bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
        else 
        bv.velocity = Vector3.new(0,0.1,0) 
        end 
        bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
        until not flying 
        ctrl = {f = 0, b = 0, l = 0, r = 0} 
        lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        speed = 0 
        bg:Destroy() 
        bv:Destroy() 
        plr.Character.Humanoid.PlatformStand = false 
        end 
        mouse.KeyDown:connect(function(key) 
        if key:lower() == "x" then 
        if flying then flying = false 
        else 
        flying = true 
        Fly() 
        end 
        elseif key:lower() == "w" then 
        ctrl.f = 1 
        elseif key:lower() == "s" then 
        ctrl.b = -1 
        elseif key:lower() == "a" then 
        ctrl.l = -1 
        elseif key:lower() == "d" then 
        ctrl.r = 1 
        end 
        end) 
        mouse.KeyUp:connect(function(key) 
        if key:lower() == "w" then 
        ctrl.f = 0 
        elseif key:lower() == "s" then 
        ctrl.b = 0 
        elseif key:lower() == "a" then 
        ctrl.l = 0 
        elseif key:lower() == "d" then 
        ctrl.r = 0 
        end 
        end)
        Fly()
    end)
   
    local scripthub = lib:NewTab("Script hub", "You can find other scripts here!")

    scripthub:NewButton("Open infinite yield",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    scripthub:NewButton("Chat spoofer",function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
    end)

    local other = lib:NewTab("Supported games", "Here are the supported games!")
    
    other:NewButton("Tapping simulator",function()
        print("Click")
    end)

    other:NewButton("Speed Run Simulator",function()
        print("Click")
    end)

    other:NewButton("Race Clicker",function()
        print("Click")
    end)

    other:NewButton("Lucky blocks battlegrounds",function()
        print("Click")
    end)

    other:NewButton("More games supported soon!",function()
        print("Click")
    end)
