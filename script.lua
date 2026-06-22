local Lighting = game:GetService("Lighting")

-- LIMPIEZA TOTAL
Lighting:ClearAllChildren()

-- BASE
Lighting.ClockTime = 18.6
Lighting.Brightness = 2.5
Lighting.GlobalShadows = true
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

Lighting.Ambient = Color3.fromRGB(60, 60, 70)
Lighting.OutdoorAmbient = Color3.fromRGB(90, 90, 100)

-- 🌫 ATMOSPHERE (PROFUNDO Y LIMPIO)
local atm = Instance.new("Atmosphere")
atm.Density = 0.4
atm.Offset = 0
atm.Color = Color3.fromRGB(210, 210, 220) -- gris claro limpio
atm.Decay = Color3.fromRGB(80, 80, 90) -- profundidad oscura
atm.Glare = 0.35
atm.Haze = 3
atm.Parent = Lighting

-- ☀️ SUN RAYS (FUERTES COMO PSHADE)
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.35
sun.Spread = 0.9
sun.Parent = Lighting

-- ✨ BLOOM (GLOW PRO)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.35
bloom.Size = 40
bloom.Threshold = 0.85
bloom.Parent = Lighting

-- 🎨 COLOR CORRECTION (CLAVE DEL LOOK)
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = -0.08
cc.Contrast = 0.35 -- 🔥 esto da el look Pshade
cc.Saturation = -0.1
cc.TintColor = Color3.fromRGB(235, 235, 245)
cc.Parent = Lighting

-- ☁️ SKY (NUBES DRAMÁTICAS)
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454288"
sky.Parent = Lighting
