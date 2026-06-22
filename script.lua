local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

------------------------------------------------
-- 🧼 LIMPIEZA TOTAL DE EFECTOS
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
-- 🌌 SKY HERMOSO (BASE REALISTA)
------------------------------------------------
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://6238512370"
sky.SkyboxDn = "rbxassetid://6238512370"
sky.SkyboxFt = "rbxassetid://6238512370"
sky.SkyboxLf = "rbxassetid://6238512370"
sky.SkyboxRt = "rbxassetid://6238512370"
sky.SkyboxUp = "rbxassetid://6238512370"
sky.StarCount = 6000
sky.Parent = Lighting

------------------------------------------------
-- 🌫 ATMOSPHERE CINEMÁTICA (PRO FUNDO)
------------------------------------------------
local atm = Instance.new("Atmosphere")
atm.Density = 0.35
atm.Offset = 0.2
atm.Color = Color3.fromRGB(200, 220, 255)
atm.Decay = Color3.fromRGB(70, 80, 120)
atm.Glare = 0.2
atm.Haze = 2
atm.Parent = Lighting

------------------------------------------------
-- 🎨 COLOR GRADING (LOOK AAA)
------------------------------------------------
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.05
cc.Contrast = 0.3
cc.Saturation = 0.25
cc.TintColor = Color3.fromRGB(220, 235, 255)
cc.Parent = Lighting

------------------------------------------------
-- 💡 BLOOM SUAVE (LUZ BONITA)
------------------------------------------------
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 1
bloom.Size = 56
bloom.Threshold = 0.9
bloom.Parent = Lighting

------------------------------------------------
-- ☀️ SUN RAYS (EFECTO “REFLEJO LUZ”)
------------------------------------------------
local rays = Instance.new("SunRaysEffect")
rays.Intensity = 0.08
rays.Spread = 0.85
rays.Parent = Lighting

------------------------------------------------
-- 🌙 ILUMINACIÓN GLOBAL SUAVE (CLAVE DEL “REFLEJO”)
------------------------------------------------
Lighting.GlobalShadows = true
Lighting.Brightness = 2
Lighting.OutdoorAmbient = Color3.fromRGB(120, 130, 150)
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

------------------------------------------------
-- 🌌 VIDA SUAVE DEL CIELO (RESPIRACIÓN)
------------------------------------------------
local t = 0

RunService.RenderStepped:Connect(function(dt)
    t += dt

    -- 🌙 tiempo suave tipo cinematográfico
    Lighting.ClockTime = 14 + math.sin(t * 0.02) * 0.8

    -- 🌊 micro cambios de “luz ambiente”
    local pulse = (math.sin(t * 0.4) + 1) / 2

    atm.Density = 0.33 + pulse * 0.05
    atm.Glare = 0.18 + pulse * 0.08

    bloom.Intensity = 0.9 + pulse * 0.2
    cc.Contrast = 0.28 + pulse * 0.05
end)
