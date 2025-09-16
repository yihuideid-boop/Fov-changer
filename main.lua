local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- GUI の重複を防ぐ
if playerGui:FindFirstChild("FovGui") then
	playerGui.FovGui:Destroy()
end

local FovGui = Instance.new("ScreenGui")
FovGui.Name = "FovGui"
FovGui.Parent = playerGui

local FovFrame = Instance.new("Frame")
FovFrame.Name = "FovFrame"
FovFrame.Parent = FovGui
FovFrame.Position = UDim2.new(0.305, 0, 0.389, 0)
FovFrame.Size = UDim2.new(0, 496, 0, 190)
FovFrame.Visible = false

-- +10 ボタン
local FovButton = Instance.new("TextButton")
FovButton.Name = "FovButton"
FovButton.Parent = FovFrame
FovButton.Position = UDim2.new(0.087, 0, 0.2, 0)
FovButton.Size = UDim2.new(0, 410, 0, 50)
FovButton.Text = "Fov + 10"
FovButton.MouseButton1Click:Connect(function()
	local camera = workspace.CurrentCamera
	local newFov = camera.FieldOfView + 10
	if newFov > 120 then newFov = 120 end
	camera.FieldOfView = newFov
end)

-- -10 ボタン
local FovBackButton = Instance.new("TextButton")
FovBackButton.Name = "FovBackButton"
FovBackButton.Parent = FovFrame
FovBackButton.Position = UDim2.new(0.087, 0, 0.568, 0)
FovBackButton.Size = UDim2.new(0, 410, 0, 50)
FovBackButton.Text = "Fov - 10"
FovBackButton.MouseButton1Click:Connect(function()
	local camera = workspace.CurrentCamera
	local newFov = camera.FieldOfView - 10
	if newFov < 1 then newFov = 1 end
	camera.FieldOfView = newFov
end)

-- LeftAlt で開閉
UIS.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.LeftAlt then
		FovFrame.Visible = not FovFrame.Visible
	end
end)
