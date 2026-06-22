-- LEGNA PREMIUM HUD 😈✨

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local UIS = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")

-- 🔥 BOOST BASE
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0

pcall(function()
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end)

-- 🌌 CINEMATIC GALAXY LOADING PRO MAX
local function ShowLoadingScreen()

    local gui = Instance.new("ScreenGui")
    gui.Name = "LEGNA_LOADING"
    gui.IgnoreGuiInset = true
    gui.ResetOnSpawn = false
    gui.Parent = game.CoreGui

    -- 🌑 fondo
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundColor3 = Color3.fromRGB(5, 0, 15)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.Parent = gui

    TweenService:Create(frame, TweenInfo.new(0.5), {
        BackgroundTransparency = 0
    }):Play()

    -- 🌌 gradient galaxia
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 10, 70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 0, 90))
    }
    gradient.Rotation = 0
    gradient.Parent = frame

    -- ✨ título
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1,0,0,100)
    text.Position = UDim2.new(0,0,0.40,0)
    text.BackgroundTransparency = 1
    text.Text = "LEGNA BOOST INITIALIZING"
    text.TextColor3 = Color3.fromRGB(255,255,255)
    text.Font = Enum.Font.GothamBold
    text.TextScaled = true
    text.TextTransparency = 1
    text.Parent = frame

    TweenService:Create(text, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()

    -- 🌠 subtexto
    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1,0,0,40)
    sub.Position = UDim2.new(0,0,0.52,0)
    sub.BackgroundTransparency = 1
    sub.Text = "calibrating visual system..."
    sub.TextColor3 = Color3.fromRGB(180,180,180)
    sub.Font = Enum.Font.Gotham
    sub.TextScaled = true
    sub.TextTransparency = 1
    sub.Parent = frame

    TweenService:Create(sub, TweenInfo.new(0.5), {
        TextTransparency = 0
    }):Play()

    -- 📊 BARRA DE PROGRESO
    local barBG = Instance.new("Frame")
    barBG.Size = UDim2.new(0.3,0,0,6)
    barBG.Position = UDim2.new(0.35,0,0.62,0)
    barBG.BackgroundColor3 = Color3.fromRGB(30,30,30)
    barBG.BorderSizePixel = 0
    barBG.Parent = frame

    local barFill = Instance.new("Frame")
    barFill.Size = UDim2.new(0,0,1,0)
    barFill.BackgroundColor3 = Color3.fromRGB(170,120,255)
    barFill.BorderSizePixel = 0
    barFill.Parent = barBG

    -- 🌌 animación galaxia
    local running = true
    task.spawn(function()
        while running do
            gradient.Rotation += 0.6
            task.wait(0.02)
        end
    end)

    -- ✨ progreso simulado (suave)
    task.spawn(function()
        for i = 1, 100 do
            TweenService:Create(barFill, TweenInfo.new(0.02), {
                Size = UDim2.new(i/100,0,1,0)
            }):Play()
            task.wait(0.02)
        end
    end)

    -- 🔊 sonido inicio
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://911342077"
    sound.Volume = 1
    sound.Parent = SoundService
    sound:Play()

    -- 💀 cierre cinematográfico
    task.spawn(function()
        task.wait(2.2)

        running = false

        TweenService:Create(frame, TweenInfo.new(0.5), {
            BackgroundTransparency = 1
        }):Play()

        TweenService:Create(text, TweenInfo.new(0.3), {
            TextTransparency = 1
        }):Play()

        TweenService:Create(sub, TweenInfo.new(0.3), {
            TextTransparency = 1
        }):Play()

        TweenService:Create(barBG, TweenInfo.new(0.3), {
            BackgroundTransparency = 1
        }):Play()

        TweenService:Create(barFill, TweenInfo.new(0.3), {
            BackgroundTransparency = 1
        }):Play()

        task.wait(0.6)
        gui:Destroy()
    end)

    return gui
end

-- 🚀 BOOST ULTRA COMPETITIVO (CLEAN)
local function BoostUltra()

    local loading = ShowLoadingScreen()

    local desc = game:GetDescendants()

    for i, v in ipairs(desc) do

        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
            v.CastShadow = false

        elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 0.8

        elseif v:IsA("ParticleEmitter") then
            v.Rate = 0
            v.Enabled = false

        elseif v:IsA("Trail") then
            v.Enabled = false

        elseif v:IsA("Fire") or v:IsA("Smoke") then
            v.Enabled = false

        elseif v:IsA("Sparkles") then
            v.Enabled = false
        end

        if i % 100 == 0 then
            task.wait()
        end
    end

    Lighting.GlobalShadows = false
    Lighting.FogEnd = 1e9
    Lighting.Brightness = 1.1
    Lighting.EnvironmentDiffuseScale = 0
    Lighting.EnvironmentSpecularScale = 0

    task.wait(0.3)
    if loading then loading:Destroy() end
end

-- 🎯 GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LEGNA_PREMIUM"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 125, 0, 20)
frame.Position = UDim2.new(0, 8, 0, 70)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BackgroundTransparency = 0.25
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(40,40,40)
stroke.Thickness = 1
stroke.Transparency = 0.6

-- TEXTO
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(0.82,0,1,0)
text.Position = UDim2.new(0,6,0,0)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamSemibold
text.TextXAlignment = Enum.TextXAlignment.Left

-- BOTÓN
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0.18,0,1,0)
toggle.Position = UDim2.new(0.82,0,0,0)
toggle.BackgroundTransparency = 1
toggle.Text = ""

local enabled = true

toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    text.Visible = enabled

    if enabled then
        BoostUltra()
    end
end)

-- 📱 DRAG
local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
        dragInput = input
    end
end)

frame.InputEnded:Connect(function(input)
    if input == dragInput then
        dragging = false
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- 🌈 FPS + PING
local hue = 0
local fps = 0
local frames = 0
local lastTime = tick()

RunService.RenderStepped:Connect(function()
    frames += 1

    if tick() - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = tick()
    end

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

    local msColor = Color3.fromRGB(0,255,120)
    if ping > 180 then
        msColor = Color3.fromRGB(255,60,60)
    elseif ping > 100 then
        msColor = Color3.fromRGB(255,170,60)
    end

    hue = (hue + 0.008) % 1
    local rgb = Color3.fromHSV(hue,1,1)

    text.RichText = true
    text.Text =
        "<font color='rgb("..
        math.floor(rgb.R*255)..","..
        math.floor(rgb.G*255)..","..
        math.floor(rgb.B*255)..")'>L</font> "
        .."<font color='rgb(255,255,255)'>"..fps.." FPS</font> | "
        .."<font color='rgb("..
        math.floor(msColor.R*255)..","..
        math.floor(msColor.G*255)..","..
        math.floor(msColor.B*255)..")'>"
        ..ping.." MS</font>"
end)

print("😈 LEGNA PREMIUM ACTIVADO")
