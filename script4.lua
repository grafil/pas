elseif game.PlaceId == 662417684 then

    lib:SetTitle("Z.hub Lucky blocks battlegrounds")

    local main = lib:NewTab("Main", "The main page is here!")

    main:NewButton("Spawn Lucky block",function()
        game:GetService("ReplicatedStorage").SpawnLuckyBlock:FireServer()
    end)

    main:NewButton("Spawn Super block",function()
        game:GetService("ReplicatedStorage").SpawnSuperBlock:FireServer()
    end)

    main:NewButton("Spawn Galaxy block",function()
        game:GetService("ReplicatedStorage").SpawnGalaxyBlock:FireServer()
    end)

    main:NewButton("Spawn Rainbow block",function()
        game:GetService("ReplicatedStorage").SpawnRainbowBlock:FireServer()
    end)

    main:NewButton("Kill all (requires Hex Spitter item! AND EQUIP IT!)", function()
        local HexSpitter = game.Players.LocalPlayer.Character.HexSpitter
		local ServerControl = HexSpitter.Remotes.ServerControl
		for _ = 1,20 do
			for _, Child in next, game.Players:GetPlayers() do
				if Child ~= game.Players.LocalPlayer then
					ServerControl:InvokeServer('RayHit', {['Position'] = Vector3.new(0, 0, 0), ["Hit"] = Child.Character.Head})
				end
			end
		end

    end)

    local Teleports = lib:NewTab("Teleports", "You can find teleports here!")

    Teleports:NewButton("TP to base",function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Spawn.Value
    end)


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

    local visual = lib:NewTab("Visuals", "Find all visual effects here.")

    getgenv().chams = false

    visual:NewButton("Chams",function()
        getgenv().chams = true
        if getgenv().chams == true then
            function CreateSG(name,parent,face)
                local SurfaceGui = Instance.new("SurfaceGui",parent)
                SurfaceGui.Parent = parent
                SurfaceGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                SurfaceGui.Face = Enum.NormalId[face]
                SurfaceGui.LightInfluence = 0
                SurfaceGui.ResetOnSpawn = false
                SurfaceGui.Name = name
                SurfaceGui.AlwaysOnTop = true
                local Frame = Instance.new("Frame",SurfaceGui)
                Frame.BackgroundColor3 = Color3.fromRGB(85, 170, 255)
                Frame.Size = UDim2.new(1,0,1,0)
            end
            
            while wait(1) do
            for i,v in pairs (game:GetService("Players"):GetPlayers()) do
                if v ~= game:GetService("Players").LocalPlayer and v.Character ~= nil and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("cham") == nil then
                    for i,v in pairs (v.Character:GetChildren()) do
                    if v:IsA("MeshPart") or v.Name == "Head" then
                    CreateSG("cham",v,"Back")
                    CreateSG("cham",v,"Front")
                    CreateSG("cham",v,"Left")
                    CreateSG("cham",v,"Right")
                    CreateSG("cham",v,"Right")
                    CreateSG("cham",v,"Top")
                    CreateSG("cham",v,"Bottom")
                    end
                    end
                end
            end
            end
        end
    end)

    visual:NewButton("Full bright, not toggleable sorry!",function()
        if not _G.FullBrightExecuted then

            _G.FullBrightEnabled = false
        
            _G.NormalLightingSettings = {
                Brightness = game:GetService("Lighting").Brightness,
                ClockTime = game:GetService("Lighting").ClockTime,
                FogEnd = game:GetService("Lighting").FogEnd,
                GlobalShadows = game:GetService("Lighting").GlobalShadows,
                Ambient = game:GetService("Lighting").Ambient
            }
        
            game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                    _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Brightness = 1
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                    _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").ClockTime = 12
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                    _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").FogEnd = 786543
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                    _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").GlobalShadows = false
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                    _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                end
            end)
        
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 786543
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
        
            local LatestValue = true
            spawn(function()
                repeat
                    wait()
                until _G.FullBrightEnabled
                while wait() do
                    if _G.FullBrightEnabled ~= LatestValue then
                        if not _G.FullBrightEnabled then
                            game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                            game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                            game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                            game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                            game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                        else
                            game:GetService("Lighting").Brightness = 1
                            game:GetService("Lighting").ClockTime = 12
                            game:GetService("Lighting").FogEnd = 786543
                            game:GetService("Lighting").GlobalShadows = false
                            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                        end
                        LatestValue = not LatestValue
                    end
                end
            end)
        end
        
        _G.FullBrightExecuted = true
        _G.FullBrightEnabled = not _G.FullBrightEnabled
    end)

    local scripthub = lib:NewTab("Script hub", "You can find alot of other scripts here!")

    scripthub:NewButton("Open infinite yield",function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end)

    scripthub:NewButton("Chat spoofer",function()
        loadstring(game:HttpGet(('https://pastebin.com/raw/djBfk8Li'),true))()
    end)
    
    local other = lib:NewTab("Supported games", "See what games are supported!")
    
    other:NewButton("Tapping simulator",function()
        print("Click")
    end)

    other:NewButton("Speed Run Simulator",function()
        print("Click")
    end)
    
    other:NewButton("Race clicker",function()
        print("Click")
    end)

    other:NewButton("Lucky blocks battlegrounds",function()
        print("Click")
    end)

    other:NewButton("More games supported soon!",function()
        print("Click")
    end)
end
