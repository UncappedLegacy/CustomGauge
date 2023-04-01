-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Right = Instance.new("Frame")
local Left = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local UIStroke = Instance.new("UIStroke")
local UIStroke_2 = Instance.new("UIStroke")

--Properties:

ScreenGui.Parent = game.CoreGui

Holder.Name = "Holder"
Holder.Parent = ScreenGui
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderSizePixel = 0
Holder.Position = UDim2.new(0.5, -200, 0.169269338, 0)
Holder.Size = UDim2.new(0, 400, 0, 200)

Frame.Parent = Holder
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderSizePixel = 0
Frame.ClipsDescendants = true
Frame.Position = UDim2.new(0.5, -125, 0.5, -17)
Frame.Size = UDim2.new(0, 250, 0, 35)

Right.Name = "Right"
Right.Parent = Frame
Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Right.BorderSizePixel = 0
Right.Position = UDim2.new(0, 0, -0.128571436, 0)
Right.Size = UDim2.new(0, 125, 0, 43)

Left.Name = "Left"
Left.Parent = Frame
Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Left.BorderSizePixel = 0
Left.Position = UDim2.new(0.5, 0, -0, 0)
Left.Size = UDim2.new(0, 125, 0, 43)

Frame_2.Parent = Holder
Frame_2.BackgroundColor3 = Color3.fromRGB(155, 155, 155)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.5, -1, 0.5, -22)
Frame_2.Size = UDim2.new(0, 2, 0, 44)

UIStroke.Parent = Frame
UIStroke.Color = Color3.fromRGB(75,75,75)
UIStroke.Thickness = 3

UIStroke_2.Parent = Frame_2
UIStroke_2.Color = Color3.fromRGB(75,75,75)
UIStroke_2.Thickness = 1

-- Scripts:

local function ZJBWNP_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

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
		local Move = 125 - Gain * 125
		script.Parent.Right.Size = UDim2.new(0,125*Gain,0,43)
		script.Parent.Left.Size = UDim2.new(0,125*Gain,0,43)
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
		if Gain >= 80 then
			Color(0, 242, 255)
		elseif Gain >= 70 then
			Color(69, 255, 122)
		elseif Gain >= 60 then
			Color(255, 234, 5)
		else
			Color(255, 61, 61)
		end
	end
	local n = 0
	local t_gain = 0
	while game:GetService("RunService").Heartbeat:wait() do
		n += 1
		local Gain = Gain()
		t_gain += Gain
		if n == 2 then
			Gain = t_gain / n
			n = 0
			t_gain = 0
		SetSize(Gain)
		SetColor(Gain)
		if UserInputService:IsKeyDown(Enum.KeyCode.A) == true then
			script.Parent.Left.Visible = true
			script.Parent.Right.Visible = false
		elseif UserInputService:IsKeyDown(Enum.KeyCode.D) == true then
			script.Parent.Left.Visible = false
			script.Parent.Right.Visible = true
		else
			script.Parent.Left.Visible = false
			script.Parent.Right.Visible = false
		end
		end
	end
end
coroutine.wrap(ZJBWNP_fake_script)()
