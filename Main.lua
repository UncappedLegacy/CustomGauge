-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Right = Instance.new("Frame")
local Left = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Sync = Instance.new("TextLabel")
local JHud = Instance.new("Frame")
local SS = Instance.new("TextLabel")
local Gain = Instance.new("TextLabel")
local Sign = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui

Holder.Name = "Holder"
Holder.Parent = ScreenGui
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0.5, -200, 0.212319195, 0)
Holder.Size = UDim2.new(0, 400, 0, 200)

Frame.Parent = Holder
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.474999994, -125, 0.488000035, -17)
Frame.Size = UDim2.new(0, 270, 0, 37)

Right.Name = "Right"
Right.Parent = Frame
Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Right.BorderSizePixel = 0
Right.Position = UDim2.new(0, 0, -0.128571436, 0)
Right.Size = UDim2.new(0, 125, 0, 43)
Right.Visible = false

Left.Name = "Left"
Left.Parent = Frame
Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Left.BorderSizePixel = 0
Left.Position = UDim2.new(0.5, 0, -0, 0)
Left.Size = UDim2.new(0, 125, 0, 43)
Left.Visible = false

Frame_2.Parent = Holder
Frame_2.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, -1, 0.5, -22)
Frame_2.Size = UDim2.new(0, 2, 0, 44)

Sync.Name = "Sync"
Sync.Parent = Holder
Sync.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sync.BackgroundTransparency = 1.000
Sync.BorderSizePixel = 0
Sync.Position = UDim2.new(0.25, 0, 0.630000055, 0)
Sync.Size = UDim2.new(0, 200, 0, 51)
Sync.Font = Enum.Font.GothamMedium
Sync.Text = "0% 0 u/s"
Sync.TextColor3 = Color3.fromRGB(255, 255, 255)
Sync.TextSize = 20.000

JHud.Name = "JHud"
JHud.Parent = Holder
JHud.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JHud.BackgroundTransparency = 1.000
JHud.Position = UDim2.new(0.254999995, 0, 0.88500005, 0)
JHud.Size = UDim2.new(0, 195, 0, 60)

SS.Name = "SS"
SS.Parent = JHud
SS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SS.BackgroundTransparency = 1.000
SS.BorderSizePixel = 0
SS.Size = UDim2.new(0, 194, 0, 30)
SS.Font = Enum.Font.GothamBold
SS.Text = "0: 0 | (0%)"
SS.TextColor3 = Color3.fromRGB(202, 202, 202)
SS.TextSize = 29.000

Gain.Name = "Gain"
Gain.Parent = JHud
Gain.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gain.BackgroundTransparency = 1.000
Gain.BorderSizePixel = 0
Gain.Position = UDim2.new(0.00512820529, 0, 0.488095254, 0)
Gain.Size = UDim2.new(0, 194, 0, 30)
Gain.Font = Enum.Font.GothamBold
Gain.Text = "0%"
Gain.TextColor3 = Color3.fromRGB(202, 202, 202)
Gain.TextSize = 29.000

Sign.Name = "Sign"
Sign.Parent = JHud
Sign.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Sign.BackgroundTransparency = 1.000
Sign.BorderSizePixel = 0
Sign.Position = UDim2.new(0, 0, 6.81428576, 0)
Sign.Size = UDim2.new(0, 200, 0, 5)
Sign.Font = Enum.Font.SourceSans
Sign.Text = "%"
Sign.TextColor3 = Color3.fromRGB(0, 0, 0)
Sign.TextSize = 14.000
Sign.TextTransparency = 1.000

-- Scripts:

local function HFEJU_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UIStroke = Instance.new("UIStroke")
	UIStroke.Parent = script.Parent
	UIStroke.Thickness = 3
	UIStroke.Color = Color3.fromRGB(75, 75, 75)
	local UserInputService = game:GetService("UserInputService")
	game:GetService("Players").LocalPlayer.PlayerGui.QBox.Frame.ImageLabel.Visible = false
	local function Gain()
		local Rot = game:GetService("Players").LocalPlayer.PlayerGui.QBox.Frame.ImageLabel.ImageLabel.Rotation
		Rot -= 180
		if Rot < 0 then
			Rot = 0
		end
		local Gain = Rot/90
		return Gain
	end
	local function SetSize(Gain)
		Gain = tonumber(Gain)
		if Gain > 1 then
			local change = Gain - 1
			Gain = 1 - change
		end
		local Move = 135 - Gain * 135
		script.Parent.Right.Size = UDim2.new(0,135*Gain,0,43)
		script.Parent.Left.Size = UDim2.new(0,135*Gain,0,43)
		script.Parent.Left.Position = UDim2.new(0.5,Move,0,0)
	end
	
	local function Color(R,G,B)
		script.Parent.Left.BackgroundColor3 = Color3.fromRGB(R,G,B)
		script.Parent.Right.BackgroundColor3 = Color3.fromRGB(R,G,B)
	end
	
	local function SetColor(Gain)
		if Gain > 1 then
			local change = Gain - 1
			Gain = 1 - change
		end
		Gain *= 100
		if Gain >= 90 then
			Color(0, 242, 255)
		elseif Gain >= 75 then
			Color(69, 255, 122)
		elseif Gain >= 60 then
			Color(255, 234, 5)
		else
			Color(255, 61, 61)
		end
	end
	local n = 0
	local t_gain = 0
	local LastY = 0
	local camera = workspace.CurrentCamera
	while game:GetService("RunService").Heartbeat:wait() do
		local X, Y, Z = camera.CFrame:ToOrientation()
		n += 1
		local Gain = Gain()
		t_gain += Gain
		if n == 2 then
			Gain = t_gain / n
			n = 0
			t_gain = 0
			SetSize(Gain)
			SetColor(Gain)
			if math.deg(Y) > LastY then
				script.Parent.Left.Visible = true
				script.Parent.Right.Visible = false
			elseif math.deg(Y) < LastY then
				script.Parent.Left.Visible = false
				script.Parent.Right.Visible = true
			else
				script.Parent.Left.Visible = false
				script.Parent.Right.Visible = false
			end
			LastY = math.deg(Y)
		end
	end
