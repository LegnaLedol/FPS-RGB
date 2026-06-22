local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- LIMPIAR
for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("Atmosphere")
    or v:IsA("BloomEffect")
    or v:IsA("ColorCorrectionEffect")
    or v:IsA("SunRaysEffect")
    or v:IsA("Sky") then
        v:Destroy()
    end
end

-- 🌅 ILUMINACIÓN REALISTA
Lighting.ClockTime = 18.2
Lighting.Brightness = 1.7
Lighting.GlobalShadows = true

Lighting.Ambient = Color3.fromRGB(80, 75, 70)
Lighting.OutdoorAmbient = Color3.fromRGB(120, 100, 90)

-- 🌫 ATMOSPHERE PRO
local atm = Instance.new("Atmosphere")
atm.Density = 0.5
atm.Offset = 0
atm.Color = Color3.fromRGB(255, 185, 140)
atm.Decay = Color3.fromRGB(110, 85, 75)
atm.Glare = 0.4
atm.Haze = 2.5
atm.Parent = Lighting

-- ☀️ RAYOS DIVINOS
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.15
sun.Spread = 1
sun.Parent = Lighting

-- ✨ BLOOM SUAVE
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.1
bloom.Size = 45
bloom.Threshold = 1.4
bloom.Parent = Lighting

-- 🎨 COLOR CINEMÁTICO
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.02
cc.Contrast = 0.45
cc.Saturation = 0.2
cc.TintColor = Color3.fromRGB(255, 210, 180)
cc.Parent = Lighting

-- ☁️ NUBES GRANDES (FORMA REAL)
local clouds = {}

local function crearMegaNube(pos)
    local grupo = {}

    for i = 1, math.random(18,25) do
        local nube = Instance.new("Part")
        nube.Anchored = true
        nube.CanCollide = false
        nube.Material = Enum.Material.SmoothPlastic
        nube.Color = Color3.fromRGB(255,255,255)

        -- transparencia variable (CLAVE)
        nube.Transparency = math.random(30,60)/100

        local size = math.random(40,90)
        nube.Size = Vector3.new(size, size * 0.6, size)

        -- distribución tipo nube real
        nube.Position = pos + Vector3.new(
            math.random(-80,80),
            math.random(-20,20),
            math.random(-80,80)
        )

        nube.Parent = Workspace

        local mesh = Instance.new("SpecialMesh", nube)
        mesh.MeshType = Enum.MeshType.Sphere

        table.insert(grupo, nube)
    end

    table.insert(clouds, grupo)
end

-- GENERAR NUBES GRANDES
for i = 1, 10 do
    crearMegaNube(Vector3.new(
        math.random(-800,800),
        math.random(180,260),
        math.random(-800,800)
    ))
end

-- 🌬 MOVIMIENTO SUAVE
RunService.RenderStepped:Connect(function(dt)
    for _, grupo in pairs(clouds) do
        for _, nube in pairs(grupo) do
            nube.Position += Vector3.new(0.15 * dt * 60, 0, 0.08 * dt * 60)
        end
    end
end)
