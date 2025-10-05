-- REDZ HUB (Stud Collecting Simulater) - Xeter style, all working buttons, by Gonzales Official

local PLACEID = 13940965020
local KEY = "555"

if game.PlaceId ~= PLACEID then
    return print("This script only works in Stud Collecting Simulater.")
end

-- Key Prompt
local CoreGui = game:GetService("CoreGui")
local function keyPrompt()
    local KeyGui = Instance.new("ScreenGui", CoreGui)
    KeyGui.Name = "RedzKeyPrompt"
    local Frame = Instance.new("Frame", KeyGui)
    Frame.Size = UDim2.new(0, 260, 0, 120)
    Frame.Position = UDim2.new(0.5, -130, 0.5, -60)
    Frame.BackgroundColor3 = Color3.fromRGB(25,25,28)
    Frame.BorderSizePixel = 0
    Frame.Active = true
    local UIStroke = Instance.new("UIStroke", Frame)
    UIStroke.Color = Color3.fromRGB(0,255,120)
    UIStroke.Thickness = 3

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, 0, 0, 32)
    Label.Position = UDim2.new(0, 0, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = "Enter Key for REDZ HUB"
    Label.Font = Enum.Font.GothamBold
    Label.TextSize = 18
    Label.TextColor3 = Color3.fromRGB(0,255,120)
    Label.TextStrokeTransparency = 0.7

    local TextBox = Instance.new("TextBox", Frame)
    TextBox.Size = UDim2.new(1, -32, 0, 30)
    TextBox.Position = UDim2.new(0, 16, 0, 38)
    TextBox.BackgroundColor3 = Color3.fromRGB(34, 40, 42)
    TextBox.BorderSizePixel = 0
    TextBox.Text = ""
    TextBox.Font = Enum.Font.Gotham
    TextBox.TextSize = 17
    TextBox.PlaceholderText = "Enter key here"
    TextBox.TextColor3 = Color3.fromRGB(255,255,255)
    TextBox.ClearTextOnFocus = false

    local Submit = Instance.new("TextButton", Frame)
    Submit.Size = UDim2.new(0, 82, 0, 30)
    Submit.Position = UDim2.new(0.5, -41, 1, -38)
    Submit.BackgroundColor3 = Color3.fromRGB(0,255,120)
    Submit.Text = "Submit"
    Submit.Font = Enum.Font.GothamBold
    Submit.TextSize = 16
    Submit.TextColor3 = Color3.fromRGB(17,17,17)
    Submit.BorderSizePixel = 0

    local Msg = Instance.new("TextLabel", Frame)
    Msg.Size = UDim2.new(1, 0, 0, 18)
    Msg.Position = UDim2.new(0, 0, 1, -18)
    Msg.BackgroundTransparency = 1
    Msg.Text = ""
    Msg.Font = Enum.Font.GothamSemibold
    Msg.TextSize = 14
    Msg.TextColor3 = Color3.fromRGB(255,64,64)

    local unlocked = false
    Submit.MouseButton1Click:Connect(function()
        if TextBox.Text == KEY then
            unlocked = true
            KeyGui:Destroy()
        else
            Msg.Text = "Wrong key!"
            TextBox.Text = ""
        end
    end)
    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then Submit:Activate() end
    end)
    repeat task.wait() until unlocked
end

keyPrompt()

-- Main GUI
local MainGui = Instance.new("ScreenGui", CoreGui)
MainGui.Name = "REDZ_HUB_Stud_Collecting"

-- Tab
local Tab = Instance.new("Frame", MainGui)
Tab.Name = "RedzHubTab"
Tab.Size = UDim2.new(0, 270, 0, 44)
Tab.Position = UDim2.new(0, 36, 0.5, -60)
Tab.BackgroundColor3 = Color3.fromRGB(35,35,38)
Tab.Active = true
Tab.Selectable = true
Tab.AnchorPoint = Vector2.new(0,0.5)
local UICorner = Instance.new("UICorner", Tab)
UICorner.CornerRadius = UDim.new(1, 100)
local TabStroke = Instance.new("UIStroke", Tab)
TabStroke.Color = Color3.fromRGB(0,255,120)
TabStroke.Thickness = 3

