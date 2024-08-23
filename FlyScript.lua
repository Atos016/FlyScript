local flying = false
local speed = 50
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local bodyGyro = Instance.new("BodyGyro")
local bodyVelocity = Instance.new("BodyVelocity")

local function startFlying()
    flying = true
    bodyGyro.Parent = humanoidRootPart
    bodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyVelocity.Parent = humanoidRootPart
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)

    while flying do
        local direction = Vector3.new(0, 0, 0)
        if mouse.KeyDown:FindFirstChild("w") then direction = direction + (workspace.CurrentCamera.CFrame.LookVector * speed) end
        if mouse.KeyDown:FindFirstChild("s") then direction = direction - (workspace.CurrentCamera.CFrame.LookVector * speed) end
        if mouse.KeyDown:FindFirstChild("a") then direction = direction - (workspace.CurrentCamera.CFrame.RightVector * speed) end
        if mouse.KeyDown:FindFirstChild("d") then direction = direction + (workspace.CurrentCamera.CFrame.RightVector * speed) end
        if mouse.KeyDown:FindFirstChild("space") then direction = direction + (workspace.CurrentCamera.CFrame.UpVector * speed) end
        if mouse.KeyDown:FindFirstChild("LeftControl") then direction = direction - (workspace.CurrentCamera.CFrame.UpVector * speed) end
        bodyGyro.CFrame = workspace.CurrentCamera.CFrame
        bodyVelocity.Velocity = direction
        game:GetService("RunService").Heartbeat:Wait()
    end
end

local function stopFlying()
    flying = false
    bodyGyro:Destroy()
    bodyVelocity:Destroy()
end

local function setupMenu()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FlyMenu"
    screenGui.Parent = player:WaitForChild("PlayerGui")

    local flyButton = Instance.new("TextButton")
    flyButton.Size = UDim2.new(0, 200, 0, 50)
    flyButton.Position = UDim2.new(0, 10, 0, 10)
    flyButton.Text = "Ativar Voo"
    flyButton.Parent = screenGui

    flyButton.MouseButton1Click:Connect(function()
        if not flying then
            startFlying()
            flyButton.Text = "Desativar Voo"
        else
            stopFlying()
            flyButton.Text = "Ativar Voo"
        end
    end)
end

setupMenu()
