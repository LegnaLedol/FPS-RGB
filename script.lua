local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

------------------------------------------------
-- 🌌 LIMPIEZA SOLO VISUAL
------------------------------------------------
local function ClearSky()
    for _, v in ipairs(Lighting:GetChildren()) do
        if v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") then
            v:Destroy()
        end
    end
end

------------------------------------------------
-- 🌌 SHADER ARTE (BASE CINEMÁTICA)
------------------------------------------------
local function CreateArtShaders()

    local atm = Instance.new("Atmosphere")
    atm.Density = 0.38
    atm.Offset = 0.1
    atm.Color = Color3.fromRGB(130, 170, 255)
    atm.Decay = Color3.fromRGB(25, 35, 80)
    atm.Glare = 0.25
    atm.Haze = 2.5
    atm.Parent = Lighting

    local bloom = Instance.new("BloomEffect")
    bloom.Intensity = 1.6
    bloom.Size = 70
    bloom.Threshold = 0.8
    bloom.Parent = Lighting

    local cc = Instance.new("ColorCorrectionEffect")
    cc.Contrast = 0.3
    cc.Saturation = 0.45
    cc.Brightness = 0.05
    cc.TintColor = Color3.fromRGB(210, 225, 255)
    cc.Parent = Lighting

    local sky = Instance.new("Sky")

    -- 🌌 SKYBOX GALAXIA MÁS PROFUNDO (clave del arte)
    sky.SkyboxBk = "rbxassetid://6778646360"
    sky.SkyboxDn = "rbxassetid://6778646360"
    sky.SkyboxFt = "rbxassetid://6778646360"
    sky.SkyboxLf = "rbxassetid://6778646360"
    sky.SkyboxRt = "rbxassetid://6778646360"
    sky.SkyboxUp = "rbxassetid://6778646360"

    sky.StarCount = 10000
    sky.Parent = Lighting

    local t = 0

    RunService.RenderStepped:Connect(function(dt)
        t += dt

        -- 🌙 tiempo cósmico lento
        Lighting.ClockTime = 14 + math.sin(t * 0.02) * 1.2

        -- 🌊 respiración artística
        local pulse = (math.sin(t * 0.5) + 1) / 2

        atm.Density = 0.35 + pulse * 0.08
        atm.Glare = 0.2 + pulse * 0.3

        bloom.Intensity = 1.3 + pulse * 0.6
        cc.Contrast = 0.25 + pulse * 0.2
        cc.Saturation = 0.35 + pulse * 0.25
    end)
end

------------------------------------------------
-- 🌠 GALAXIA EN MOVIMIENTO REAL (ARTE)
------------------------------------------------
local function CreateGalaxyArt()

    local center = Instance.new("Part")
    center.Anchored = true
    center.Transparency = 1
    center.Position = Vector3.new(0, 250, 0)
    center.Parent = workspace

    local stars = {}

    for i = 1, 60 do
        local p = Instance.new("Part")
        p.Anchored = true
        p.Shape = Enum.PartType.Ball
        p.Material = Enum.Material.Neon
        p.Color = Color3.fromRGB(180, 220, 255)
        p.Size = Vector3.new(2,2,2)
        p.Parent = workspace

        table.insert(stars, {
            part = p,
            angle = math.random() * math.pi * 2,
            radius = math.random(120, 300),
            speed = math.random(5, 20) / 1000
        })
    end

    RunService.RenderStepped:Connect(function()
        local t = tick()

        for _, s in ipairs(stars) do
            s.angle += s.speed

            local x = math.cos(s.angle) * s.radius
            local z = math.sin(s.angle) * s.radius
            local y = math.sin(t * 0.5 + s.angle) * 30

            s.part.Position = center.Position + Vector3.new(x, y, z)

            -- ✨ brillo vivo
            local glow = (math.sin(t + s.angle) + 1) / 2
            s.part.Color = Color3.fromRGB(
                120 + glow * 100,
                170 + glow * 80,
                255
            )
        end
    end)
end

------------------------------------------------
-- 🌈 AURORA SUAVE (NO RUIDO, SOLO ARTE)
------------------------------------------------
local function CreateAuroraArt()

    local p = Instance.new("Part")
    p.Anchored = true
    p.Transparency = 1
    p.Size = Vector3.new(2000,1,2000)
    p.Position = Vector3.new(0,300,0)
    p.Parent = workspace

    local a0 = Instance.new("Attachment", p)
    local a1 = Instance.new("Attachment", p)

    local beam = Instance.new("Beam")
    beam.Attachment0 = a0
    beam.Attachment1 = a1
    beam.Width0 = 160
    beam.Width1 = 200
    beam.FaceCamera = true
    beam.LightEmission = 1
    beam.Parent = p

    beam.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,210)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160,0,255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0,140,255))
    }

    RunService.RenderStepped:Connect(function()
        local t = tick()

        beam.CurveSize0 = math.sin(t * 0.6) * 100
        beam.CurveSize1 = math.cos(t * 0.6) * 100

        beam.LightEmission = 0.8 + math.sin(t * 1.2) * 0.2
    end)
end

------------------------------------------------
-- 🕳️ AGUJERO NEGRO (ARTE VISUAL)
------------------------------------------------
local function CreateBlackHoleArt()

    local core = Instance.new("Part")
    core.Anchored = true
    core.Shape = Enum.PartType.Ball
    core.Material = Enum.Material.Neon
    core.Color = Color3.fromRGB(0,0,0)
    core.Size = Vector3.new(70,70,70)
    core.Position = Vector3.new(0,260,-300)
    core.Parent = workspace

    RunService.RenderStepped:Connect(function()
        local t = tick()

        core.CFrame = core.CFrame * CFrame.Angles(0,0.008,0)

        local pulse = math.sin(t * 2) * 8
        core.Size = Vector3.new(70 + pulse, 70 + pulse, 70 + pulse)
    end)
end

------------------------------------------------
-- 🚀 INIT FINAL
------------------------------------------------
ClearSky()
CreateArtShaders()
CreateGalaxyArt()
CreateAuroraArt()
CreateBlackHoleArt()
