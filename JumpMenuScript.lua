local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local jumpPower = 125  -- Poder de pulo ajustado para 125
local originalJumpPower = humanoid.JumpPower
local originalGravity = workspace.Gravity
local isBoosted = false
local isGravityZero = false
local moveSpeed = 50  -- Velocidade de movimento para gravidade 0

-- Criar GUI principal
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
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
tab1.Size = UDim2.new(0.5, 0, 1, 0)
tab1.Position = UDim2.new(0, 0, 0, 0)
tab1.Text = "Jump Boost"
tab1.TextColor3 = Color3.fromRGB(255, 255, 255)
tab1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tab1.Font = Enum.Font.SourceSansBold
tab1.TextScaled = true
tab1.Parent = tabContainer

local tab2 = Instance.new("TextButton")
tab2.Size = UDim2.new(0.5, 0, 1, 0)
tab2.Position = UDim2.new(0.5, 0, 0, 0)
tab2.Text = "Gravity Control"
tab2.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tab2.Font = Enum.Font.SourceSansBold
tab2.TextScaled = true
tab2.Parent = tabContainer

local tab3 = Instance.new("TextButton")
tab3.Size = UDim2.new(1, 0, 0.2, 0)
tab3.Position = UDim2.new(0, 0, 0, 0)
tab3.Text = "Delete Tool"
tab3.TextColor3 = Color3.fromRGB(255, 255, 255)
tab3.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tab3.Font = Enum.Font.SourceSansBold
tab3.TextScaled = true
tab3.Parent = tabContainer

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

local gravityButton = Instance.new("TextButton")
gravityButton.Size = UDim2.new(0.8, 0, 0.6, 0)
gravityButton.Position = UDim2.new(0.1, 0, 0.2, 0)
gravityButton.Text = "Set Gravity to 0"
gravityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
gravityButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
gravityButton.Font = Enum.Font.SourceSansBold
gravityButton.TextScaled = true
gravityButton.Parent = contentContainer

local deleteButton = Instance.new("TextButton")
deleteButton.Size = UDim2.new(0.8, 0, 0.6, 0)
deleteButton.Position = UDim2.new(0.1, 0, 0.2, 0)
deleteButton.Text = "Equip Delete Tool"
deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
deleteButton.Font = Enum.Font.SourceSansBold
deleteButton.TextScaled = true
deleteButton.Parent = contentContainer

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

-- Lógica para alternar entre gravidade normal e 0
gravityButton.MouseButton1Click:Connect(function()
    if not isGravityZero then
        workspace.Gravity = 0
        gravityButton.Text = "Set Gravity to 196.2"  -- Valor padrão de gravidade
        isGravityZero = true
        -- Adicionar força personalizada para movimentação
        local bodyVelocity = Instance.new("BodyVelocity")
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)  -- Inicialmente sem movimento
        bodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)  -- Força máxima para mover o personagem
        bodyVelocity.Parent = character:WaitForChild("HumanoidRootPart")
    else
        workspace.Gravity = originalGravity
        gravityButton.Text = "Set Gravity to 0"
        isGravityZero = false
        -- Remover força personalizada
        local bodyVelocity = character:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            bodyVelocity:Destroy()
        end
    end
end)

-- Lógica para equipar ferramenta de deletar partes
local function equipDeleteTool()
    local tool = Instance.new("Tool")
    tool.Name = "DeleteTool"
    tool.RequiresHandle = false
    tool.Parent = player.Backpack

    tool.Activated:Connect(function()
        local mouse = player:GetMouse()
        local target = mouse.Target
        if target and target:IsA("BasePart") then
            target:Destroy()
        end
    end)
end

deleteButton.MouseButton1Click:Connect(equipDeleteTool)

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
        frame.Size = UDim2.new(0, 250, 0, 200)
        minimizeButton.Text = "-"
    end
end)

-- Lógica para alternar abas
tab1.MouseButton1Click:Connect(function()
    contentContainer.Visible = true
    boostButton.Visible = true
    gravityButton.Visible = false
    deleteButton.Visible = false
end)

tab2.MouseButton1Click:Connect(function()
    contentContainer.Visible = true
    boostButton.Visible = false
    gravityButton.Visible = true
    deleteButton.Visible = false
end)

tab3.MouseButton1Click:Connect(function()
    contentContainer.Visible = true
    boostButton.Visible = false
    gravityButton.Visible = false
    deleteButton.Visible = true
end)

-- Adicionar controle de movimento personalizado para gravidade 0
game:GetService("RunService").RenderStepped:Connect(function()
    if isGravityZero then
        local bodyVelocity = character:FindFirstChildOfClass("BodyVelocity")
        if bodyVelocity then
            -- Movimento básico com as teclas WASD
            local moveVector = Vector3.new(
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) and 1 or 0),
                0,
                (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) and 1 or 0) - (game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) and 1 or 0)
            ).unit * moveSpeed
            bodyVelocity.Velocity = moveVector
        end
    end
end)
