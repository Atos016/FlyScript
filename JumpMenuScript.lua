-- Gerador de chave
local function generateKey(length)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local key = ""
    for i = 1, length do
        local randomIndex = math.random(1, #charset)
        key = key .. charset:sub(randomIndex, randomIndex)
    end
    return key
end

local generatedKey = generateKey(16)

local function isValidKey(inputKey)
    return inputKey == generatedKey
end

-- Menu visual
local Menu = Instance.new("ScreenGui")
local MenuFrame = Instance.new("Frame")
local GravityButton = Instance.new("TextButton")
local JumpButton = Instance.new("TextButton")
local KeyButton = Instance.new("TextButton")
local KeyFrame = Instance.new("Frame")
local KeyInput = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")

Menu.Name = "Menu"
Menu.Parent = game.CoreGui

MenuFrame.Name = "MenuFrame"
MenuFrame.Parent = Menu
MenuFrame.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
MenuFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MenuFrame.Size = UDim2.new(0, 300, 0, 250)

GravityButton.Name = "GravityButton"
GravityButton.Parent = MenuFrame
GravityButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
GravityButton.Position = UDim2.new(0.1, 0, 0.2, 0)
GravityButton.Size = UDim2.new(0.8, 0, 0.2, 0)
GravityButton.Text = "Set Gravity to 0"

JumpButton.Name = "JumpButton"
JumpButton.Parent = MenuFrame
JumpButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
JumpButton.Position = UDim2.new(0.1, 0, 0.5, 0)
JumpButton.Size = UDim2.new(0.8, 0, 0.2, 0)
JumpButton.Text = "Set Jump Power to 125"

KeyButton.Name = "KeyButton"
KeyButton.Parent = MenuFrame
KeyButton.BackgroundColor3 = Color3.new(0.6, 0.2, 0.2)
KeyButton.Position = UDim2.new(0.1, 0, 0.8, 0)
KeyButton.Size = UDim2.new(0.8, 0, 0.2, 0)
KeyButton.Text = "Enter Key"

KeyFrame.Name = "KeyFrame"
KeyFrame.Parent = Menu
KeyFrame.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
KeyFrame.Size = UDim2.new(0, 300, 0, 150)
KeyFrame.Visible = false

KeyInput.Name = "KeyInput"
KeyInput.Parent = KeyFrame
KeyInput.BackgroundColor3 = Color3.new(1, 1, 1)
KeyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.3, 0)
KeyInput.PlaceholderText = "Enter Key"

SubmitButton.Name = "SubmitButton"
SubmitButton.Parent = KeyFrame
SubmitButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
SubmitButton.Position = UDim2.new(0.1, 0, 0.7, 0)
SubmitButton.Size = UDim2.new(0.8, 0, 0.3, 0)
SubmitButton.Text = "Submit"

GravityButton.MouseButton1Click:Connect(function()
    if isValidKey(KeyInput.Text) then
        game.Workspace.Gravity = 0
    else
        -- Mensagem de erro
    end
end)

JumpButton.MouseButton1Click:Connect(function()
    if isValidKey(KeyInput.Text) then
        local player = game.Players.LocalPlayer
        player.Character.Humanoid.JumpPower = 125
    else
        -- Mensagem de erro
    end
end)

KeyButton.MouseButton1Click:Connect(function()
    KeyFrame.Visible = true
end)

SubmitButton.MouseButton1Click:Connect(function()
    if isValidKey(KeyInput.Text) then
        KeyFrame.Visible = false
    else
        -- Mensagem de erro
    end
end)
