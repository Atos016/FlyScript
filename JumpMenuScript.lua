local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local jumpPower = 240  -- Poder de pulo ajustado para 125
local originalJumpPower = humanoid.JumpPower
local isBoosted = false

-- Criar GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0.5, -125, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Active = true
frame.Draggable = true -- Permite arrastar
frame.Parent = screenGui

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -25, 0, 5)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Font = Enum.Font.SourceSansBold
minimizeButton.TextScaled = true
minimizeButton.Parent = frame

local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0.2, 0)
tabContainer.Position = UDim2.new(0, 0, 0.8, 0)
tabContainer.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
tabContainer.Parent = frame

local tab1 = Instance.new("TextButton")
tab1.Size = UDim2.new(0.3, 0, 1, 0)
tab1.Position = UDim2.new(0, 0, 0, 0)
tab1.Text = "Jump Boost"
tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tab1.Font = Enum.Font.SourceSansBold
tab1.TextScaled = true
tab1.Parent = tabContainer

local contentContainer = Instance.new("Frame")
contentContainer.Size = UDim2.new(1, 0, 0.6, 0)
contentContainer.Position = UDim2.new(0, 0, 0.2, 0)
contentContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
contentContainer.Parent = frame

local boostButton = Instance.new("TextButton")
boostButton.Size = UDim2.new(0.8, 0, 0.6, 0)
boostButton.Position = UDim2.new(0.1, 0, 0.2, 0)
boostButton.Text = "Activate Jump Boost"
boostButton.TextColor3 = Color3.fromRGB(255, 255, 255)
boostButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
boostButton.Font = Enum.Font.SourceSansBold
boostButton.TextScaled = true
boostButton.Parent = contentContainer

-- Lógica para alternar entre boost e pulo normal
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

-- Lógica para minimizar e maximizar
minimizeButton.MouseButton1Click:Connect(function()
    if contentContainer.Visible then
        contentContainer.Visible = false
        tabContainer.Visible = false
        frame.Size = UDim2.new(0, 250, 0, 50)
        minimizeButton.Text = "+"
    else
        contentContainer.Visible = true
        tabContainer.Visible = true
        frame.Size = UDim2.new(0, 250, 0, 150)
        minimizeButton.Text = "-"
    end
end)

-- Lógica para alternar abas (expandível para mais abas)
tab1.MouseButton1Click:Connect(function()
    contentContainer.Visible = true
    -- Adicione aqui a lógica para alternar entre diferentes abas, se necessário
end)