end
coroutine.wrap(HFEJU_fake_script)()
local function DLSKD_fake_script() -- Sync.LocalScript 
	local script = Instance.new('LocalScript', Sync)

	for i,v in pairs(game.Players.LocalPlayer.PlayerGui.QBox.Frame:GetDescendants()) do
		if v.ClassName == "TextLabel" and v.Text == "Sync" then
			SyncFrame = v.Parent
		end
	end
	SpeedFrame = game.Players.LocalPlayer.PlayerGui.QBox.Frame:GetChildren()[2]
	local function Color(R,G,B)
		script.Parent.TextColor3 = Color3.fromRGB(R,G,B)
	end
	
	SyncFrame.Visible = false
	while game:GetService("RunService").Heartbeat:Wait() do
		local Speed = SpeedFrame:GetChildren()[2].TextLabel.Text
		local Sync = SyncFrame:GetChildren()[2].Text
		script.Parent.Text = "Sync: " .. Sync .. "\nSpeed: " .. Speed
	end
end
coroutine.wrap(DLSKD_fake_script)()
local function PRRREV_fake_script() -- JHud.LocalScript 
	local script = Instance.new('LocalScript', JHud)

	local camera = workspace.CurrentCamera
	local UserInputService = game:GetService("UserInputService")
	local lastY = 0
	local function Gain()
		local Rot = game:GetService("Players").LocalPlayer.PlayerGui.QBox.Frame.ImageLabel.ImageLabel.Rotation
		Rot -= 180
		if Rot < 0 then
			Rot = 0
		end
		local Gain = Rot/90
		return Gain
	end
	
	local function Color(R,G,B)
		script.Parent.SS.TextColor3 = Color3.fromRGB(R,G,B)
		script.Parent.Gain.TextColor3 = Color3.fromRGB(R,G,B)
	end
	
	for i,v in pairs(game.Players.LocalPlayer.PlayerGui.QBox:GetDescendants()) do
	
		if v.ClassName == "TextLabel" and v.Text == "#" then
	
			JHud = v.Parent
	
		end
	
	end
	JHud.Visible = false
	local Strafe = JHud:GetChildren()[4].Text
	local Jump = JHud:GetChildren()[1].Text
	local Speed = JHud:GetChildren()[2].Text
	local LastJump = Jump
	local t_gain = 0
	local frames = 0
	local ShowGain = 0
	local GFrames = 0
	local ShowSync
	local LastSpeed = 0
	local dif = 0
	while game:GetService("RunService").Heartbeat:wait() do
		repeat
			local X, Y, Z = camera.CFrame:ToOrientation()
			if math.deg(Y) > lastY then
				if UserInputService:IsKeyDown(Enum.KeyCode.A) == true then
					GFrames += 1
				end
			elseif math.deg(Y) < lastY then
				if UserInputService:IsKeyDown(Enum.KeyCode.D) == true then
					GFrames += 1
				end
			end
			local Jump = JHud:GetChildren()[1].Text
			local Gain = Gain()
			if Gain > 1 then
				local change = Gain - 1
				Gain = 1 - change
			end
			Gain *= 100
			t_gain += Gain
			frames += 1
			lastY = math.deg(Y)
			game:GetService("RunService").Heartbeat:wait() 
		until Jump ~= LastJump
		ShowGain = t_gain/frames
	
		Strafe = JHud:GetChildren()[4].Text
		Jump = JHud:GetChildren()[1].Text
		Speed = JHud:GetChildren()[2].Text
		pcall(function()
		dif = tonumber(Speed) - tonumber(LastSpeed)
		dif = math.floor(dif*100)/100
		if dif >= 0 then
			dif = "+" .. dif
		end
		if Jump == 1 then
			dif = "+0"
		end
		end)
		ShowSync = GFrames/frames
		print(GFrames .. " " .. frames)
		ShowSync = math.floor(ShowSync*10000)/100
		LastJump = Jump
		t_gain = 0
		frames = 0
		GFrames = 0
		if Jump ~= "#" then
			ShowGain = math.floor(ShowGain*100)/100
			script.Parent.SS.Text = Jump .. ": " .. Speed .. " (" .. dif .. ")" .. " | (" .. Strafe .. ")"
			script.Parent.Gain.Text = ShowGain .. script.Parent.Sign.Text .. " | " .. ShowSync
			if tonumber(ShowGain) >= 80 then
				Color(0, 242, 255)
			elseif tonumber(ShowGain) >= 70 then
				Color(69, 255, 122)
			elseif tonumber(ShowGain) >= 60 then
				Color(255, 234, 5)
			else
				Color(255, 61, 61)
			end
		end
		LastSpeed = Speed
		if tonumber(LastSpeed) == nil then
			LastSpeed = 0
		end
	end
end
coroutine.wrap(PRRREV_fake_script)()
