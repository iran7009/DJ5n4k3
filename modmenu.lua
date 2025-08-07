--[[
    UNIVERSAL MOD MENU
    Funciona em PC e Mobile
    100% funcional para servidor privado
    By ChatGPT
--]]

-- Criar GUI principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UniversalModMenu"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Frame principal
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 220, 0, 300)
Frame.Position = UDim2.new(0.05, 0, 0.25, 0)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

-- Arredondar bordas
local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Título
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Title.Text = "⚡ Universal Mod Menu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = Frame
Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 10)

-- Botão recolher
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Position = UDim2.new(1, -45, 0, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleButton.Text = "-"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.Font = Enum.Font.GothamBold
ToggleButton.TextSize = 18
ToggleButton.Parent = Title
Instance.new("UICorner", ToggleButton).CornerRadius = UDim.new(0, 10)

-- Área de botões
local ButtonHolder = Instance.new("Frame")
ButtonHolder.Size = UDim2.new(1, 0, 1, -40)
ButtonHolder.Position = UDim2.new(0, 0, 0, 40)
ButtonHolder.BackgroundTransparency = 1
ButtonHolder.Parent = Frame

-- Layout
local UIListLayout = Instance.new("UIListLayout", ButtonHolder)
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Função para criar botões
local function CriarBotao(texto, func)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = texto
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = ButtonHolder
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.MouseButton1Click:Connect(func)
end

-- Funções de exemplo
local function VelocidadeAlta()
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = 100
    end
end

local function PuloAlto()
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.JumpPower = 150
    end
end

local function TeleportSpawn()
    if workspace:FindFirstChild("SpawnLocation") and game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:MoveTo(workspace.SpawnLocation.Position)
    end
end

local function FecharMenu()
    ScreenGui:Destroy()
end

-- Criar botões no menu
CriarBotao("🚀 Velocidade Alta", VelocidadeAlta)
CriarBotao("🦘 Pulo Alto", PuloAlto)
CriarBotao("📍 Teleport Spawn", TeleportSpawn)
CriarBotao("❌ Fechar Menu", FecharMenu)

-- Função recolher menu
local recolhido = false
ToggleButton.MouseButton1Click:Connect(function()
    recolhido = not recolhido
    if recolhido then
        for _, v in pairs(ButtonHolder:GetChildren()) do
            if v:IsA("TextButton") then
                v.Visible = false
            end
        end
        Frame.Size = UDim2.new(0, 220, 0, 40)
        ToggleButton.Text = "+"
    else
        for _, v in pairs(ButtonHolder:GetChildren()) do
            if v:IsA("TextButton") then
                v.Visible = true
            end
        end
        Frame.Size = UDim2.new(0, 220, 0, 300)
        ToggleButton.Text = "-"
    end
end)
