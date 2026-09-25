-- Napolitana Hub - PARTE 1
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Variável Global para Manter a Cor da Névoa
local savedFogColor = nil

-- Prevenção Anti-AFK
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
end)

-- Interface Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NapolitanaHubGUI"
screenGui.ResetOnSpawn = false

local parentTarget = (gethui and gethui()) or CoreGui
screenGui.Parent = parentTarget

-- Botão Toggle UI
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 95, 0, 32)
toggleButton.Position = UDim2.new(0, 10, 0, 70)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 30, 25)
toggleButton.Text = "Toggle UI"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.FredokaOne
toggleButton.TextSize = 14
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(0, 6)
toggleCorner.Parent = toggleButton

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(225, 110, 150)
toggleStroke.Thickness = 1.5
toggleStroke.Parent = toggleButton

-- Janela Principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 340, 0, 340)
mainFrame.Position = UDim2.new(0.5, -170, 0.4, -170)
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

local mainGradient = Instance.new("UIGradient")
mainGradient.Rotation = 45
mainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.0, Color3.fromRGB(45, 28, 22)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(215, 95, 135)),
    ColorSequenceKeypoint.new(1.0, Color3.fromRGB(245, 225, 195))
})
mainGradient.Parent = mainFrame

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = Color3.fromRGB(255, 255, 255)
mainStroke.Thickness = 1.5
mainStroke.Transparency = 0.3
mainStroke.Parent = mainFrame

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Título
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 22)
hubTitle.Position = UDim2.new(0, 0, 0, 4)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "NAPOLITANA HUB"
hubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
hubTitle.Font = Enum.Font.FredokaOne
hubTitle.TextSize = 14
hubTitle.Parent = mainFrame

-- Abas
local tabHolder = Instance.new("Frame")
tabHolder.Size = UDim2.new(1, -20, 0, 28)
tabHolder.Position = UDim2.new(0, 10, 0, 28)
tabHolder.BackgroundTransparency = 1
tabHolder.Parent = mainFrame

local tabMain = Instance.new("TextButton")
tabMain.Size = UDim2.new(0.48, 0, 1, 0)
tabMain.Position = UDim2.new(0, 0, 0, 0)
tabMain.BackgroundColor3 = Color3.fromRGB(225, 90, 130)
tabMain.Text = "Main"
tabMain.TextColor3 = Color3.fromRGB(255, 255, 255)
tabMain.Font = Enum.Font.FredokaOne
tabMain.TextSize = 13
tabMain.Parent = tabHolder
Instance.new("UICorner", tabMain).CornerRadius = UDim.new(0, 6)

local tabSettings = Instance.new("TextButton")
tabSettings.Size = UDim2.new(0.48, 0, 1, 0)
tabSettings.Position = UDim2.new(0.52, 0, 0, 0)
tabSettings.BackgroundColor3 = Color3.fromRGB(40, 25, 20)
tabSettings.Text = "Névoa"
tabSettings.TextColor3 = Color3.fromRGB(200, 200, 200)
tabSettings.Font = Enum.Font.FredokaOne
tabSettings.TextSize = 13
tabSettings.Parent = tabHolder
Instance.new("UICorner", tabSettings).CornerRadius = UDim.new(0, 6)

local mainContent = Instance.new("Frame")
mainContent.Size = UDim2.new(1, 0, 1, -60)
mainContent.Position = UDim2.new(0, 0, 0, 60)
mainContent.BackgroundTransparency = 1
mainContent.Parent = mainFrame

local settingsContent = Instance.new("Frame")
settingsContent.Size = UDim2.new(1, 0, 1, -60)
settingsContent.Position = UDim2.new(0, 0, 0, 60)
settingsContent.BackgroundTransparency = 1
settingsContent.Visible = false
settingsContent.Parent = mainFrame

