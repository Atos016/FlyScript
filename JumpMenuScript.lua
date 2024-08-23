-- Script combinado com funções de gravidade 0, pulo, ferramenta de deletar partes do mapa e ferramenta de banir

-- Definindo o menu
local menu = Instance.new("ScreenGui")
local frame = Instance.new("Frame")
local gravityButton = Instance.new("TextButton")
local jumpButton = Instance.new("TextButton")
local deleteButton = Instance.new("TextButton")
local banButton = Instance.new("TextButton")
local playerNameTextBox = Instance.new("TextBox")

menu.Name = "Menu"
menu.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

frame.Name = "Frame"
frame.Parent = menu
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0

gravityButton.Name = "GravityButton"
gravityButton.Parent = frame
gravityButton.Size = UDim2.new(1, 0, 0, 40)
gravityButton.Position = UDim2.new(0, 0, 0, 0)
gravityButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
gravityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gravityButton.Text = "Gravidade 0"
gravityButton.MouseButton1Click:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.PlatformStand = true
            character.HumanoidRootPart.Anchored = false
            character.HumanoidRootPart.CanCollide = false
        end
    end
end)

jumpButton.Name = "JumpButton"
jumpButton.Parent = frame
jumpButton.Size = UDim2.new(1, 0, 0, 40)
jumpButton.Position = UDim2.new(0, 0, 0, 40)
jumpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
jumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpButton.Text = "Pulo 125"
jumpButton.MouseButton1Click:Connect(function()
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.JumpPower = 125
        end
    end
end)

deleteButton.Name = "DeleteButton"
deleteButton.Parent = frame
deleteButton.Size = UDim2.new(1, 0, 0, 40)
deleteButton.Position = UDim2.new(0, 0, 0, 80)
deleteButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteButton.Text = "Deletar Partes"
deleteButton.MouseButton1Click:Connect(function()
    local deleteTool = Instance.new("Tool")
    deleteTool.Name = "DeleteTool"
    deleteTool.RequiresHandle = true
    deleteTool.Parent = game.Players.LocalPlayer.Backpack

    local handle = Instance.new("Part")
    handle.Name = "Handle"
    handle.Size = Vector3.new(1, 1, 1)
    handle.Parent = deleteTool

    deleteTool.Activated:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local target = mouse.Target
        if target and target:IsA("BasePart") then
            target:Destroy()
        end
    end)
end)

playerNameTextBox.Name = "PlayerNameTextBox"
playerNameTextBox.Parent = frame
playerNameTextBox.Size = UDim2.new(1, 0, 0, 40)
playerNameTextBox.Position = UDim2.new(0, 0, 0, 120)
playerNameTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerNameTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
playerNameTextBox.PlaceholderText = "Nome do jogador"

banButton.Name = "BanButton"
banButton.Parent = frame
banButton.Size = UDim2.new(1, 0, 0, 40)
banButton.Position = UDim2.new(0, 0, 0, 160)
banButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
banButton.TextColor3 = Color3.fromRGB(255, 255, 255)
banButton.Text = "Banir Jogador"
banButton.MouseButton1Click:Connect(function()
    local playerName = playerNameTextBox.Text
    local playerToBan = game.Players:FindFirstChild(playerName)
    if playerToBan then
        playerToBan:Kick("Você foi banido do servidor.")
    else
        print("Jogador não encontrado.")
    end
end)

-- Ferramenta de banir
local banTool = Instance.new("Tool")
banTool.Name = "BanTool"
banTool.RequiresHandle = true
banTool.Parent = game.Players.LocalPlayer.Backpack

local banHandle = Instance.new("Part")
banHandle.Name = "Handle"
banHandle.Size = Vector3.new(1, 1, 1)
banHandle.Parent = banTool

banTool.Activated:Connect(function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local target = mouse.Target
    if target and target:IsA("Player") then
        target:Kick("Você foi banido do servidor.")
    end
end)
