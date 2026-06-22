local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

------------------------------------------------
-- 🧼 LIMPIAR EFECTOS
------------------------------------------------
for _, v in ipairs(Lighting:GetChildren()) do
    if v:IsA("Sky")
    or v:IsA("Atmosphere")
    or v:IsA("BloomEffect")
    or v:IsA("ColorCorrectionEffect")
    or v:IsA("SunRaysEffect")
    or v:IsA("Clouds") then
        v:Destroy()
    end
end

------------------------------------------------
-- 🌅 SKYBOX ATARDECER
------------------------------------------------
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159248188"
sky.SkyboxDn = "rbxassetid://159248188"
sky.SkyboxFt = "rbxassetid://159248188"
sky.SkyboxLf = "rbxassetid://159248188"
sky.SkyboxRt = "rbxassetid://159248188"
sky.SkyboxUp = "rbxassetid://159248188"
sky.Parent = Lighting

------------------------------------------------
-- ☁️ NUBES (CLAVE DEL LOOK)
------------------------------------------------
local clouds = Instance.new("Clouds")
clouds.Cover = 0.65
clouds.Density = 0.9
clouds.Color = Color3.fromRGB(255, 180, 140)
clouds.Parent = Lighting

------------------------------------------------
-- 🌫 ATMÓSFERA CÁLIDA
------------------------------------------------
local atm = Instance.new("Atmosphere")
atm.Density = 0.4
atm.Offset = 0.1
atm.Color = Color3.fromRGB(255, 170, 120)
atm.Decay = Color3.fromRGB(255, 120, 90)
atm.Glare = 0.3
atm.Haze = 2
atm.Parent = Lighting

------------------------------------------------
-- 🎨 COLOR (GOLDEN HOUR)
------------------------------------------------
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.08
cc.Contrast = 0.25
cc.Saturation = 0.3
cc.TintColor = Color3.fromRGB(255, 200, 170)
cc.Parent = Lighting

------------------------------------------------
-- 💡 BLOOM SUAVE (BRILLO BONITO)
------------------------------------------------
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.9
bloom.Size = 55
bloom.Threshold = 0.85
bloom.Parent = Lighting

------------------------------------------------
-- ☀️ RAYOS DE SOL
------------------------------------------------
local rays = Instance.new("SunRaysEffect")
rays.Intensity = 0.12
rays.Spread = 0.85
rays.Parent = Lighting

------------------------------------------------
-- 🌍 ILUMINACIÓN GENERAL
------------------------------------------------
Lighting.ClockTime = 18.2 -- atardecer perfecto
Lighting.Brightness = 2
Lighting.OutdoorAmbient = Color3.fromRGB(255, 170, 120)
Lighting.GlobalShadows = true

------------------------------------------------
-- 🌅 MOVIMIENTO SUAVE (CIELO VIVO)
------------------------------------------------
local t = 0

RunService.RenderStepped:Connect(function(dt)
    t += dt

    local pulse = (math.sin(t * 0.3) + 1)/2

    -- ☁️ nubes respiran
    clouds.Cover = 0.6 + pulse * 0.1

    -- ✨ brillo suave
    bloom.Intensity = 0.8 + pulse * 0.2

    -- 🌫 atmósfera viva
    atm.Density = 0.38 + pulse * 0.05
end)
