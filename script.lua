-- 🌅 LEGNA CELESTIAL SKY V4 🌅

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

-- LIMPIAR
for _, v in pairs(Lighting:GetChildren()) do
	if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then
		v:Destroy()
	end
end

-- ☀️ BASE PERFECTA (equilibrio real + fantasía)
Lighting.ClockTime = 18.6
Lighting.Brightness = 2.8
Lighting.ExposureCompensation = 0.25
Lighting.Ambient = Color3.fromRGB(100, 85, 120)
Lighting.OutdoorAmbient = Color3.fromRGB(150, 130, 170)

-- 🌌 SKYBOX SUAVE Y PROFUNDO (NO QUEMA)
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454288"
sky.Parent = Lighting

-- ☁️ NUBES REALISTAS + CELESTIALES
local clouds = Instance.new("Clouds")
clouds.Cover = 0.55 -- menos saturado = más real
clouds.Density = 0.9
clouds.Color = Color3.fromRGB(255, 200, 170)
clouds.Parent = workspace.Terrain

-- 🌫️ ATMÓSFERA TIPO VIDEO (clave)
local atmosphere = Instance.new("Atmosphere")
atmosphere.Density = 0.4
atmosphere.Offset = 0.15
atmosphere.Color = Color3.fromRGB(255, 160, 120)
atmosphere.Decay = Color3.fromRGB(90, 70, 160)
atmosphere.Glare = 0.45 -- brillo controlado
atmosphere.Haze = 1.8
atmosphere.Parent = Lighting

-- ✨ BLOOM FINO (no exagerado)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.35
bloom.Size = 50
bloom.Threshold = 0.95
bloom.Parent = Lighting

-- 🌈 COLOR GRADING PRO (ESTO ES LO QUE DA EL LOOK)
local color = Instance.new("ColorCorrectionEffect")
color.Brightness = 0.08
color.Contrast = 0.25
color.Saturation = 0.2
color.TintColor = Color3.fromRGB(255, 185, 160)
color.Parent = Lighting

-- 🌤️ RAYOS DE SOL NATURALES (tipo video)
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.22
sun.Spread = 0.6
sun.Parent = Lighting

-- 💫 MICRO GLOW (EFECTO EDIT LIMPIO)
local blur = Instance.new("BlurEffect")
blur.Size = 1.5
blur.Parent = Lighting

-- 🌊 REFLEJO BONITO (NO ESPEJO EXAGERADO)
if Terrain then
	Terrain.WaterReflectance = 0.45
	Terrain.WaterTransparency = 0.35
	Terrain.WaterWaveSize = 0.15
	Terrain.WaterWaveSpeed = 8
end
