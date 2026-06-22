-- LEGNA PREMIUM HUD 😈✨

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local UIS = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

----------------------------------------------------
-- 🔥 BOOST BASE
----------------------------------------------------
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

----------------------------------------------------
-- 🌌 GALAXY LOADING (VISIBLE FIX)
----------------------------------------------------
local function ShowLoadingScreen()

    local gui = Instance.new("ScreenGui")
    gui.Name = "LEGNA_LOADING"
    gui.IgnoreGuiInset = true
    gui.Parent = game.CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(5,0,15)
    frame.Parent = gui

    -- 🌌 galaxia REAL visible
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40,0,70)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,20,120)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(120,0,180))
    }
    gradient.Rotation = 0
    gradient.Parent = frame

    -- 🌠 partículas falsas galaxia (ESTO ES LO QUE TE FALTABA)
    for i = 1, 30 do
        local star = Instance.new("Frame")
        star.Size = UDim2.new(0, math.random(2,4), 0, math.random(2,4))
        star.Position = UDim2.new(math.random(),0,math.random(),0)
        star.BackgroundColor3 = Color3.fromRGB(255,255,255)
        star.BackgroundTransparency = 0.6
        star.BorderSizePixel = 0
        star.Parent = frame

        local c = Instance.new("UICorner")
        c.CornerRadius = UDim.new(1,0)
        c.Parent = star
    end

    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,0,100)
    text.Position = UDim2.new(0,0,0.4,0)
    text.BackgroundTransparency = 1
    text.Text = "LEGNA BOOST INITIALIZING"
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Font = Enum.Font.GothamBold
    text.TextScaled = true
    text.Parent = frame

    local percent = Instance.new("TextLabel")
    percent.Size = UDim2.new(1,0,0,60)
    percent.Position = UDim2.new(0,0,0.5,0)
    percent.BackgroundTransparency = 1
    percent.Text = "0%"
    percent.TextColor3 = Color3.fromRGB(180,140,255)
    percent.Font = Enum.Font.GothamBlack
    percent.TextScaled = true
    percent.Parent = frame

    -- 🔊 sonido
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://9118823100"
    sound.Volume = 1
    sound.Looped = true
    sound.Parent = SoundService
    sound:Play()

    local running = true

    -- 🌌 animación galaxia
    task.spawn(function()
        while running do
            gradient.Rotation += 0.7
            task.wait(0.02)
        end
    end)

    -- 📊 7 segundos exactos
    task.spawn(function()
        for i = 0, 100 do
            percent.Text = i .. "%"
            task.wait(7/100)
        end

        running = false
        sound:Stop()
        gui:Destroy()
    end)
end

----------------------------------------------------
-- 🚀 BOOSTER ORIGINAL (REPARADO)
----------------------------------------------------
local function BoostUltra()

    for _, v in ipairs(workspace:GetDescendants()) do

        if v:IsA("ParticleEmitter") then
            v.Rate = 0

        elseif v:IsA("Trail") then
            v.Enabled = false

        elseif v:IsA("Smoke") or v:IsA("Fire") then
            v.Enabled = false

        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 0.7
        end
    end
end

----------------------------------------------------
-- 🎮 HUD MOVIBLE + FPS ORIGINAL
----------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LEGNA_PREMIUM"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 140, 0, 25)
frame.Position = UDim2.new(0, 10, 0, 80)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BackgroundTransparency = 0.25

Instance.new("UICorner", frame)

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1,0,1,0)
text.BackgroundTransparency = 1
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.TextColor3 = Color3.fromRGB(255,255,255)

----------------------------------------------------
-- 🖱 DRAG FIX REAL
----------------------------------------------------
local dragging = false
local dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

frame.InputEnded:Connect(function()
    dragging = false
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

----------------------------------------------------
-- 📊 FPS REAL
----------------------------------------------------
local fps, frames, last = 0, 0, tick()

RunService.RenderStepped:Connect(function()

    frames += 1

    if tick() - last >= 1 then
        fps = frames
        frames = 0
        last = tick()
    end

    text.Text = "FPS: " .. fps
end)

----------------------------------------------------
-- 🔘 BOTÓN
----------------------------------------------------
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,140,0,25)
toggle.Position = UDim2.new(0,10,0,110)
toggle.Text = "ACTIVAR BOOST"

toggle.MouseButton1Click:Connect(function()
    ShowLoadingScreen()
    task.wait(7)
    BoostUltra()
end)

print("😈 LEGNA FIXED PREMIUM READY")
