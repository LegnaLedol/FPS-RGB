-- 🌅 LEGNA REAL CELESTIAL V5 🌅

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

-- LIMPIEZA TOTAL
for _, v in pairs(Lighting:GetChildren()) do
	if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then
		v:Destroy()
	end
end

-- ☀️ BASE REALISTA (CLAVE)
Lighting.ClockTime = 18.4
Lighting.Brightness = 2.2
Lighting.ExposureCompensation = 0.15
Lighting.Ambient = Color3.fromRGB(85, 75, 95)
Lighting.OutdoorAmbient = Color3.fromRGB(130, 120, 140)

-- 🌌 SKYBOX REAL (ATLAS SUAVE)
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454288"
sky.Parent = Lighting

-- ☁️ NUBES NATURALES (MUY IMPORTANTE)
local clouds = Instance.new("Clouds")
clouds.Cover = 0.45 -- menos = más real
clouds.Density = 0.7
clouds.Color = Color3.fromRGB(255, 210, 180)
clouds.Parent = workspace.Terrain

-- 🌫️ ATMÓSFERA FÍSICA (EL SECRETO REAL)
local atmosphere = Instance.new("Atmosphere")
atmosphere.Density = 0.32
atmosphere.Offset = 0.25
atmosphere.Color = Color3.fromRGB(255, 170, 120) -- naranja atardecer
atmosphere.Decay = Color3.fromRGB(70, 90, 160) -- azul profundo arriba
atmosphere.Glare = 0.25
atmosphere.Haze = 1.2
atmosphere.Parent = Lighting

-- ✨ BLOOM CASI INVISIBLE (REALISMO)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.18
bloom.Size = 35
bloom.Threshold = 1
bloom.Parent = Lighting

-- 🌈 COLOR GRADING CINEMÁTICO
local color = Instance.new("ColorCorrectionEffect")
color.Brightness = 0.03
color.Contrast = 0.18
color.Saturation = 0.12
color.TintColor = Color3.fromRGB(255, 200, 170)
color.Parent = Lighting

-- 🌤️ RAYOS REALES DEL SOL
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.18
sun.Spread = 0.45
sun.Parent = Lighting

-- 💫 SIN BLUR EXAGERADO (IMPORTANTE)
local blur = Instance.new("BlurEffect")
blur.Size = 0.8
blur.Parent = Lighting

-- 🌊 REFLEJO NATURAL (NO ESPEJO)
if Terrain then
	Terrain.WaterReflectance = 0.35
	Terrain.WaterTransparency = 0.4
	Terrain.WaterWaveSize = 0.1
	Terrain.WaterWaveSpeed = 6
end
