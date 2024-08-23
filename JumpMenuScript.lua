-- Baixe e execute o script do GitHub para criar um menu visual
loadstring(game:HttpGet("https://raw.githubusercontent.com/Atos016/FlyScript/main/FlyScript.lua", true))()

-- Crie o menu principal
local MainMenu = Instance.new("ScreenGui")
local MenuFrame = Instance.new("Frame")
local FlyButton = Instance.new("TextButton")
local WallWalkButton = Instance.new("TextButton")
local JumpPowerButton = Instance.new("TextButton")

MainMenu.Name = "MainMenu"
MainMenu.Parent = game.CoreGui

MenuFrame.Name = "MenuFrame"
MenuFrame.Parent = MainMenu
MenuFrame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
MenuFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
MenuFrame.Size = UDim2.new(0, 200, 0, 300)

FlyButton.Name = "FlyButton"
FlyButton.Parent = MenuFrame
FlyButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
FlyButton.Position = UDim2.new(0.1, 0, 0.1, 0)
FlyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
FlyButton.Text = "Fly"

WallWalkButton.Name = "WallWalkButton"
WallWalkButton.Parent = MenuFrame
WallWalkButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
WallWalkButton.Position = UDim2.new(0.1, 0, 0.4, 0)
WallWalkButton.Size = UDim2.new(0.8, 0, 0.2, 0)
WallWalkButton.Text = "Wall Walk"

JumpPowerButton.Name = "JumpPowerButton"
JumpPowerButton.Parent = MenuFrame
JumpPowerButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
JumpPowerButton.Position = UDim2.new(0.1, 0, 0.7, 0)
JumpPowerButton.Size = UDim2.new(0.8, 0, 0.2, 0)
JumpPowerButton.Text = "Jump Power: 125"

-- Funções para cada botão
FlyButton.MouseButton1Click:Connect(function()
    -- Script para ativar/desativar o voo
    print("Toggle Fly")
end)

WallWalkButton.MouseButton1Click:Connect(function()
    -- Script para ativar/desativar andar nas paredes
    print("Toggle Wall Walk")
end)

JumpPowerButton.MouseButton1Click:Connect(function()
    -- Script para ajustar o poder do pulo
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.JumpPower = 125
        print("Jump Power set to 125")
    end
end)
