local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local flying = false
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
        if player:GetMouse().KeyDown:FindFirstChild("w") then direction = direction + (workspace.CurrentCamera.CFrame.LookVector * 50) end
        if player:GetMouse().KeyDown:FindFirstChild("s") then direction = direction - (workspace.CurrentCamera.CFrame.LookVector * 50) end
        if player:GetMouse().KeyDown:FindFirstChild("a") then direction = direction - (workspace.CurrentCamera.CFrame.RightVector * 50) end
        if player:GetMouse().KeyDown:FindFirstChild("d") then direction = direction + (workspace.CurrentCamera.CFrame.RightVector * 50) end
        if player:GetMouse().KeyDown:FindFirstChild("space") then direction = direction + (workspace.CurrentCamera.CFrame.UpVector * 50) end
        if player:GetMouse().KeyDown:FindFirstChild("LeftControl") then direction = direction - (workspace.CurrentCamera.CFrame.UpVector * 50) end
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

local function onChatMessage(message)
    if message:lower() == "/fly" then
        if not flying then
            startFlying()
            player:Chat("Voo ativado!")
        else
            stopFlying()
            player:Chat("Voo desativado!")
        end
    end
end

game.Players.LocalPlayer.Chatted:Connect(onChatMessage)
