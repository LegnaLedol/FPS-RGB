-- LEGNA MINI PRO 😈

local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local Lighting = game:GetService("Lighting")

-- 🔥 BOOST BASE
Lighting.GlobalShadows = false
Lighting.FogEnd = 9e9
Lighting.Brightness = 0
settings().Rendering.QualityLevel = "Level01"

-- 🎯 GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "LEGNA_MINI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 150, 0, 28)
frame.Position = UDim2.new(0, 10, 0.42, 0)
frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
frame.BackgroundTransparency = 0.25
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 10)

-- texto
local text = Instance.new("TextLabel", frame)
text.Size = UDim2.new(0.8,0,1,0)
text.Position = UDim2.new(0,5,0,0)
text.BackgroundTransparency = 1
text.TextScaled = true
text.Font = Enum.Font.GothamBold
text.TextXAlignment = Enum.TextXAlignment.Left

-- 🔘 BOTÓN MINI ON/OFF
local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0.2, -5, 0.7, 0)
toggle.Position = UDim2.new(0.8, 0, 0.15, 0)
toggle.Text = "●"
toggle.TextScaled = true
toggle.BackgroundColor3 = Color3.fromRGB(0,200,0)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BorderSizePixel = 0

local tcorner = Instance.new("UICorner", toggle)
tcorner.CornerRadius = UDim.new(1,0)

-- estado
local enabled = true

toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    text.Visible = enabled

    toggle.BackgroundColor3 = enabled and Color3.fromRGB(0,200,0) or Color3.fromRGB(200,0,0)
end)

-- 🌈 RGB suave
local hue = 0

-- FPS
local last = tick()
local fps = 0

RunService.RenderStepped:Connect(function()
    local now = tick()
    fps = math.floor(1 / (now - last))
    last = now

    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

    -- color ping
    local msColor = Color3.fromRGB(0,255,0)
    if ping > 200 then
        msColor = Color3.fromRGB(255,0,0)
    elseif ping > 100 then
        msColor = Color3.fromRGB(255,150,0)
    end

    -- RGB letra L
    hue = (hue + 0.02) % 1
    local rgb = Color3.fromHSV(hue,1,1)

    text.RichText = true
    text.Text = "<font color='rgb("..
        math.floor(rgb.R*255)..","..
        math.floor(rgb.G*255)..","..
        math.floor(rgb.B*255)..")'>L</font> "..fps..
        " | <font color='rgb("..
        math.floor(msColor.R*255)..","..
        math.floor(msColor.G*255)..","..
        math.floor(msColor.B*255)..")'>"..ping.."ms</font>"
end)

print("😈 LEGNA MINI ACTIVADO")