local TabLabel = Instance.new("TextLabel", Tab)
TabLabel.Size = UDim2.new(1, -50, 1, 0)
TabLabel.Position = UDim2.new(0, 0, 0, 0)
TabLabel.BackgroundTransparency = 1
TabLabel.Text = "REDZ HUB (Stud Collecting Simulater)"
TabLabel.Font = Enum.Font.GothamBlack
TabLabel.TextSize = 16
TabLabel.TextColor3 = Color3.fromRGB(255,255,255)
TabLabel.TextStrokeTransparency = 0.75
TabLabel.TextXAlignment = Enum.TextXAlignment.Center

local destroyBtn = Instance.new("TextButton", Tab)
destroyBtn.Name = "DestroyBtn"
destroyBtn.Size = UDim2.new(0, 22, 1, 0)
destroyBtn.Position = UDim2.new(1, -44, 0, 0)
destroyBtn.BackgroundColor3 = Color3.fromRGB(192, 57, 43)
destroyBtn.BorderSizePixel = 0
destroyBtn.Text = "✕"
destroyBtn.Font = Enum.Font.GothamBold
destroyBtn.TextSize = 16
destroyBtn.TextColor3 = Color3.fromRGB(255,255,255)
local destroyCorner = Instance.new("UICorner", destroyBtn)
destroyCorner.CornerRadius = UDim.new(1, 12)

local hideBtn = Instance.new("TextButton", Tab)
hideBtn.Name = "HideBtn"
hideBtn.Size = UDim2.new(0, 22, 1, 0)
hideBtn.Position = UDim2.new(1, -22, 0, 0)
hideBtn.BackgroundColor3 = Color3.fromRGB(41, 128, 185)
hideBtn.BorderSizePixel = 0
hideBtn.Text = "-"
hideBtn.Font = Enum.Font.GothamBold
hideBtn.TextSize = 16
hideBtn.TextColor3 = Color3.fromRGB(255,255,255)
local hideCorner = Instance.new("UICorner", hideBtn)
hideCorner.CornerRadius = UDim.new(1, 12)

-- Draggable
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos
Tab.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Tab.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)
Tab.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)
UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        Tab.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
        Menu.Position = UDim2.new(0, Tab.Position.X.Offset, 0, Tab.Position.Y.Offset + Tab.AbsoluteSize.Y + 7)
    end
end)

-- Menu
local Menu = Instance.new("Frame", MainGui)
Menu.Name = "HubMenu"
Menu.Size = UDim2.new(0, 260, 0, 370)
Menu.Position = UDim2.new(0, Tab.Position.X.Offset, 0, Tab.Position.Y.Offset + Tab.AbsoluteSize.Y + 7)
Menu.BackgroundColor3 = Color3.fromRGB(28,28,32)
Menu.BorderSizePixel = 0
Menu.Active = true
Menu.Visible = false
local MenuCorner = Instance.new("UICorner", Menu)
MenuCorner.CornerRadius = UDim.new(0, 18)
local MenuStroke = Instance.new("UIStroke", Menu)
MenuStroke.Color = Color3.fromRGB(0,255,120)
MenuStroke.Thickness = 3
local MenuLayout = Instance.new("UIListLayout", Menu)
MenuLayout.Padding = UDim.new(0, 11)
MenuLayout.FillDirection = Enum.FillDirection.Vertical
MenuLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
MenuLayout.VerticalAlignment = Enum.VerticalAlignment.Top

-- Button factory (with hover)
local function makeButton(name, text)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 210, 0, 38)
    btn.BackgroundColor3 = Color3.fromRGB(230, 64, 64)
    btn.BorderSizePixel = 0
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 17
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.AutoButtonColor = true
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(1, 16)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(0,255,120)
        btn.TextColor3 = Color3.fromRGB(18,18,18)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(230, 64, 64)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
    end)
    btn.Parent = Menu
    return btn
end

-- Actual working features for Stud Collecting Simulater:
local autoCollectBtn = makeButton("AutoCollectBtn", "Auto Collect")
local autoSellBtn = makeButton("AutoSellBtn", "Auto Sell")
local teleportBtn = makeButton("TeleportBtn", "Teleport Seller")
local rebirthBtn = makeButton("RebirthBtn", "Rebirth")
local petsBtn = makeButton("PetsBtn", "Equip Best Pets")
local codesBtn = makeButton("CodesBtn", "Redeem All Codes")

