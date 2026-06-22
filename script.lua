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

-- 🌅 BASE ATARDECER APOCALIPSIS
Lighting.ClockTime = 18.4
Lighting.Brightness = 2.5
Lighting.GlobalShadows = true

Lighting.Ambient = Color3.fromRGB(120, 110, 100)
Lighting.OutdoorAmbient = Color3.fromRGB(150, 130, 110)

Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

-- 🌫 ATMOSPHERE (CELESTIAL SUAVE)
local atm = Instance.new("Atmosphere")
atm.Density = 0.28
atm.Offset = 0
atm.Color = Color3.fromRGB(255, 220, 200) -- tono atardecer
atm.Decay = Color3.fromRGB(180, 150, 140)
atm.Glare = 0.3
atm.Haze = 1
atm.Parent = Lighting

-- ☀️ SUN RAYS (RAYOS REALES)
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.3 -- visible pero no cegador
sun.Spread = 0.85
sun.Parent = Lighting

-- ✨ BLOOM (BRILLO DEL SOL)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.25
bloom.Size = 35
bloom.Threshold = 0.9
bloom.Parent = Lighting

-- 🎨 COLOR CINEMÁTICO
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.05
cc.Contrast = 0.25
cc.Saturation = 0.1
cc.TintColor = Color3.fromRGB(255, 235, 220)
cc.Parent = Lighting

-- ☁️ CREAR NUBES
local function crearNube(pos, size)
    local nube = Instance.new("Part")
    nube.Anchored = true
    nube.CanCollide = false
    nube.Material = Enum.Material.SmoothPlastic
    nube.Color = Color3.fromRGB(255,255,255)
    nube.Transparency = 0.35
    nube.Size = size
    nube.Position = pos
    nube.Parent = Workspace

    local mesh = Instance.new("SpecialMesh", nube)
    mesh.MeshType = Enum.MeshType.Sphere
    mesh.Scale = Vector3.new(1,0.5,1)
end

-- GENERAR NUBES GRANDES (DRAMÁTICAS)
for i = 1, 15 do
    crearNube(
        Vector3.new(
            math.random(-400,400),
            math.random(140,200),
            math.random(-400,400)
        ),
        Vector3.new(
            math.random(60,120),
            math.random(20,40),
            math.random(60,120)
        )
    )
end
