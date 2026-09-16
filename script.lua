-- =========================================================================
-- PAULETEX CUSTOM UI | PROJETADO EXCLUSIVAMENTE PARA: Name 🫡
-- =========================================================================

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Remove interface anterior se houver
if CoreGui:FindFirstChild("PauletexCustomUI") then
    CoreGui.PauletexCustomUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PauletexCustomUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- ==================== TELA DE KEY ====================
local KeyGui = Instance.new("Frame")
KeyGui.Size = UDim2.new(0, 350, 0, 220)
KeyGui.Position = UDim2.new(0.5, -175, 0.5, -110)
KeyGui.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
KeyGui.BorderSizePixel = 0
KeyGui.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 12)
KeyCorner.Parent = KeyGui

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(138, 43, 226)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyGui

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "🔐 LOGIN DE ACESSO - NAME 🫡"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyGui

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.8, 0, 0, 45)
KeyBox.Position = UDim2.new(0.1, 0, 0, 70)
KeyBox.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "Digite a Key (Name)..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 14
KeyBox.Font = Enum.Font.Gotham
KeyBox.Parent = KeyGui

local KeyBoxCorner = Instance.new("UICorner")
KeyBoxCorner.CornerRadius = UDim.new(0, 8)
KeyBoxCorner.Parent = KeyBox

local KeyBtn = Instance.new("TextButton")
KeyBtn.Size = UDim2.new(0.8, 0, 0, 40)
KeyBtn.Position = UDim2.new(0.1, 0, 0, 135)
KeyBtn.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
KeyBtn.BorderSizePixel = 0
KeyBtn.Text = "ENTRAR NO PAINEL"
KeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBtn.TextSize = 14
KeyBtn.Font = Enum.Font.GothamBold
KeyBtn.Parent = KeyGui

local KeyBtnCorner = Instance.new("UICorner")
KeyBtnCorner.CornerRadius = UDim.new(0, 8)
KeyBtnCorner.Parent = KeyBtn

-- ==================== PAINEL PRINCIPAL (OCULTO ATÉ A KEY) ====================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 380)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(138, 43, 226)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Topbar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 14)
TopBarCorner.Parent = TopBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, -20, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡ PAULETEX HUB | CLIENTE VIP: NAME 🫡"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TopBar

-- Container de Funções (ScrollingFrame)
local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -60)
Scroll.Position = UDim2.new(0, 10, 0, 52)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.CanvasSize = UDim2.new(0, 0, 0, 650)
Scroll.ScrollBarThickness = 4
Scroll.Parent = MainFrame

local UIList = Instance.new("UIListLayout")
UIList.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIList.SortOrder = Enum.SortOrder.LayoutOrder
UIList.Padding = UDim.new(0, 10)
UIList.Parent = Scroll

-- Função para criar botões de Toggle bonitos
local function CreateToggle(name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 42)
    btn.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
    btn.BorderSizePixel = 0
    btn.Text = "   " .. name .. " [ DESLIGADO ]"
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamSemibold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        if active then
            btn.BackgroundColor3 = Color3.fromRGB(75, 0, 130)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Text = "   " .. name .. " [ LIGADO ]"
        else
            btn.BackgroundColor3 = Color3.fromRGB(22, 22, 32)
            btn.TextColor3 = Color3.fromRGB(200, 200, 200)
            btn.Text = "   " .. name .. " [ DESLIGADO ]"
        end
        callback(active)
    end)
end

-- ==================== CONFIGURAÇÃO DE VARIÁVEIS & MODS ====================
local Settings = {
    ESPBox = false,
    ESPLine = false,
    ESPInfo = false,
    Aimbot = false,
    GodMode = false,
    InfiniteJump = false,
    AntiFling = false,
    Speed = false,
    Fly = false
}

-- 1. NOTIFICAÇÃO DE BOAS-VINDAS
local function ShowWelcomeNotification()
    local Notif = Instance.new("TextLabel")
    Notif.Size = UDim2.new(0, 400, 0, 60)
    Notif.Position = UDim2.new(0.5, -200, 0, -80)
    Notif.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    Notif.TextColor3 = Color3.fromRGB(255, 255, 255)
    Notif.TextSize = 14
    Notif.Font = Enum.Font.GothamBold
    Notif.Text = "Bem vindo Name 🫡 seja bem vindo chefe\nvocê e o dono e obgd por ser cliente"
    Notif.Parent = ScreenGui

    local nCorner = Instance.new("UICorner")
    nCorner.CornerRadius = UDim.new(0, 10)
    nCorner.Parent = Notif

    local nStroke = Instance.new("UIStroke")
    nStroke.Color = Color3.fromRGB(138, 43, 226)
    nStroke.Thickness = 2
    nStroke.Parent = Notif

    -- Tween para descer e subir
    Notif:TweenPosition(UDim2.new(0.5, -200, 0, 30), "Out", "Quad", 0.5, true)
    task.delay(4, function()
        Notif:TweenPosition(UDim2.new(0.5, -200, 0, -80), "In", "Quad", 0.5, true)
        task.wait(0.5)
        Notif:Destroy()
    end)