tabMain.MouseButton1Click:Connect(function()
    mainContent.Visible = true
    settingsContent.Visible = false
    tabMain.BackgroundColor3 = Color3.fromRGB(225, 90, 130)
    tabMain.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabSettings.BackgroundColor3 = Color3.fromRGB(40, 25, 20)
    tabSettings.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

tabSettings.MouseButton1Click:Connect(function()
    mainContent.Visible = false
    settingsContent.Visible = true
    tabSettings.BackgroundColor3 = Color3.fromRGB(225, 90, 130)
    tabSettings.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabMain.BackgroundColor3 = Color3.fromRGB(40, 25, 20)
    tabMain.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

local function createOption(parent, name, posY, callback)
    local box = Instance.new("TextButton")
    box.Size = UDim2.new(0, 22, 0, 22)
    box.Position = UDim2.new(0, 20, 0, posY)
    box.BackgroundColor3 = Color3.fromRGB(40, 25, 20)
    box.Text = ""
    box.Parent = parent

    Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(255, 240, 210)
    stroke.Thickness = 1
    stroke.Parent = box

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 240, 0, 22)
    label.Position = UDim2.new(0, 52, 0, posY)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.FredokaOne
    label.TextSize = 13
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = parent

    local active = false
    box.MouseButton1Click:Connect(function()
        active = not active
        if active then
            box.Text = "✓"
            box.TextColor3 = Color3.fromRGB(255, 255, 255)
            box.BackgroundColor3 = Color3.fromRGB(225, 90, 130)
        else
            box.Text = ""
            box.BackgroundColor3 = Color3.fromRGB(40, 25, 20)
        end
        callback(active)
    end)
end

-- 1. ANTILAG
local antiLagConnection = nil
createOption(mainContent, "ANTILAG DA HOOD", 10, function(state)
    if state then
        Lighting.GlobalShadows = false
        Lighting.Technology = Enum.Technology.Compatibility
        if savedFogColor == nil then
            Lighting.FogEnd = 9e9
        end

        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("BlurEffect") or effect:IsA("BloomEffect") or effect:IsA("SunRaysEffect") then
                effect.Enabled = false
            end
        end

        antiLagConnection = RunService.Heartbeat:Connect(function()
            local ignoredFolder = workspace:FindFirstChild("Ignored")
            if ignoredFolder then
                for _, obj in pairs(ignoredFolder:GetChildren()) do
                    if obj.Name == "Bullet" or obj.Name == "Shell" or obj.Name == "Blood" or obj:IsA("Debris") then
                        obj:Destroy()
                    end
                end
            end
        end)
    else
        Lighting.GlobalShadows = true
        if antiLagConnection then
            antiLagConnection:Disconnect()
            antiLagConnection = nil
        end
    end
end)

-- 2. SPEED
local maxSpeed = 167
local speedEnabled = false
local speedGuiInstance = nil

RunService.RenderStepped:Connect(function()
    if speedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = maxSpeed
    end
end)

createOption(mainContent, "SPEED", 40, function(state)
    if state then
        speedGuiInstance = Instance.new("ScreenGui")
        speedGuiInstance.Name = "BroderSpeedGui"
        speedGuiInstance.ResetOnSpawn = false
        speedGuiInstance.Parent = parentTarget

        local mainFrameSpeed = Instance.new("Frame")
        mainFrameSpeed.Size = UDim2.new(0, 130, 0, 35)
        mainFrameSpeed.Position = UDim2.new(1, -150, 0, 45) 
        mainFrameSpeed.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        mainFrameSpeed.BackgroundTransparency = 0.4
        mainFrameSpeed.Parent = speedGuiInstance

        local speedButton = Instance.new("TextButton")
        speedButton.Size = UDim2.new(1, 0, 1, 0)
        speedButton.BackgroundTransparency = 1
        speedButton.Text = "SPEED: OFF"
        speedButton.TextColor3 = Color3.fromRGB(255, 50, 50)
        speedButton.Font = Enum.Font.SourceSansBold
        speedButton.TextSize = 16
        speedButton.Parent = mainFrameSpeed

        speedButton.MouseButton1Click:Connect(function()
            speedEnabled = not speedEnabled
            if speedEnabled then
                speedButton.Text = "SPEED: ON"
                speedButton.TextColor3 = Color3.fromRGB(50, 255, 50)
            else
                speedButton.Text = "SPEED: OFF"
                speedButton.TextColor3 = Color3.fromRGB(255, 50, 50)
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                    LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
                end
            end
        end)
    else
        speedEnabled = false
        if speedGuiInstance then
            speedGuiInstance:Destroy()
            speedGuiInstance = nil
        end
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = 16
        end
    end
end)
-- Napolitana Hub - PARTE 2

-- 3. CAMLOCK
local camlockAtivo = false
local alvoAtual = nil
local PREDICT = 0.138
local camlockGuiInstance = nil

local highlight = Instance.new("Highlight")
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.FillTransparency = 0.5

local nameTag = Instance.new("BillboardGui")
nameTag.Size = UDim2.new(0, 200, 0, 50)
nameTag.AlwaysOnTop = true

local textLabel = Instance.new("TextLabel", nameTag)
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.TextScaled = true

local function obterAlvoProximo()
    local melhorAlvo = nil
    local menorDistancia = 500
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local pos, naTela = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
            if naTela then
                local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if dist < menorDistancia then
                    menorDistancia = dist
                    melhorAlvo = p.Character
                end
            end
        end
    end
    return melhorAlvo
end

RunService.RenderStepped:Connect(function()
    if camlockAtivo and alvoAtual and alvoAtual:FindFirstChild("HumanoidRootPart") then
        local root = alvoAtual.HumanoidRootPart
        local posPredict = root.Position + (root.AssemblyLinearVelocity * PREDICT)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, posPredict)
        highlight.Parent = alvoAtual
        nameTag.Parent = root
        textLabel.Text = alvoAtual.Name
    else
        highlight.Parent = nil
        nameTag.Parent = nil
    end
end)

