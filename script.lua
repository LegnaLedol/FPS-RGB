-- LEGNA OVERLAY PRO MAX 😈🔥

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

local player = Players.LocalPlayer

-- 🔥 BOOST NORMAL
local function BoostNormal()
    Lighting.GlobalShadows = false
    Lighting.FogEnd = 9e9
    Lighting.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
end

-- 🚀 BOOST ULTRA
local function BoostUltra()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            v:Destroy()
        elseif v:IsA("Explosion") then
            v.BlastPressure = 0
            v.BlastRadius = 0
        elseif v:IsA("Fire") or v:IsA("Smoke") then
            v:Destroy()
        end
    end

    if Terrain then
        Terrain.WaterWaveSize = 0
        Terrain.WaterWaveSpeed = 0
        Terrain.WaterReflectance = 0
        Terrain.WaterTransparency = 1
    end
end

BoostNormal()

-- 🎯 GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LEGNA_PRO"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 180, 0, 40)
frame.Position = UDim2.new(0, 10, 0.4, 0)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.3
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true -- 👆 mover con el dedo

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 12)

-- texto
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(1,0,1,0)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamBold

-- 🔘 BOTÓN ON/OFF
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0, 60, 0, 25)
toggle.Position = UDim2.new(0, 10, 0.5, 0)
toggle.Text = "ON"
toggle.BackgroundColor3 = Color3.fromRGB(0,170,0)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BorderSizePixel = 0

local tcorner = Instance.new("UICorner", toggle)
tcorner.CornerRadius = UDim.new(0, 8)

-- 🚀 BOTÓN ULTRA
local ultraBtn = Instance.new("TextButton", gui)
ultraBtn.Size = UDim2.new(0, 60, 0, 25)
ultraBtn.Position = UDim2.new(0, 80, 0.5, 0)
ultraBtn.Text = "ULTRA"
ultraBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
ultraBtn.TextColor3 = Color3.new(1,1,1)
ultraBtn.BorderSizePixel = 0

local ucorner = Instance.new("UICorner", ultraBtn)
ucorner.CornerRadius = UDim.new(0, 8)

-- estado
local enabled = true

toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    frame.Visible = enabled
    toggle.Text = enabled and "ON" or "OFF"
    toggle.BackgroundColor3 = enabled and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)
end)

ultraBtn.MouseButton1Click:Connect(function()
    BoostUltra()
end)

-- 🌈 RGB rápido
local hue = 0

-- 📊 FPS + PING
local fps = 0
local last = tick()

RunService.RenderStepped:Connect(function()
    local now = tick()
    fps = math.floor(1 / (now - last))
    last = now

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

    -- colores ping
    local msColor = Color3.fromRGB(0,255,0)
    if ping > 200 then
        msColor = Color3.fromRGB(255,0,0)
    elseif ping > 100 then
        msColor = Color3.fromRGB(255,150,0)
    end

    -- RGB rápido ⚡
    hue = (hue + 0.03) % 1
    local Lcolor = Color3.fromHSV(hue,1,1)

    text.RichText = true
    text.Text = "<font color='rgb("..
        math.floor(Lcolor.R*255)..","..
        math.floor(Lcolor.G*255)..","..
        math.floor(Lcolor.B*255)..")'>L</font> "..fps..
        " FPS | <font color='rgb("..
        math.floor(msColor.R*255)..","..
        math.floor(msColor.G*255)..","..
        math.floor(msColor.B*255)..")'>"..ping.." MS</font>"
end)

print("😈 LEGNA PRO MAX ACTIVADO")
