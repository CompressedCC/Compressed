
local TweenService = game:GetService("TweenService")
local Players       = game:GetService("Players")
local Lighting      = game:GetService("Lighting")

local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")

local blur = Instance.new("BlurEffect")
blur.Name       = "IntroBlur"
blur.Size       = 0
blur.Parent     = Lighting


local screenGui = Instance.new("ScreenGui")
screenGui.Name     = "IntroGui"
screenGui.ResetOnSpawn = false
screenGui.Parent   = playerGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name         = "IntroImage"
imageLabel.Size         = UDim2.new(1,0,1,0)
imageLabel.Position     = UDim2.new(0,0,0,0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image        = "rbxassetid://10932908023"   
imageLabel.ImageTransparency = 1 
imageLabel.Parent       = screenGui


local BLUR_IN_TIME    = 5      
local IMAGE_FADE_TIME = 1      
local IMAGE_DISPLAY   = 4      
local BLUR_OUT_TIME   = 2      
local TARGET_BLUR_SIZE = 24   


local function tween(instance, props, time)
    local info = TweenInfo.new(time, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    return TweenService:Create(instance, info, props)
end


spawn(function()
if not Compressed.Main.Intro then return end
    tween(blur, { Size = TARGET_BLUR_SIZE }, BLUR_IN_TIME):Play()
    task.wait(BLUR_IN_TIME)


    tween(imageLabel, { ImageTransparency = 0 }, IMAGE_FADE_TIME):Play()
    task.wait(IMAGE_FADE_TIME)


    task.wait(IMAGE_DISPLAY)


    tween(imageLabel, { ImageTransparency = 1 }, IMAGE_FADE_TIME):Play()
    task.wait(IMAGE_FADE_TIME)


    tween(blur, { Size = 0 }, BLUR_OUT_TIME):Play()
    task.wait(BLUR_OUT_TIME)

  
    screenGui:Destroy()
    blur:Destroy()
end)
