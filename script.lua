local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

------------------------------------------------
-- 🧼 LIMPIEZA TOTAL
------------------------------------------------
for _, v in ipairs(Lighting:GetChildren()) do
    if v:IsA("Sky")
    or v:IsA("Atmosphere")
    or v:IsA("BloomEffect")
    or v:IsA("ColorCorrectionEffect")
    or v:IsA("SunRaysEffect") then
        v:Destroy()
    end
end

------------------------------------------------
-- 🌌 SKY PRO
------------------------------------------------
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454299"
sky.SkyboxFt = "rbxassetid://159454299"
sky.SkyboxLf = "rbxassetid://159454299"
sky.SkyboxRt = "rbxassetid://159454299"
sky.SkyboxUp = "rbxassetid://159454299"
sky.StarCount = 8000
sky.Parent = Lighting

------------------------------------------------
-- 🌫 ATMOSPHERE
------------------------------------------------
local atm = Instance.new("Atmosphere")
atm.Density = 0.35
atm.Offset = 0.2
atm.Color = Color3.fromRGB(200,220,255)
atm.Decay = Color3.fromRGB(70,80,120)
atm.Glare = 0.2
atm.Haze = 2
atm.Parent = Lighting

------------------------------------------------
-- 🎨 COLOR
------------------------------------------------
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.05
cc.Contrast = 0.3
cc.Saturation = 0.25
cc.TintColor = Color3.fromRGB(220,235,255)
cc.Parent = Lighting

------------------------------------------------
-- 💡 BLOOM
------------------------------------------------
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 1
bloom.Size = 60
bloom.Threshold = 0.9
bloom.Parent = Lighting

------------------------------------------------
-- ☀️ RAYS
------------------------------------------------
local rays = Instance.new("SunRaysEffect")
rays.Intensity = 0.08
rays.Spread = 0.85
rays.Parent = Lighting

------------------------------------------------
-- 🌍 GLOBAL LIGHT
------------------------------------------------
Lighting.GlobalShadows = true
Lighting.Brightness = 2.2
Lighting.OutdoorAmbient = Color3.fromRGB(120,130,150)
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

------------------------------------------------
-- 🌧️ PISO MOJADO CON REFLEJO
------------------------------------------------
local floor = Instance.new("Part")
floor.Size = Vector3.new(2000,1,2000)
floor.Position = Vector3.new(0,0,0)
floor.Anchored = true
floor.Material = Enum.Material.Grass
floor.Color = Color3.fromRGB(60,100,60)
floor.Parent = Workspace

-- 🌊 capa de agua (reflejo fake bonito)
local wet = Instance.new("Part")
wet.Size = floor.Size
wet.Position = floor.Position + Vector3.new(0,0.05,0)
wet.Anchored = true
wet.Material = Enum.Material.Glass
wet.Transparency = 0.4
wet.Color = Color3.fromRGB(180,200,255)
wet.Reflectance = 0.3
wet.Parent = Workspace

------------------------------------------------
-- 🌧️ LLUVIA ESTÉTICA
------------------------------------------------
local rainPart = Instance.new("Part")
rainPart.Anchored = true
rainPart.Transparency = 1
rainPart.Size = Vector3.new(1,1,1)
rainPart.Position = Vector3.new(0,200,0)
rainPart.Parent = Workspace

local attachment = Instance.new("Attachment", rainPart)

local rain = Instance.new("ParticleEmitter")
rain.Texture = "rbxassetid://241837157"
rain.Rate = 400
rain.Lifetime = NumberRange.new(0.5)
rain.Speed = NumberRange.new(80,100)
rain.Size = NumberSequence.new(0.1)
rain.Transparency = NumberSequence.new(0.3)
rain.Parent = attachment

------------------------------------------------
-- 🌌 VIDA DEL ENTORNO
------------------------------------------------
local t = 0

RunService.RenderStepped:Connect(function(dt)
    t += dt

    Lighting.ClockTime = 14 + math.sin(t * 0.02)

    local pulse = (math.sin(t * 0.5) + 1)/2

    atm.Density = 0.33 + pulse * 0.05
    bloom.Intensity = 0.9 + pulse * 0.3
    cc.Contrast = 0.28 + pulse * 0.07

    -- 💧 brillo del piso mojado
    wet.Reflectance = 0.25 + pulse * 0.1
end)
