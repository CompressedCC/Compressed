local toggle224 = Compressed.SilentAim.Settings.AntiAimViewer 


local China = setmetatable({}, {
    __index = function(Company, Price)
        return game:GetService(Price)
    end
})

local Players = China.Players
local ReplicatedStorage = China.ReplicatedStorage


local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local MainEvent = ReplicatedStorage:FindFirstChild("MainEvent") or nil
local Tool = nil


local function Bypass(Entity)
    if not toggle224 and not  game.PlaceId ~= 2788229376 then return end

    Entity.ChildAdded:Connect(function(Child)
        if Child:IsA("Tool") then
            Tool = Child.Activated:Connect(function()
                if MainEvent then
                    MainEvent:FireServer("UpdateMousePos", Mouse.Hit.Position)
                end
            end)
        end
    end)
end

local function Alive(Player)
    return Player and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Head") or false
end

LocalPlayer.CharacterAdded:Connect(function(Character)
    if toggle224 and not  game.PlaceId ~= 2788229376 then
        Bypass(Character)
    end
end)

if Alive(LocalPlayer) then
    LocalPlayer.Character.Humanoid:UnequipTools()
    if toggle224 and not  game.PlaceId ~= 2788229376  then
        Bypass(LocalPlayer.Character)
    end
end


local Hook
Hook = hookmetamethod(game, "__namecall", LPH_NO_VIRTUALIZE(function(self, ...)
    local Args = {...}
    local Method = getnamecallmethod()

    if toggle224 and not  game.PlaceId ~= 2788229376 and not checkcaller() and Method == "FireServer" and self.Name == "MainEvent" and Args[1] == "UpdateMousePos" then
        Args[2] = Mouse.Hit.Position
        return self.FireServer(self, unpack(Args))
    end

    return Hook(self, ...)
end))
