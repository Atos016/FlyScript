-- Criação do Menu
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local gui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local gravityButton = Instance.new("TextButton")
local jumpButton = Instance.new("TextButton")
local deleteButton = Instance.new("TextButton")
local banButton = Instance.new("TextButton")
local deleteTool = Instance.new("Tool")
local toolsFrame = Instance.new("Frame")

-- Configuração do GUI
gui.Parent = player.PlayerGui
gui.Name = "CustomMenu"
gui.ResetOnSpawn = false

mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 200, 0, 300)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0

-- Configuração dos Botões
local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = mainFrame
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.TextSize = 18
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Funções dos Botões
gravityButton.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        if humanoid.PlatformStand then
            humanoid.PlatformStand = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        else
            humanoid.PlatformStand = true
        end
    end
end)

jumpButton.MouseButton1Click:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        humanoid.JumpPower = humanoid.JumpPower == 50 and 125 or 50
    end
end)

deleteButton.MouseButton1Click:Connect(function()
    local tool = Instance.new("Tool")
    tool.Name = "DeleteTool"
    tool.RequiresHandle = false
    tool.Parent = player.Backpack

    tool.Activated:Connect(function()
        local target = mouse.Target
        if target and target:IsA("BasePart") then
            target:Destroy()
        end
    end)
end)

banButton.MouseButton1Click:Connect(function()
    local playerName = player.Name
    local targetPlayerName = game.Players:FindFirstChild(playerName)
    if targetPlayerName then
        targetPlayerName:Kick("Você foi banido!")
    end
end)

-- Configuração da Ferramenta de Deletar Partes
deleteTool.Name = "DeleteTool"
deleteTool.RequiresHandle = false
deleteTool.Activated:Connect(function()
    local target = mouse.Target
    if target and target:IsA("BasePart") then
        target:Destroy()
    end
end)

-- Movendo o Menu
local dragging = false
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        update(input)
    end
end)
