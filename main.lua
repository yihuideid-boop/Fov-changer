local playerGui = game.Players.LocalPlayer.PlayerGui

local UIS = game:GetService("UserInputService")

local FovGui = Instance.new("ScreenGui")
FovGui.Parent = playerGui

local FovFrame = Instance.new("Frame")
FovFrame.Parent = FovGui
FovFrame.Position = UDim2.new(0.305, 0,0.389, 0)
FovFrame.Size = UDim2.new(0, 496,0, 190)
FovFrame.Visible = false

local FovButton = Instance.new("TextButton")
FovButton.Parent = FovFrame
FovButton.Position = UDim2.new(0.087, 0,0.2, 0)
FovButton.Size = UDim2.new(0, 410,0, 50)
FovButton.Text = "Fov + 10"
FovButton.MouseButton1Click:Connect(function()
	local FOV = 10
	game.Workspace.CurrentCamera.FieldOfView += FOV
end)

local FovBackButton = Instance.new("TextButton")
FovBackButton.Parent = FovFrame
FovBackButton.Position = UDim2.new(0.087, 0,0.568, 0)
FovBackButton.Size = UDim2.new(0, 410,0, 50)
FovBackButton.Text = "Fov - 10"
FovBackButton.MouseButton1Click:Connect(function()
	local FOV = 10
	game.Workspace.CurrentCamera.FieldOfView -= FOV
end)

UIS.InputBegan:Connect(function(input, processed)
	if processed then return end
	if input.KeyCode == Enum.KeyCode.LeftAlt then
		FovFrame.Visible = not FovFrame.Visible
	end
end)
