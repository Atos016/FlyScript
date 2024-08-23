local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local jumpPower = 50
local originalJumpPower = humanoid.JumpPower
local isBoosted = false

local function createMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.Parent = screenGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.Text = "Jump Boost Menu"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextScaled = true
    titleLabel.Parent = frame

    local boostButton = Instance.new("TextButton")
    boostButton.Size = UDim2.new(0.8, 0, 0.4, 0)
    boostButton.Position = UDim2.new(0.1, 0, 0.5, 0)
    boostButton.Text = "Activate Jump Boost"
    boostButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    boostButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    boostButton.Font = Enum.Font.SourceSansBold
    boostButton.TextScaled = true
    boostButton.Parent = frame

    boostButton.MouseButton1Click:Connect(function()
        if not isBoosted then
            humanoid.JumpPower = jumpPower
            boostButton.Text = "Deactivate Jump Boost"
            isBoosted = true
        else
            humanoid.JumpPower = originalJumpPower
            boostButton.Text = "Activate Jump Boost"
            isBoosted = false
        end
    end)
end

createMenu()
