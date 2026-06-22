-- LEGNA PREMIUM HUD 😈✨

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local UIS = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

------------------------------------------------
-- ⚡ BOOST BASE INICIAL
------------------------------------------------
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

------------------------------------------------
-- 🌌 GALAXIA V2 ULTRA (SHADER VIVO)
------------------------------------------------
local function CreateGalaxyV2Ultra()

    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") then
            v:Destroy()
        end
    end

    local atm = Instance.new("Atmosphere")
    atm.Density = 0.42
    atm.Offset = 0.15
    atm.Color = Color3.fromRGB(120,170,255)
    atm.Decay = Color3.fromRGB(35,45,90)
    atm.Glare = 0.25
    atm.Haze = 2
    atm.Parent = Lighting

    local cc = Instance.new("ColorCorrectionEffect")
    cc.Saturation = 0.4
    cc.Contrast = 0.25
    cc.Brightness = 0.05
    cc.TintColor = Color3.fromRGB(190,210,255)
    cc.Parent = Lighting

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 1.2
    bloom.Size = 60
    bloom.Threshold = 0.85
    bloom.Parent = Lighting

    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://159454299"
    sky.SkyboxDn = "rbxassetid://159454299"
    sky.SkyboxFt = "rbxassetid://159454299"
    sky.SkyboxLf = "rbxassetid://159454299"
    sky.SkyboxRt = "rbxassetid://159454299"
    sky.SkyboxUp = "rbxassetid://159454299"
    sky.StarCount = 8000
    sky.Parent = Lighting

    local t = 0

    RunService.RenderStepped:Connect(function(dt)
        t += dt

        Lighting.ClockTime = 14 + math.sin(t * 0.015) * 0.8

        local pulse = (math.sin(t * 0.7) + 1) / 2

        atm.Density = 0.38 + pulse * 0.08
        atm.Glare = 0.2 + pulse * 0.25

        cc.Contrast = 0.2 + pulse * 0.15
        cc.Saturation = 0.35 + pulse * 0.15

        bloom.Intensity = 1 + pulse * 0.5
    end)
end

------------------------------------------------
-- 🌠 ESTRELLAS VIVAS
------------------------------------------------
local function CreateStarField()

    local stars = {}

    for i = 1, 80 do
        local part = Instance.new("Part")
        part.Anchored = true
        part.CanCollide = false
        part.Transparency = 1
        part.Size = Vector3.new(1,1,1)
        part.Position = Vector3.new(
            math.random(-1000,1000),
            math.random(200,600),
            math.random(-1000,1000)
        )
        part.Parent = workspace

        local light = Instance.new("PointLight")
        light.Range = 20
        light.Brightness = math.random(1,3)
        light.Color = Color3.fromRGB(200,220,255)
        light.Parent = part

        table.insert(stars, light)
    end

    RunService.RenderStepped:Connect(function()
        local t = tick()

        for _, s in ipairs(stars) do
            s.Brightness = 1 + math.sin(t) * 0.8
        end
    end)
end

------------------------------------------------
-- 🌀 PROFUNDIDAD GALÁCTICA
------------------------------------------------
local function GalaxyDepthMotion()

    RunService.RenderStepped:Connect(function()
        local t = tick()

        workspace.CurrentCamera.CFrame =
            workspace.CurrentCamera.CFrame *
            CFrame.Angles(
                math.sin(t * 0.01) * 0.0005,
                math.sin(t * 0.015) * 0.0008,
                0
            )
    end)
end

------------------------------------------------
-- 🚀 BOOST ULTRA LOW
------------------------------------------------
local function BoostUltra()

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)

    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e10
    Lighting.Brightness = 1
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0

    for _, v in ipairs(game:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = false
        elseif v:IsA("Trail") then
            v.Enabled = false
        elseif v:IsA("Smoke") or v:IsA("Fire") then
            v.Enabled = false
        elseif v:IsA("PostEffect") then
            v.Enabled = false
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
        end
        task.wait()
    end
end

------------------------------------------------
-- 🎯 HUD FPS (NO MODIFICADO)
------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LEGNA_PREMIUM"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,125,0,20)
frame.Position = UDim2.new(0,8,0,70)
frame.BackgroundTransparency = 0.25
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,6)

local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(0.82,0,1,0)
text.Position = UDim2.new(0,6,0,0)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamSemibold
text.TextXAlignment = Enum.TextXAlignment.Left

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0.18,0,1,0)
toggle.Position = UDim2.new(0.82,0,0,0)
toggle.BackgroundTransparency = 1
toggle.Text = ""

local enabled = true

toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    text.Visible = enabled
    if enabled then BoostUltra() end
end)

------------------------------------------------
-- 📱 DRAG
------------------------------------------------
local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

------------------------------------------------
-- 🌈 FPS COUNTER (EXACTO ORIGINAL)
------------------------------------------------
local hue = 0
local fps = 0
local frames = 0
local lastTime = tick()

RunService.RenderStepped:Connect(function()
frames += 1

if tick() - lastTime >= 1 then  
    fps = frames  
    frames = 0  
    lastTime = tick()  
end  

local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())  

local msColor = Color3.fromRGB(0,255,120)  
if ping > 180 then  
    msColor = Color3.fromRGB(255,60,60)  
elseif ping > 100 then  
    msColor = Color3.fromRGB(255,170,60)  
end  

hue = (hue + 0.008) % 1  
local rgb = Color3.fromHSV(hue,1,1)  

text.RichText = true  
text.Text =
    "<font color='rgb("..
    math.floor(rgb.R*255)..","..
    math.floor(rgb.G*255)..","..
    math.floor(rgb.B*255)..")'>L</font> "..
    "<font color='rgb(255,255,255)'>"..fps.." FPS</font> | "..
    "<font color='rgb("..
    math.floor(msColor.R*255)..","..
    math.floor(msColor.G*255)..","..
    math.floor(msColor.B*255)..")'>"..
    ping.." MS</font>"
end)

------------------------------------------------
-- 🚀 INIT
------------------------------------------------
CreateGalaxyV2Ultra()
CreateStarField()
GalaxyDepthMotion()

print("😈 LEGNA GALAXIA V2 ULTRA ACTIVADA")