createOption(mainContent, "CAMLOCK", 70, function(state)
    if state then
        camlockGuiInstance = Instance.new("ScreenGui")
        camlockGuiInstance.Name = "BroderCamlockGui"
        camlockGuiInstance.ResetOnSpawn = false
        camlockGuiInstance.Parent = parentTarget

        local lockButton = Instance.new("TextButton", camlockGuiInstance)
        lockButton.Size = UDim2.new(0, 60, 0, 60)
        lockButton.Position = UDim2.new(0.8, -70, 0.5, -30)
        lockButton.Text = "🔒"
        lockButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Instance.new("UICorner", lockButton).CornerRadius = UDim.new(0, 30)

        lockButton.MouseButton1Click:Connect(function()
            camlockAtivo = not camlockAtivo
            if camlockAtivo then
                alvoAtual = obterAlvoProximo()
                lockButton.Text = "🔓"
                lockButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            else
                alvoAtual = nil
                lockButton.Text = "🔒"
                lockButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            end
        end)
    else
        camlockAtivo = false
        alvoAtual = nil
        if camlockGuiInstance then
            camlockGuiInstance:Destroy()
            camlockGuiInstance = nil
        end
    end
end)

-- 4. HITBOX EXTENDER
local hitboxEnabled = false
local headSize = 20

local function resetHitboxes()
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            pcall(function()
                local hrp = v.Character.HumanoidRootPart
                hrp.Size = Vector3.new(2, 2, 1)
                hrp.Transparency = 1
            end)
        end
    end
end

createOption(mainContent, "HITBOX EXTENDER", 100, function(state)
    hitboxEnabled = state
    if not state then
        resetHitboxes()
    end
end)

local hitboxBox = Instance.new("TextBox")
hitboxBox.Name = "HitboxSizeBox"
hitboxBox.Size = UDim2.new(0, 60, 0, 22)
hitboxBox.Position = UDim2.new(0, 260, 0, 100)
hitboxBox.BackgroundColor3 = Color3.fromRGB(30, 20, 15)
hitboxBox.Text = tostring(headSize)
hitboxBox.TextColor3 = Color3.fromRGB(255, 255, 255)
hitboxBox.Font = Enum.Font.FredokaOne
hitboxBox.TextSize = 12
hitboxBox.Parent = mainContent

hitboxBox:GetPropertyChangedSignal("Text"):Connect(function()
    local val = tonumber(hitboxBox.Text)
    if val then headSize = val end
end)

RunService.RenderStepped:Connect(function()
    if hitboxEnabled then
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    local hrp = v.Character.HumanoidRootPart
                    hrp.Size = Vector3.new(headSize, headSize, headSize)
                    hrp.Transparency = 0.7
                    hrp.BrickColor = BrickColor.new("Really black")
                    hrp.Material = Enum.Material.Neon
                    hrp.CanCollide = false
                end)
            end
        end
    end
end)

-- 5. LOCALIZAR AMIGOS (ESP DISPLAY + HP)
local searchLabel = Instance.new("TextLabel")
searchLabel.Size = UDim2.new(1, -40, 0, 18)
searchLabel.Position = UDim2.new(0, 20, 0, 138)
searchLabel.BackgroundTransparency = 1
searchLabel.Text = "LOCALIZAR AMIGO (DIGITE O NICK):"
searchLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
searchLabel.Font = Enum.Font.FredokaOne
searchLabel.TextSize = 12
searchLabel.TextXAlignment = Enum.TextXAlignment.Left
searchLabel.Parent = mainContent

local searchBox = Instance.new("TextBox")
searchBox.Name = "SearchFriendBox"
searchBox.Size = UDim2.new(1, -40, 0, 28)
searchBox.Position = UDim2.new(0, 20, 0, 160)
searchBox.BackgroundColor3 = Color3.fromRGB(30, 20, 15)
searchBox.PlaceholderText = "Ex: NomeDoAmigo..."
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Font = Enum.Font.FredokaOne
searchBox.TextSize = 13
searchBox.Parent = mainContent

