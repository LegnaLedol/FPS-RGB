local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- LIMPIAR EFECTOS
for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("Atmosphere")
    or v:IsA("BloomEffect")
    or v:IsA("ColorCorrectionEffect")
    or v:IsA("SunRaysEffect")
    or v:IsA("Sky") then
        v:Destroy()
    end
end

-- 🌑 BASE PRO
Lighting.ClockTime = 17.8
Lighting.Brightness = 4
Lighting.GlobalShadows = true

-- 💡 FAKE GLOBAL ILLUMINATION (REBOTE DE LUZ)
Lighting.Ambient = Color3.fromRGB(120, 120, 130)
Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 180)

Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

-- 🌫 ATMOSPHERE DIVINO
local atm = Instance.new("Atmosphere")
atm.Density = 0.35
atm.Offset = 0
atm.Color = Color3.fromRGB(255, 255, 255)
atm.Decay = Color3.fromRGB(120, 120, 130)
atm.Glare = 0.6
atm.Haze = 1.2
atm.Parent = Lighting

-- ☀️ RAYOS DE DIOS
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.75
sun.Spread = 1
sun.Parent = Lighting

-- ✨ BLOOM PRO (GLOW REALISTA)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.6
bloom.Size = 60
bloom.Threshold = 0.7
bloom.Parent = Lighting

-- 🎨 COLOR CINEMÁTICO
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.1
cc.Contrast = 0.45
cc.Saturation = 0.1
cc.TintColor = Color3.fromRGB(255, 255, 255)
cc.Parent = Lighting

-- ☁️ SKY DRAMÁTICO
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://6444884337"
sky.SkyboxDn = "rbxassetid://6444884785"
sky.SkyboxFt = "rbxassetid://6444884337"
sky.SkyboxLf = "rbxassetid://6444884337"
sky.SkyboxRt = "rbxassetid://6444884337"
sky.SkyboxUp = "rbxassetid://6444884337"
sky.Parent = Lighting

-- 🌊 REFLEJO FAKE (PISO MOJADO PRO)
for _, part in pairs(Workspace:GetDescendants()) do
    if part:IsA("BasePart") then
        part.Material = Enum.Material.SmoothPlastic
        
        -- 🔥 reflectancia = espejo falso
        part.Reflectance = 0.15
        
        -- 🔥 un poco más oscuro para contraste
        part.Color = part.Color:lerp(Color3.fromRGB(180,180,180), 0.1)
    end
end
