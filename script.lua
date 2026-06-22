-- LEGNA PREMIUM HUD 😈✨

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local UIS = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

------------------------------------------------
-- ⚡ BOOST BASE
------------------------------------------------
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

------------------------------------------------
-- 🌌 SHADERS BASE (POST PROCESO)
------------------------------------------------
local function CreateShaders()

    local atm = Instance.new("Atmosphere")
    atm.Density = 0.4
    atm.Offset = 0.2
    atm.Color = Color3.fromRGB(140,180,255)
    atm.Decay = Color3.fromRGB(40,60,120)
    atm.Glare = 0.5
    atm.Haze = 2
    atm.Parent = Lighting

    local cc = Instance.new("ColorCorrectionEffect")
    cc.Contrast = 0.25
    cc.Saturation = 0.4
    cc.Brightness = 0.05
    cc.TintColor = Color3.fromRGB(180,210,255)
    cc.Parent = Lighting

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 1.4
    bloom.Size = 56
    bloom.Threshold = 0.85
    bloom.Parent = Lighting

    RunService.RenderStepped:Connect(function()
        local t = tick()
        atm.Color = Color3.fromRGB(
            120 + math.sin(t*0.2)*40,
            170 + math.sin(t*0.3)*30,
            255
        )
        cc.Contrast = 0.2 + math.sin(t*0.5)*0.1
        bloom.Intensity = 1.2 + math.sin(t*0.7)*0.2
    end)
end

------------------------------------------------
-- 🌈 AURORA MOVIMIENTO
------------------------------------------------
local function CreateAurora()

    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Size = Vector3.new(2000,1,2000)
    part.Position = Vector3.new(0,300,0)
    part.Parent = workspace

    local a0 = Instance.new("Attachment", part)
    local a1 = Instance.new("Attachment", part)

    local beam = Instance.new("Beam")
    beam.Attachment0 = a0
    beam.Attachment1 = a1
    beam.Width0 = 120
    beam.Width1 = 160
    beam.LightEmission = 1
    beam.FaceCamera = true

    beam.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,200)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,140,255))
    }

    beam.Transparency = NumberSequence.new(0.3)
    beam.Parent = part

    RunService.RenderStepped:Connect(function()
        local t = tick()
        beam.CurveSize0 = math.sin(t*0.8)*80
        beam.CurveSize1 = math.cos(t*0.6)*80
        beam.LightEmission = 0.8 + math.sin(t*1.2)*0.2
    end)
end

------------------------------------------------
-- 🕳️ AGUJERO NEGRO VIVO
------------------------------------------------
local function CreateBlackHole()

    local core = Instance.new("Part")
    core.Anchored = true
    core.Shape = Enum.PartType.Ball
    core.Material = Enum.Material.Neon
    core.Color = Color3.fromRGB(0,0,0)
    core.Size = Vector3.new(60,60,60)
    core.Position = Vector3.new(0,250,-250)
    core.Parent = workspace

    RunService.RenderStepped:Connect(function()
        local t = tick()
        core.CFrame = core.CFrame * CFrame.Angles(0,0.01,0)
        local s = 60 + math.sin(t*2)*5
        core.Size = Vector3.new(s,s,s)
    end)
end

------------------------------------------------
-- 🌌 SKY MOVIMIENTO
------------------------------------------------
local function CreateSky()

    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://159454299"
    sky.SkyboxDn = "rbxassetid://159454299"
    sky.SkyboxFt = "rbxassetid://159454299"
    sky.SkyboxLf = "rbxassetid://159454299"
    sky.SkyboxRt = "rbxassetid://159454299"
    sky.SkyboxUp = "rbxassetid://159454299"
    sky.StarCount = 4000
    sky.Parent = Lighting

    RunService.RenderStepped:Connect(function()
        Lighting.ClockTime = 14 + math.sin(tick()*0.03)*0.4
    end)
end

------------------------------------------------
-- 🚀 BOOST ULTRA LOW (OPTIMIZADO REAL)
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
-- 🎯 HUD
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
-- 📱 DRAG (TOUCH)
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
CreateShaders()
CreateAurora()
CreateBlackHole()
CreateSky()

print("😈 LEGNA PREMIUM FULL SHADER ACTIVADO")