local trackedPlayers = {}
local charConnections = {}

local function removeHighlights()
    for _, item in pairs(trackedPlayers) do
        if item.gui then item.gui:Destroy() end
        if item.conn then item.conn:Disconnect() end
    end
    trackedPlayers = {}
    for _, conn in pairs(charConnections) do conn:Disconnect() end
    charConnections = {}
end

local function applyTracker(targetPlayer)
    local function attach(char)
        if not char then return end
        local head = char:WaitForChild("Head", 5)
        local hum = char:WaitForChild("Humanoid", 5)
        if not head or not hum then return end

        if head:FindFirstChild("FriendTrackerGui") then head.FriendTrackerGui:Destroy() end

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "FriendTrackerGui"
        billboard.Adornee = head
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = head

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
        nameLabel.TextStrokeTransparency = 0
        nameLabel.Font = Enum.Font.FredokaOne
        nameLabel.TextSize = 16
        nameLabel.Parent = billboard

        local function updateHealth()
            local hp = math.floor(hum.Health)
            local maxHp = math.floor(hum.MaxHealth)
            nameLabel.Text = "★ " .. targetPlayer.DisplayName .. " [" .. hp .. "/" .. maxHp .. " HP]"
        end

        updateHealth()
        local hpConn = hum.HealthChanged:Connect(updateHealth)
        trackedPlayers[targetPlayer] = {gui = billboard, conn = hpConn}
    end

    if targetPlayer.Character then task.spawn(function() attach(targetPlayer.Character) end) end
    local cConn = targetPlayer.CharacterAdded:Connect(function(newChar) task.spawn(function() attach(newChar) end) end)
    table.insert(charConnections, cConn)
end

local function updateSearch()
    removeHighlights()
    local textQuery = string.lower(searchBox.Text)
    if textQuery == "" then return end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            if string.find(string.lower(p.Name), textQuery) or string.find(string.lower(p.DisplayName), textQuery) then
                applyTracker(p)
            end
        end
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(updateSearch)

LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if searchBox.Text ~= "" then
        updateSearch()
    end
end)

-- 6. NÉVOA (COM MEMÓRIA DE RENASCIMENTO)
local fogLabel = Instance.new("TextLabel")
fogLabel.Size = UDim2.new(1, -40, 0, 20)
fogLabel.Position = UDim2.new(0, 20, 0, 10)
fogLabel.BackgroundTransparency = 1
fogLabel.Text = "NÉVOA PERSONALIZADA:"
fogLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fogLabel.Font = Enum.Font.FredokaOne
fogLabel.TextSize = 14
fogLabel.TextXAlignment = Enum.TextXAlignment.Left
fogLabel.Parent = settingsContent

local colors = {
    {name = "Rosa", color = Color3.fromRGB(255, 105, 180)},
    {name = "Azul", color = Color3.fromRGB(0, 191, 255)},
    {name = "Roxo", color = Color3.fromRGB(148, 0, 211)},
    {name = "Verde", color = Color3.fromRGB(50, 205, 50)},
    {name = "Vermelho", color = Color3.fromRGB(255, 50, 50)},
    {name = "Sem Névoa", color = nil}
}

local function applyFog()
    if savedFogColor then
        Lighting.FogColor = savedFogColor
        Lighting.FogStart = 0
        Lighting.FogEnd = 300
    else
        Lighting.FogEnd = 9e9
    end
end

for i, item in ipairs(colors) do
    local row = math.floor((i - 1) / 3)
    local col = (i - 1) % 3

    local colorBtn = Instance.new("TextButton")
    colorBtn.Size = UDim2.new(0, 85, 0, 35)
    colorBtn.Position = UDim2.new(0, 20 + (col * 95), 0, 40 + (row * 45))
    colorBtn.BackgroundColor3 = item.color or Color3.fromRGB(30, 30, 30)
    colorBtn.Text = item.name
    colorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    colorBtn.Font = Enum.Font.FredokaOne
    colorBtn.TextSize = 12
    colorBtn.Parent = settingsContent

    Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0, 6)

    colorBtn.MouseButton1Click:Connect(function()
        savedFogColor = item.color
        applyFog()
    end)
end

RunService.RenderStepped:Connect(function()
    if savedFogColor then
        Lighting.FogColor = savedFogColor
        Lighting.FogStart = 0
        Lighting.FogEnd = 300
    end
end)
