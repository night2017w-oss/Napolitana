-- Napolitana Hub - Edição Completa (Anti-Lag Pro Da Hood)
local CoreGui = game:GetService("CoreGui")
local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

-- Prevenção Anti-AFK Integrada
LocalPlayer.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), Camera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), Camera.CFrame)
end)

-- 1. Criar ScreenGui Principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NapolitanaHubGUI"
screenGui.ResetOnSpawn = false

local parentTarget = (gethui and gethui()) or CoreGui
screenGui.Parent = parentTarget

-- 2. Botão Fixo Toggle UI
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

-- 3. Janela Principal (Main Frame)
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

-- TÍTULO DA JANELA
local hubTitle = Instance.new("TextLabel")
hubTitle.Size = UDim2.new(1, 0, 0, 22)
hubTitle.Position = UDim2.new(0, 0, 0, 4)
hubTitle.BackgroundTransparency = 1
hubTitle.Text = "NAPOLITANA HUB"
hubTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
hubTitle.Font = Enum.Font.FredokaOne
hubTitle.TextSize = 14
hubTitle.Parent = mainFrame

-- 4. Barra Superior de Navegação
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
        if active me
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

-- 5. ABA MAIN (CONFIGURAÇÕES)

-- ANTILAG AVANÇADO DA HOOD
local antiLagConnection = nil

createOption(mainContent, "ANTILAG DA HOOD", 10, function(state)
    if state then
        -- Desativa iluminação pesada
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 9e9
        Lighting.Technology = Enum.Technology.Compatibility

        if workspace:FindFirstChildOfClass("Terrain") then
            local terrain = workspace:FindFirstChildOfClass("Terrain")
            terrain.WaterWaveSize = 0
            terrain.WaterWaveSpeed = 0
            terrain.WaterReflectance = 0
            terrain.WaterTransparency = 0
        end

        for _, effect in pairs(Lighting:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("BlurEffect") or effect:IsA("BloomEffect") or effect:IsA("SunRaysEffect") then
                effect.Enabled = false
            end
        end

        -- Limpa texturas do mapa e objetos pesados
        task.spawn(function()
            local items = workspace:GetDescendants()
            for i, part in ipairs(items) do
                if part:IsA("BasePart") then
                    part.Material = Enum.Material.SmoothPlastic
                    part.CastShadow = false
                elseif part:IsA("Decal") or part:IsA("Texture") then
                    part.Transparency = 1
                elseif part:IsA("ParticleEmitter") or part:IsA("Trail") or part:IsA("Smoke") or part:IsA("Fire") or part:IsA("Sparkles") then
                    part.Enabled = false
                end

                if i % 150 == 0 then
                    task.wait()
                end
            end
        end)

        -- Loop de Limpeza de Tiros, Marcas e Objetos Soltos (Específico para Da Hood)
        antiLagConnection = RunService.Heartbeat:Connect(function()
            -- Limpa cápsulas de bala, tiros soltos e marcas de sangue no chão
            local ignoredFolder = workspace:FindFirstChild("Ignored")
            if ignoredFolder then
                for _, obj in pairs(ignoredFolder:GetChildren()) do
                    if obj.Name == "Bullet" or obj.Name == "Shell" or obj.Name == "Blood" or obj:IsA("Debris") then
                        obj:Destroy()
                    end
                end
            end

            -- Desativa efeitos visuais gerados por armas
            for _, p in pairs(workspace:GetChildren()) do
                if p.Name == "Ray" or p.Name == "Impact" or p.Name == "BulletHole" then
                    p:Destroy()
                end
            end
        end)
    else
        Lighting.GlobalShadows = true
        Lighting.FogEnd = 1000
        if antiLagConnection then
            antiLagConnection:Disconnect()
            antiLagConnection = nil
        end
    end
end)

-- SPEED
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
        mainFrameSpeed.BorderSizePixel = 0
        mainFrameSpeed.Parent = speedGuiInstance

        local cornerSpeed = Instance.new("UICorner")
        cornerSpeed.CornerRadius = UDim.new(0, 6)
        cornerSpeed.Parent = mainFrameSpeed

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

-- CAMLOCK
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
textLabel.TextStrokeTransparency = 0

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
        
        local btnCorner = Instance.new("UICorner", lockButton)
        btnCorner.CornerRadius = UDim.new(0, 30)

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

-- HITBOX EXTENDER
local hitboxEnabled = false
local headSize = 20

createOption(mainContent, "HITBOX EXTENDER", 100, function(state)
    hitboxEnabled = state
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
hitboxBox.ClearTextOnFocus = false
hitboxBox.Parent = mainContent

Instance.new("UICorner", hitboxBox).CornerRadius = UDim.new(0, 4)
local hbStroke = Instance.new("UIStroke")
hbStroke.Color = Color3.fromRGB(225, 110, 150)
hbStroke.Thickness = 1
hbStroke.Parent = hitboxBox

hitboxBox:GetPropertyChangedSignal("Text"):Connect(function()
    local val = tonumber(hitboxBox.Text)
    if val then
        headSize = val
    end
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

-- 6. CAIXA PARA LOCALIZAR AMIGOS (ESP NICK)

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
searchBox.Text = ""
searchBox.PlaceholderText = "Ex: NomeDoAmigo..."
searchBox.PlaceholderColor3 = Color3.fromRGB(150, 130, 120)
searchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBox.Font = Enum.Font.FredokaOne
searchBox.TextSize = 13
searchBox.ClearTextOnFocus = false
searchBox.Parent = mainContent

Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 6)
local searchStroke = Instance.new("UIStroke")
searchStroke.Color = Color3.fromRGB(225, 110, 150)
searchStroke.Thickness = 1
searchStroke.Parent = searchBox

local activeHighlights = {}

local function removeHighlights()
    for _, gui in pairs(activeHighlights) do
        if gui then gui:Destroy() end
    end
    activeHighlights = {}
end

local function applyTracker(targetPlayer)
    if not targetPlayer.Character then return end
    local head = targetPlayer.Character:FindFirstChild("Head")
    if not head then return end

    if head:FindFirstChild("FriendTrackerGui") then
        head.FriendTrackerGui:Destroy()
    end

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
    nameLabel.Text = "★ " .. targetPlayer.DisplayName .. " (@" .. targetPlayer.Name .. ")"
    nameLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    nameLabel.Font = Enum.Font.FredokaOne
    nameLabel.TextSize = 16
    nameLabel.Parent = billboard

    table.insert(activeHighlights, billboard)
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    removeHighlights()
    local textQuery = string.lower(searchBox.Text)
    
    if textQuery == "" then return end

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local name = string.lower(p.Name)
            local displayName = string.lower(p.DisplayName)

            if string.find(name, textQuery) or string.find(displayName, textQuery) then
                applyTracker(p)
            end
        end
    end
end)

-- 7. ABA NÉVOA
local fogLabel = Instance.new("TextLabel")
fogLabel.Size = UDim2.new(1, -40, 0, 20)
fogLabel.Position = UDim2.new(0, 20, 0, 10)
fogLabel.BackgroundTransparency = 1
fogLabel.Text = "NÉVOA PERSON
