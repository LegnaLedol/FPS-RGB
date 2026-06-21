-- LEGNA FULL PRO 😈🔥

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local UIS = game:GetService("UserInputService")
local SoundService = game:GetService("SoundService")

-- 🔘 ESTADOS
local enabled = true
local ultra = false

-- 🚀 BOOST NORMAL
local function BoostNormal()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 1
end

-- 💀 BOOST ULTRA (AGRESIVO)
local function BoostUltra()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        elseif v:IsA("Fire") or v:IsA("Smoke") then
            v:Destroy()
        end
    end

    -- 🔊 SONIDO TURBO
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://911342077"
    s.Volume = 1.5
    s.Parent = SoundService
    s:Play()

    task.delay(3, function()
        s:Destroy()
    end)
end

-- 🎯 GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 140, 0, 22)
frame.Position = UDim2.new(0, 8, 0, 70)
frame.BackgroundColor3 = Color3.fromRGB(10,10,10)
frame.BackgroundTransparency = 0.25
frame.BorderSizePixel = 0
frame.Active = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

-- TEXTO
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(0.7,0,1,0)
text.Position = UDim2.new(0,6,0,0)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamSemibold
text.TextXAlignment = Enum.TextXAlignment.Left

-- 🔘 BOTÓN ON/OFF
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0.15,0,1,0)
toggle.Position = UDim2.new(0.7,0,0,0)
toggle.BackgroundTransparency = 1
toggle.Text = ""

-- 💀 BOTÓN ULTRA
local ultraBtn = Instance.new("TextButton", frame)
ultraBtn.Size = UDim2.new(0.15,0,1,0)
ultraBtn.Position = UDim2.new(0.85,0,0,0)
ultraBtn.BackgroundTransparency = 1
ultraBtn.Text = ""

-- 🔘 FUNCIONES BOTONES
toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    text.Visible = enabled
end)

ultraBtn.MouseButton1Click:Connect(function()
    ultra = not ultra

    if ultra then
        BoostUltra()
    else
        BoostNormal()
    end
end)

-- 📱 DRAG
local dragging, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

-- FPS ESTABLE
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

    -- 🎯 FPS SIEMPRE BLANCO
    local fpsColor = "rgb(255,255,255)"

    -- ping color
    local msColor = "rgb(0,255,120)"
    if ping > 180 then
        msColor = "rgb(255,60,60)"
    elseif ping > 100 then
        msColor = "rgb(255,170,60)"
    end

    text.RichText = true
    text.Text =
        "<font color='"..fpsColor.."'>"..
        fps.." FPS</font> | <font color='"..
        msColor.."'>"..ping.." MS</font>"
end)

print("😈 LEGNA FULL ACTIVADO")
