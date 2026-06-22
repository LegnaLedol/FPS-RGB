local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- LIMPIAR TODO
for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("Atmosphere")
    or v:IsA("BloomEffect")
    or v:IsA("ColorCorrectionEffect")
    or v:IsA("SunRaysEffect")
    or v:IsA("Sky") then
        v:Destroy()
    end
end

-- 🌅 BASE HDR SUAVE
Lighting.ClockTime = 18.1
Lighting.Brightness = 1.8
Lighting.GlobalShadows = true
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1

Lighting.Ambient = Color3.fromRGB(90, 85, 80)
Lighting.OutdoorAmbient = Color3.fromRGB(130, 110, 100)

-- 🌫 ATMOSPHERE PROFUNDA (CLAVE REALISMO)
local atm = Instance.new("Atmosphere")
atm.Density = 0.45
atm.Offset = 0
atm.Color = Color3.fromRGB(255, 190, 150)
atm.Decay = Color3.fromRGB(120, 90, 80)
atm.Glare = 0.35
atm.Haze = 2
atm.Parent = Lighting

-- ☀️ RAYOS MÁS NATURALES
local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.18
sun.Spread = 0.95
sun.Parent = Lighting

-- ✨ BLOOM CONTROLADO (ANTI CEGUERA)
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.12
bloom.Size = 40
bloom.Threshold = 1.3
bloom.Parent = Lighting

-- 🎨 COLOR HDR FAKE
local cc = Instance.new("ColorCorrectionEffect")
cc.Brightness = 0.02
cc.Contrast = 0.4
cc.Saturation = 0.2
cc.TintColor = Color3.fromRGB(255, 210, 180)
cc.Parent = Lighting

-- ☁️ NUBES ULTRA (MULTICAPA + MOVIMIENTO)
local clouds = {}

local function crearNube(pos)
    local grupo = {}

    for i = 1, 4 do
        local nube = Instance.new("Part")
        nube.Anchored = true
        nube.CanCollide = false
        nube.Material = Enum.Material.SmoothPlastic
        nube.Color = Color3.fromRGB(255,255,255)
        nube.Transparency = 0.45 + (i * 0.08)
        nube.Size = Vector3.new(120,40,120) + Vector3.new(i*20,0,i*20)
        nube.Position = pos + Vector3.new(i*6, i*3, i*6)
        nube.Parent = Workspace

        local mesh = Instance.new("SpecialMesh", nube)
        mesh.MeshType = Enum.MeshType.Sphere
        mesh.Scale = Vector3.new(1,0.5,1)

        table.insert(grupo, nube)
    end

    table.insert(clouds, grupo)
end

-- GENERAR MUCHAS NUBES (PROFUNDIDAD REAL)
for i = 1, 22 do
    crearNube(Vector3.new(
        math.random(-600,600),
        math.random(150,260),
        math.random(-600,600)
    ))
end

-- 🌬 MOVIMIENTO LENTO (REALISMO)
RunService.RenderStepped:Connect(function(dt)
    for _, grupo in pairs(clouds) do
        for _, nube in pairs(grupo) do
            nube.Position += Vector3.new(0.2 * dt * 60, 0, 0.1 * dt * 60)
        end
    end
end)
