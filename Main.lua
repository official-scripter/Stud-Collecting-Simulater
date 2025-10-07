-- Rainbow GUI Script for Stud Collecting Simulator

-- Create the main UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 200)
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 0.5
Frame.Parent = ScreenGui

-- Function to generate rainbow colors
local function getRainbowColor()
    local time = tick()
    local r = math.sin(time * 2) * 127 + 128
    local g = math.sin(time * 2 + math.pi / 2) * 127 + 128
    local b = math.sin(time * 2 + math.pi) * 127 + 128
    return Color3.fromRGB(r, g, b)
end

-- Create Auto Farm button
local AutoFarmButton = Instance.new("TextButton")
AutoFarmButton.Size = UDim2.new(0, 260, 0, 50)
AutoFarmButton.Position = UDim2.new(0, 20, 0, 20)
AutoFarmButton.Text = "Auto Farm"
AutoFarmButton.Font = Enum.Font.SourceSans
AutoFarmButton.TextSize = 24
AutoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmButton.BackgroundColor3 = getRainbowColor()
AutoFarmButton.Parent = Frame

-- Create Auto Sell button
local AutoSellButton = Instance.new("TextButton")
AutoSellButton.Size = UDim2.new(0, 260, 0, 50)
AutoSellButton.Position = UDim2.new(0, 20, 0, 80)
AutoSellButton.Text = "Auto Sell"
AutoSellButton.Font = Enum.Font.SourceSans
AutoSellButton.TextSize = 24
AutoSellButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoSellButton.BackgroundColor3 = getRainbowColor()
AutoSellButton.Parent = Frame

-- Function to simulate Auto Farm
local function autoFarm()
    while true do
        -- Add your auto farm logic here
        wait(1)
    end
end

-- Function to simulate Auto Sell
local function autoSell()
    while true do
        -- Add your auto sell logic here
        wait(1)
    end
end

-- Button click events
AutoFarmButton.MouseButton1Click:Connect(function()
    autoFarm()
end)

AutoSellButton.MouseButton1Click:Connect(function()
    autoSell()
end)

-- Update button colors to create rainbow effect
while true do
    AutoFarmButton.BackgroundColor3 = getRainbowColor()
    AutoSellButton.BackgroundColor3 = getRainbowColor()
    wait(0.1)
end