end

-- Lógica do Botão da Key
KeyBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "Name" then
        KeyGui:Destroy()
        MainFrame.Visible = true
        ShowWelcomeNotification()
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "Key incorreta! Tente 'Name'"
    end
end)

-- 2. ESP SYSTEM (Box, Line, Nome Completo, Vida)
local function CreateESP(p)
    local boxOutline = Drawing.new("Square")
    boxOutline.Visible = false; boxOutline.Thickness = 3; boxOutline.Filled = false
    local box = Drawing.new("Square")
    box.Visible = false; box.Thickness = 1; box.Filled = false
    local line = Drawing.new("Line")
    line.Visible = false; line.Thickness = 1.5; line.Color = Color3.fromRGB(255, 255, 255)
    local text = Drawing.new("Text")
    text.Visible = false; text.Size = 13; text.Center = true; text.Outline = true; text.Font = 2

    RunService.RenderStepped:Connect(function()
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") then
            local char = p.Character
            local root = char.HumanoidRootPart
            local head = char.Head
            local hum = char.Humanoid

            if hum.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                if onScreen then
                    local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                    local legPos = Camera:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
                    local height = math.abs(headPos.Y - legPos.Y)
                    local width = height * 0.65

                    -- ESP Box
                    if Settings.ESPBox then
                        boxOutline.Size = Vector2.new(width, height)
                        boxOutline.Position = Vector2.new(pos.X - width / 2, headPos.Y)
                        boxOutline.Color = Color3.fromRGB(0, 0, 0)
                        boxOutline.Visible = true

                        box.Size = Vector2.new(width, height)
                        box.Position = Vector2.new(pos.X - width / 2, headPos.Y)
                        box.Color = Color3.fromRGB(138, 43, 226)
                        box.Visible = true
                    else
                        boxOutline.Visible = false
                        box.Visible = false
                    end

                    -- ESP Line (Tracer)
                    if Settings.ESPLine then
                        line.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        line.To = Vector2.new(pos.X, pos.Y)
                        line.Visible = true
                    else
                        line.Visible = false
                    end

                    -- ESP Nome Completo & Vida
                    if Settings.ESPInfo then
                        text.Text = p.Name .. " [" .. math.floor(hum.Health) .."HP]"
                        text.Position = Vector2.new(pos.X, headPos.Y - 18)
                        text.Color = Color3.fromRGB(255, 255, 255)
                        text.Visible = true
                    else
                        text.Visible = false
                    end
                else
                    boxOutline.Visible = false; box.Visible = false; line.Visible = false; text.Visible = false
                end
            else
                boxOutline.Visible = false; box.Visible = false; line.Visible = false; text.Visible = false
            end
        else
            boxOutline.Visible = false; box.Visible = false; line.Visible = false; text.Visible = false
        end
    end)
end

for _, p in pairs(Players:GetPlayers()) do if p ~= LocalPlayer then CreateESP(p) end end
Players.PlayerAdded:Connect(function(p) if p ~= LocalPlayer then CreateESP(p) end end)

-- ==================== CRIANDO OS BOTÕES NO PAINEL ====================
CreateToggle("ESP Box", function(v) Settings.ESPBox = v end)
CreateToggle("ESP Line (Tracer)", function(v) Settings.ESPLine = v end)
CreateToggle("ESP Nome Completo + Vida", function(v) Settings.ESPInfo = v end)

-- Aimbot Suave
CreateToggle("Aimbot Suave", function(v) Settings.Aimbot = v end)
RunService.RenderStepped:Connect(function()
    if Settings.Aimbot then
        local target, shortest = nil, math.huge
        local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character.Humanoid.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if dist < shortest then target = p.Character.HumanoidRootPart; shortest = dist end
                end
            end
        end
        if target then
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Position), 0.15)
        end
    end
end)

-- God Mode (Regenera vida instantaneamente)
CreateToggle("God Mode", function(v) Settings.GodMode = v end)
RunService.Stepped:Connect(function()
    if Settings.GodMode and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
    end
end)

-- Speed
CreateToggle("Super Speed", function(v) Settings.Speed = v end)
RunService.Stepped:Connect(function()
    if Settings.Speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = 40
    end
end)

-- Infinite Jump
CreateToggle("Infinite Jump", function(v) Settings.InfiniteJump = v end)
UserInputService.JumpRequest:Connect(function()
    if Settings.InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- Anti-Fling
CreateToggle("Anti-Fling", function(v) Settings.AntiFling = v end)
RunService.Stepped:Connect(function()
    if Settings.AntiFling and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
        LocalPlayer.Character.HumanoidRootPart.RotVelocity = Vector3.new(0, 0, 0)
    end
end)

-- Fly Extremo (Puxado do script Universal Fly Gui V3 que você mandou)
CreateToggle("Fly Extremo (Máximo)", function(v)
    Settings.Fly = v
    if v then
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Fly-Gui-V3-15837"))()
        end)
    end
end)