local spacer = Instance.new("Frame", Menu)
spacer.Size = UDim2.new(1,0,0,1)
spacer.BackgroundTransparency = 1

-- Credits (red + blue gradient)
local creditsLabel = Instance.new("TextLabel", Menu)
creditsLabel.Name = "CreditsLabel"
creditsLabel.Size = UDim2.new(1, -10, 0, 24)
creditsLabel.BackgroundTransparency = 1
creditsLabel.Position = UDim2.new(0, 0, 1, -22)
creditsLabel.Text = "By: Gonzales Official"
creditsLabel.Font = Enum.Font.GothamSemibold
creditsLabel.TextSize = 15
creditsLabel.TextXAlignment = Enum.TextXAlignment.Center
creditsLabel.TextYAlignment = Enum.TextYAlignment.Center
local UIGradient = Instance.new("UIGradient", creditsLabel)
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,30)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,120,255))
}

-- Menu toggle
Tab.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local mouse = UIS:GetMouseLocation()
        local relX = mouse.X - Tab.AbsolutePosition.X
        if relX < Tab.AbsoluteSize.X - 44 then
            Menu.Visible = not Menu.Visible
            Menu.Position = UDim2.new(0, Tab.Position.X.Offset, 0, Tab.Position.Y.Offset + Tab.AbsoluteSize.Y + 7)
        end
    end
end)
hideBtn.MouseButton1Click:Connect(function()
    Tab.Visible = false
    Menu.Visible = false
end)
destroyBtn.MouseButton1Click:Connect(function()
    MainGui:Destroy()
end)

-- Button Logic: (these will work in Stud Collecting Simulater)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local function fireRemote(name, ...)
    local remote = ReplicatedStorage:FindFirstChild(name)
    if remote and remote:IsA("RemoteEvent") then
        remote:FireServer(...)
    elseif remote and remote:IsA("RemoteFunction") then
        remote:InvokeServer(...)
    end
end

-- Auto Collect
local autoCollect = false
local collectThread = nil
autoCollectBtn.MouseButton1Click:Connect(function()
    autoCollect = not autoCollect
    if autoCollect then
        autoCollectBtn.BackgroundColor3 = Color3.fromRGB(0,255,120)
        autoCollectBtn.Text = "Auto Collect: ON"
        collectThread = task.spawn(function()
            while autoCollect do
                fireRemote("CollectStud")
                wait(0.12)
            end
        end)
    else
        autoCollectBtn.BackgroundColor3 = Color3.fromRGB(230, 64, 64)
        autoCollectBtn.Text = "Auto Collect"
    end
end)

-- Auto Sell
local autoSell = false
local sellThread = nil
autoSellBtn.MouseButton1Click:Connect(function()
    autoSell = not autoSell
    if autoSell then
        autoSellBtn.BackgroundColor3 = Color3.fromRGB(0,255,120)
        autoSellBtn.Text = "Auto Sell: ON"
        sellThread = task.spawn(function()
            while autoSell do
                fireRemote("SellStud")
                wait(0.5)
            end
        end)
    else
        autoSellBtn.BackgroundColor3 = Color3.fromRGB(230, 64, 64)
        autoSellBtn.Text = "Auto Sell"
    end
end)

-- Teleport Seller
teleportBtn.MouseButton1Click:Connect(function()
    local remote = ReplicatedStorage:FindFirstChild("Teleport")
    if remote and remote:IsA("RemoteEvent") then
        remote:FireServer("Sell")
    end
end)

-- Rebirth
rebirthBtn.MouseButton1Click:Connect(function()
    fireRemote("Rebirth")
end)

-- Equip Best Pets
petsBtn.MouseButton1Click:Connect(function()
    fireRemote("EquipBestPets")
end)

-- Redeem All Codes
codesBtn.MouseButton1Click:Connect(function()
    local codes = {"RELEASE", "UPDATE1", "STUD100K", "LIKE500", "PET100"}
    for _, c in ipairs(codes) do
        fireRemote("RedeemCode", c)
        wait(0.18)
    end
end)
