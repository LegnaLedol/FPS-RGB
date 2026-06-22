-- LEGNA PREMIUM HUD 😈✨

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local UIS = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

------------------------------------------------
-- ⚡ BOOST BASE (inicio suave)
------------------------------------------------
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

------------------------------------------------
-- 🌌 SKY PREMIUM (AURORA + GALAXIA + ATMOSPHERE)
------------------------------------------------
local function CreateSky()

    local atm = Instance.new("Atmosphere")
    atm.Density = 0.35
    atm.Color = Color3.fromRGB(120,180,255)
    atm.Decay = Color3.fromRGB(60,60,120)
    atm.Glare = 0.6
    atm.Haze = 1
    atm.Parent = Lighting

    local cc = Instance.new("ColorCorrectionEffect")
    cc.Contrast = 0.25
    cc.Saturation = 0.4
    cc.TintColor = Color3.fromRGB(180,200,255)
    cc.Parent = Lighting

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 1.2
    bloom.Size = 56
    bloom.Threshold = 0.8
    bloom.Parent = Lighting

    local sky = Instance.new("Sky")
    sky.SkyboxBk = "rbxassetid://159454299"
    sky.SkyboxDn = "rbxassetid://159454299"
    sky.SkyboxFt = "rbxassetid://159454299"
    sky.SkyboxLf = "rbxassetid://159454299"
    sky.SkyboxRt = "rbxassetid://159454299"
    sky.SkyboxUp = "rbxassetid://159454299"
    sky.StarCount = 5000
    sky.Parent = Lighting
end

------------------------------------------------
-- 🌈 AURORA BOREAL
------------------------------------------------
local function CreateAurora()

    local part = Instance.new("Part")
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.Size = Vector3.new(1000,1,1000)
    part.Position = Vector3.new(0,300,0)
    part.Parent = workspace

    local beam = Instance.new("Beam")
    local a0 = Instance.new("Attachment", part)
    local a1 = Instance.new("Attachment", part)

    a0.Position = Vector3.new(-500,0,0)
    a1.Position = Vector3.new(500,0,0)

    beam.Attachment0 = a0
    beam.Attachment1 = a1
    beam.Width0 = 80
    beam.Width1 = 120
    beam.LightEmission = 1
    beam.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,180)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(120,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,150,255))
    }
    beam.Transparency = NumberSequence.new(0.3)
    beam.Parent = part

    RunService.RenderStepped:Connect(function()
        beam.CurveSize0 = math.sin(tick()) * 50
        beam.CurveSize1 = math.cos(tick()) * 50
    end)
end

------------------------------------------------
-- 🕳️ AGUJERO NEGRO
------------------------------------------------
local function CreateBlackHole()

    local core = Instance.new("Part")
    core.Anchored = true
    core.Shape = Enum.PartType.Ball
    core.Material = Enum.Material.Neon
    core.Color = Color3.fromRGB(0,0,0)
    core.Size = Vector3.new(50,50,50)
    core.Position = Vector3.new(0,200,-200)
    core.Parent = workspace

    local ring = Instance.new("ParticleEmitter")
    ring.Texture = "rbxassetid://258128463"
    ring.Rate = 200
    ring.Lifetime = NumberRange.new(2)
    ring.Speed = NumberRange.new(0)
    ring.RotSpeed = NumberRange.new(200)
    ring.Size = NumberSequence.new{
        NumberSequenceKeypoint.new(0,10),
        NumberSequenceKeypoint.new(1,0)
    }
    ring.Color = ColorSequence.new(Color3.fromRGB(120,0,255))
    ring.Parent = core

    RunService.RenderStepped:Connect(function()
        core.CFrame = core.CFrame * CFrame.Angles(0,0.01,0)
    end)
end

------------------------------------------------
-- 🌌 LOADING CINEMÁTICO
------------------------------------------------
local function ShowLoadingScreen()

    local gui = Instance.new("ScreenGui")
    gui.Name = "LEGNA_LOADING"
    gui.IgnoreGuiInset = true
    gui.Parent = game.CoreGui

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(5,0,15)
    frame.BackgroundTransparency = 1

    TweenService:Create(frame, TweenInfo.new(0.5), {
        BackgroundTransparency = 0
    }):Play()

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.new(1,0,0,100)
    text.Position = UDim2.new(0,0,0.4,0)
    text.BackgroundTransparency = 1
    text.Text = "LEGNA BOOST INITIALIZING"
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.TextScaled = true
    text.Font = Enum.Font.GothamBold
    text.TextTransparency = 1

    TweenService:Create(text, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()

    task.delay(2.2, function()
        gui:Destroy()
    end)
end

------------------------------------------------
-- 🚀 BOOST ULTRA LOW (OPTIMIZADO REAL)
------------------------------------------------
local function BoostUltra()

    local loading = ShowLoadingScreen()

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)

    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e10
    Lighting.Brightness = 1
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0

    task.spawn(function()
        for _, v in ipairs(game:GetDescendants()) do

            if v:IsA("ParticleEmitter") then
                v.Enabled = false
                v.Rate = 0

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
    end)

    task.wait(1)
    if loading then loading:Destroy() end
end

------------------------------------------------
-- 🎯 GUI HUD
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

local stroke = Instance.new("UIStroke", frame)
stroke.Thickness = 1
stroke.Transparency = 0.6

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
-- 🌈 FPS COUNTER (EXACTO, SIN CAMBIOS)
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
    math.floor(rgb.B*255)..")'>L</font> "  
    .."<font color='rgb(255,255,255)'>"..fps.." FPS</font> | "  
    .."<font color='rgb("..  
    math.floor(msColor.R*255)..","..  
    math.floor(msColor.G*255)..","..  
    math.floor(msColor.B*255)..")'>"  
    ..ping.." MS</font>"

end)

------------------------------------------------
-- 🚀 INIT
------------------------------------------------
CreateSky()
CreateAurora()
CreateBlackHole()

print("😈 LEGNA PREMIUM FULL SYSTEM ACTIVADO")
