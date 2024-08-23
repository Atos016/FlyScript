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

-- Configuração do GUI
gui.Parent = player.PlayerGui
gui.Name = "CustomMenu"
gui.ResetOnSpawn = false

mainFrame.Parent = gui
mainFrame.Size = UDim2.new(0, 200, 0, 250)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 1
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)

-- Função para criar botões
local function createButton(name, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = mainFrame
    button.Size = UDim2.new(1, -10, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Text = name
    button.TextSize = 18
    button.AutoButtonColor = false
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Adicionando os botões
gravityButton = createButton("Toggle Gravity", UDim2.new(0, 5, 0, 5), function()
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

jumpButton = createButton("Toggle Jump Power", UDim2.new(0, 5, 0, 60), function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        humanoid.JumpPower = humanoid.JumpPower == 50 and 125 or 50
    end
end)

deleteButton = createButton("Delete Tool", UDim2.new(0, 5, 0, 115), function()
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

banButton = createButton("Ban Player", UDim2.new(0, 5, 0, 170), function()
    local targetPlayer = game.Players:FindFirstChild(player.Name)
    if targetPlayer then
        targetPlayer:Kick("Você foi banido!")
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
