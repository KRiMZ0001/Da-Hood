local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game:GetService("CoreGui")

local TotalCashEarnedLabel = Instance.new("TextLabel")
TotalCashEarnedLabel.Name = "TotalCashEarnedLabel"
TotalCashEarnedLabel.Size = UDim2.new(0, 200, 0, 50)
TotalCashEarnedLabel.Position = UDim2.new(0.8, 0, 0, 0)
TotalCashEarnedLabel.Font = Enum.Font.SourceSans
TotalCashEarnedLabel.TextSize = 20
TotalCashEarnedLabel.TextColor3 = Color3.new(1, 1, 1)
TotalCashEarnedLabel.BackgroundTransparency = 0.5
TotalCashEarnedLabel.Text = "Total cash earned: 0"
TotalCashEarnedLabel.Parent = ScreenGui

local player = game:GetService("Players").LocalPlayer
local startingCurrency = player.DataFolder.Currency.Value

local function updateCashEarnedLabel()
    local endingCurrency = player.DataFolder.Currency.Value
    local totalCashEarned = endingCurrency - startingCurrency
    local formattedCashEarned
    if totalCashEarned >= 1000 then
        formattedCashEarned = string.format("%0.0f", totalCashEarned):reverse():gsub("%d%d%d", "%1,"):reverse()
    else
        formattedCashEarned = tostring(totalCashEarned)
    end
    TotalCashEarnedLabel.Text = "Total cash earned: " .. formattedCashEarned
end

updateCashEarnedLabel()

player.DataFolder.Currency.Changed:Connect(updateCashEarnedLabel)
