-- 🌅 LEGNA ULTIMATE SKY 🌅
-- Realista + Vida + Efectos pesados incluidos

local Lighting = game:GetService("Lighting")
local Terrain = workspace:FindFirstChildOfClass("Terrain")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")

-- LIMPIAR
for _, v in pairs(Lighting:GetChildren()) do
	if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") then
		v:Destroy()
	end
end

-- ☀️ BASE REALISTA
Lighting.ClockTime = 18.4
Lighting.Brightness = 2.2
Lighting.ExposureCompensation = 0.15
Lighting.Ambient = Color3.fromRGB(85, 75, 95)
Lighting.OutdoorAmbient = Color3.fromRGB(130, 120, 140)

-- 🌌 SKY
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://159454299"
sky.SkyboxDn = "rbxassetid://159454296"
sky.SkyboxFt = "rbxassetid://159454293"
sky.SkyboxLf = "rbxassetid://159454286"
sky.SkyboxRt = "rbxassetid://159454300"
sky.SkyboxUp = "rbxassetid://159454288"
sky.Parent = Lighting

-- ☁️ NUBES
local clouds = Instance.new("Clouds")
clouds.Cover = 0.45
clouds.Density = 0.7
clouds.Color = Color3.fromRGB(255, 210, 180)
clouds.Parent = workspace.Terrain

-- 🌫️ ATMÓSFERA
local atmosphere = Instance.new("Atmosphere")
atmosphere.Density = 0.32
atmosphere.Offset = 0.25
atmosphere.Color = Color3.fromRGB(255, 170, 120)
atmosphere.Decay = Color3.fromRGB(70, 90, 160)
atmosphere.Glare = 0.25
atmosphere.Haze = 1.2
atmosphere.Parent = Lighting

-- ✨ EFECTOS
local bloom = Instance.new("BloomEffect")
bloom.Intensity = 0.18
bloom.Size = 35
bloom.Threshold = 1
bloom.Parent = Lighting

local color = Instance.new("ColorCorrectionEffect")
color.Brightness = 0.03
color.Contrast = 0.18
color.Saturation = 0.12
color.TintColor = Color3.fromRGB(255, 200, 170)
color.Parent = Lighting

local sun = Instance.new("SunRaysEffect")
sun.Intensity = 0.18
sun.Spread = 0.45
sun.Parent = Lighting

local blur = Instance.new("BlurEffect")
blur.Size = 0.8
blur.Parent = Lighting

-- 🌊 AGUA
if Terrain then
	Terrain.WaterReflectance = 0.35
	Terrain.WaterTransparency = 0.4
	Terrain.WaterWaveSize = 0.1
	Terrain.WaterWaveSpeed = 6
end

-- =========================
-- ✨ VIDA SUAVE
-- =========================

-- ☀️ respiración de luz
task.spawn(function()
	while true do
		for i = 0,1,0.01 do
			Lighting.ExposureCompensation = 0.15 + (i * 0.03)
			RunService.RenderStepped:Wait()
		end
		for i = 1,0,-0.01 do
			Lighting.ExposureCompensation = 0.15 + (i * 0.03)
			RunService.RenderStepped:Wait()
		end
	end
end)

-- ☄️ estrellas fugaces
task.spawn(function()
	while true do
		wait(math.random(8,15))

		local part = Instance.new("Part")
		part.Anchored = true
		part.CanCollide = false
		part.Material = Enum.Material.Neon
		part.Color = Color3.fromRGB(255, 240, 200)
		part.Size = Vector3.new(0.2,0.2,3)

		part.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(
			math.random(-50,50),
			math.random(20,40),
			-100
		)

		part.Parent = workspace

		TweenService:Create(part, TweenInfo.new(0.8), {
			CFrame = part.CFrame * CFrame.new(20,-10,0),
			Transparency = 1
		}):Play()

		Debris:AddItem(part,1)
	end
end)

-- =========================
-- 🔥 MODO PESADO
-- =========================

-- flashes de luz
task.spawn(function()
	while true do
		wait(math.random(4,8))

		local flash = Instance.new("ColorCorrectionEffect")
		flash.Brightness = 0.25
		flash.Contrast = 0.3
		flash.Saturation = 0.2
		flash.TintColor = Color3.fromRGB(255, 220, 200)
		flash.Parent = Lighting

		Debris:AddItem(flash,0.3)
	end
end)

-- partículas (lo pesado real)
task.spawn(function()
	while true do
		RunService.RenderStepped:Wait()

		local p = Instance.new("Part")
		p.Anchored = true
		p.CanCollide = false
		p.Material = Enum.Material.Neon
		p.Color = Color3.fromRGB(255, 200, 180)
		p.Size = Vector3.new(0.1,0.1,0.1)

		p.CFrame = workspace.CurrentCamera.CFrame * CFrame.new(
			math.random(-30,30),
			math.random(-10,20),
			math.random(-50,-10)
		)

		p.Parent = workspace

		TweenService:Create(p, TweenInfo.new(2), {
			Transparency = 1,
			Position = p.Position + Vector3.new(0,2,0)
		}):Play()

		Debris:AddItem(p,2)
	end
end)
