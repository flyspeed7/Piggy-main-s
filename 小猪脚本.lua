local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()

local OpenUI = Instance.new("ScreenGui") 
local ImageButton = Instance.new("ImageButton") 
local UICorner = Instance.new("UICorner") 
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
ImageButton.Parent = OpenUI 
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 67, 175) 
ImageButton.BackgroundTransparency = 0.500 
ImageButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
ImageButton.Size = UDim2.new(0, 50, 0, 50) 
ImageButton.Image = "rbxassetid://16060333448" 
ImageButton.Draggable = true 
UICorner.CornerRadius = UDim.new(0, 200) 
UICorner.Parent = ImageButton 
ImageButton.MouseButton1Click:Connect(function() 
  if uihide == false then
	uihide = true
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
else
	uihide = false
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
		end 
		
end)

uihide = false

local win = lib:Window("NOOB-Team 小凌",Color3.fromRGB(255, 154, 0), Enum.KeyCode.RightControl) 

local XX = win:Tab("信息栏")

XX:Label("服务器ID：" .. game.GameId .. ".")
XX:Label("你的名称："..game.Players.LocalPlayer.DisplayName.."")
XX:Label("你的用户名："..game.Players.LocalPlayer.Name.."")
XX:Label("你的注入器："..identifyexecutor().."")

XX:Button("IY指令",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local esp = win:Tab("绘制页面")

esp:Toggle("绘制物品", false, function(state)
print("加载完成")
              local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
 
local function createESP(player)
    local ESP = Drawing.new("Circle")
    ESP.Radius = 5
    ESP.Color = Color3.fromRGB(255, 0, 0)
    ESP.Thickness = 2
    ESP.Transparency = 0.5
    ESP.Visible = false
 
    local NameTag = Drawing.new("Text")
    NameTag.Size = 10
    NameTag.Color = Color3.fromRGB(255, 255, 255)
    NameTag.Visible = false
 
    local function updateESP()
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local position, onScreen = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
 
            ESP.Position = Vector2.new(position.X, position.Y)
            ESP.Visible = onScreen
 
            NameTag.Position = Vector2.new(position.X, position.Y + 50) -- Adjust the Y offset as needed
            NameTag.Visible = onScreen
            NameTag.Text = player.Name
        else
            ESP.Visible = false
            NameTag.Visible = false
        end
    end
 
    game:GetService("RunService").RenderStepped:Connect(updateESP)
end
 
-- Loop through all the players in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end
 
-- Update ESP for new players joining the game
Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)
 
-- Remove ESP for players leaving the game
Players.PlayerRemoving:Connect(function(player)
    -- TODO: Remove ESP for the player that left the game
end)
end)

esp:Toggle("绘制玩家", false, function(state)
local function ApplyESP(v)
   if v.Character and v.Character:FindFirstChildOfClass'Humanoid' then
       v.Character.Humanoid.NameDisplayDistance = 9e9
       v.Character.Humanoid.NameOcclusion = "NoOcclusion"
       v.Character.Humanoid.HealthDisplayDistance = 9e9
       v.Character.Humanoid.HealthDisplayType = "AlwaysOn"
       v.Character.Humanoid.Health = v.Character.Humanoid.Health -- triggers changed
   end
end
for i,v in pairs(game.Players:GetPlayers()) do
   ApplyESP(v)
   v.CharacterAdded:Connect(function()
       task.wait(0.33)
       ApplyESP(v)
   end)
end

game.Players.PlayerAdded:Connect(function(v)
   ApplyESP(v)
   v.CharacterAdded:Connect(function()
       task.wait(0.33)
       ApplyESP(v)
   end)
end)
end)

local tab = win:Tab("杂项")

tab:Toggle("改速度/30速度", false, function(state)
print("你的速度被更改为 30")
              game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 30

local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)  
end)

tab:Toggle("穿墙[自由开关]", false, function(state)
print("button pressed")
              
              local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
end)

tab:Button("自动互动物品 gui[点击开启]",function()
--[[Credits to the Owner :)]]--

local PiggyGui = Instance.new("ScreenGui")
PiggyGui.Name = "Piggy 挂"
PiggyGui.Parent = game.StarterGui

local ScrollingFrame = Instance.new("ScrollingFrame", PiggyGui)
ScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ScrollingFrame.Position = UDim2.new(0.08, 0, 0.42, 0)
ScrollingFrame.Size = UDim2.new(0, 296, 0, 388)




local PiggyGui = Instance.new("ScreenGui")
PiggyGui.Name = "Piggy 挂"
PiggyGui.Parent = game.CoreGui

local ScrollingFrame = Instance.new("ScrollingFrame", PiggyGui)
ScrollingFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
ScrollingFrame.Position = UDim2.new(0.08, 0, 0.42, 0)
ScrollingFrame.Size = UDim2.new(0, 296, 0, 388)

local UIGridLayout = Instance.new("UIGridLayout", ScrollingFrame)
UIGridLayout.CellSize = UDim2.new(0,90,0,90)

while wait(1) do
local a = workspace:getDescendants()
local items = {}
local itemframes = ScrollingFrame:getChildren()
for i=1,#itemframes do
if itemframes[i].ClassName == "文本按钮" then
itemframes[i]:remove()
end
end
for i=1,#a do
if a[i].Name == "自动互动物品" and a[i].Parent:findFirstChild("ClickDetector") then
table.insert(items, a[i].Parent)
end
end
for i=1,#items do
local ItemFrame = Instance.new("文本按钮", ScrollingFrame)
ItemFrame.Name = "ItemFrame"
ItemFrame.BackgroundColor3 = Color3.new(1, 1, 1)
ItemFrame.BackgroundTransparency = 0.95
ItemFrame.Size = UDim2.new(0, 100, 0, 100)
ItemFrame.Text = ""
local View = Instance.new("查看框架", ItemFrame)
View.Name = "查看"
View.Size = UDim2.new(1,0,1,0)
View.BackgroundTransparency = 1
View.BorderSizePixel = 0
local object = items[i]
local viewportclone = object:Clone()
viewportclone.Parent = View
local cam = Instance.new("Camera", viewportclone)
cam.CameraType = Enum.CameraType.Fixed
local objectPosition = object.Position
local cameraPosition = objectPosition + Vector3.new(0,3,0)
cam.CoordinateFrame = CFrame.new(cameraPosition, objectPosition)
View.CurrentCamera = cam

ItemFrame.MouseButton1Down:connect(function()
if items[i]:findFirstChild("ClickDetector") then
local cpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(0.05)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = items[i].CFrame
wait(0.1)
fireclickdetector(items[i].ClickDetector)
wait(0.3)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = cpos
end
end)
end
end
end)

tab:Toggle("无敌模式[开]", false, function(state)
G.GodMode = true

while _G.GodMode == true do
	wait()
game.Players.LocalPlayer.Character.Head.CanTouch = false
game.Players.LocalPlayer.Character.LeftFoot.CanTouch = false
game.Players.LocalPlayer.Character.RightFoot.CanTouch = false
game.Players.LocalPlayer.Character.RightHand.CanTouch = false
game.Players.LocalPlayer.Character.LeftHand.CanTouch = false
game.Players.LocalPlayer.Character.RightLowerLeg.CanTouch = false
game.Players.LocalPlayer.Character.RightUpperLeg.CanTouch = false
game.Players.LocalPlayer.Character.LeftLowerLeg.CanTouch = false
game.Players.LocalPlayer.Character.LeftUpperLeg.CanTouch = false
game.Players.LocalPlayer.Character.LeftLowerArm.CanTouch = false
game.Players.LocalPlayer.Character.LeftUpperArm.CanTouch = false
game.Players.LocalPlayer.Character.RightUpperArm.CanTouch = false
game.Players.LocalPlayer.Character.RightLowerArm.CanTouch = false
game.Players.LocalPlayer.Character.UpperTorso.CanTouch = false
game.Players.LocalPlayer.Character.LowerTorso.CanTouch = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanTouch = false
end
	
while _G.GodMode == false do
	wait()
game.Players.LocalPlayer.Character.Head.CanTouch = true
game.Players.LocalPlayer.Character.LeftFoot.CanTouch = true
game.Players.LocalPlayer.Character.RightFoot.CanTouch = true
game.Players.LocalPlayer.Character.RightHand.CanTouch = true
game.Players.LocalPlayer.Character.LeftHand.CanTouch = true
game.Players.LocalPlayer.Character.RightLowerLeg.CanTouch = true
game.Players.LocalPlayer.Character.RightUpperLeg.CanTouch = true
game.Players.LocalPlayer.Character.LeftLowerLeg.CanTouch = true
game.Players.LocalPlayer.Character.LeftUpperLeg.CanTouch = true
game.Players.LocalPlayer.Character.LeftLowerArm.CanTouch = true
game.Players.LocalPlayer.Character.LeftUpperArm.CanTouch = true
game.Players.LocalPlayer.Character.RightUpperArm.CanTouch = true
game.Players.LocalPlayer.Character.RightLowerArm.CanTouch = true
game.Players.LocalPlayer.Character.UpperTorso.CanTouch = true
game.Players.LocalPlayer.Character.LowerTorso.CanTouch = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CanTouch = true
end
end)

tab:Toggle("无敌模式[关]", false, function(state)
G.GodMode = false
while _G.GodMode == true do
	wait()
game.Players.LocalPlayer.Character.Head.CanTouch = false
game.Players.LocalPlayer.Character.LeftFoot.CanTouch = false
game.Players.LocalPlayer.Character.RightFoot.CanTouch = false
game.Players.LocalPlayer.Character.RightHand.CanTouch = false
game.Players.LocalPlayer.Character.LeftHand.CanTouch = false
game.Players.LocalPlayer.Character.RightLowerLeg.CanTouch = false
game.Players.LocalPlayer.Character.RightUpperLeg.CanTouch = false
game.Players.LocalPlayer.Character.LeftLowerLeg.CanTouch = false
game.Players.LocalPlayer.Character.LeftUpperLeg.CanTouch = false
game.Players.LocalPlayer.Character.LeftLowerArm.CanTouch = false
game.Players.LocalPlayer.Character.LeftUpperArm.CanTouch = false
game.Players.LocalPlayer.Character.RightUpperArm.CanTouch = false
game.Players.LocalPlayer.Character.RightLowerArm.CanTouch = false
game.Players.LocalPlayer.Character.UpperTorso.CanTouch = false
game.Players.LocalPlayer.Character.LowerTorso.CanTouch = false
game.Players.LocalPlayer.Character.HumanoidRootPart.CanTouch = false
end
	
while _G.GodMode == false do
	wait()
game.Players.LocalPlayer.Character.Head.CanTouch = true
game.Players.LocalPlayer.Character.LeftFoot.CanTouch = true
game.Players.LocalPlayer.Character.RightFoot.CanTouch = true
game.Players.LocalPlayer.Character.RightHand.CanTouch = true
game.Players.LocalPlayer.Character.LeftHand.CanTouch = true
game.Players.LocalPlayer.Character.RightLowerLeg.CanTouch = true
game.Players.LocalPlayer.Character.RightUpperLeg.CanTouch = true
game.Players.LocalPlayer.Character.LeftLowerLeg.CanTouch = true
game.Players.LocalPlayer.Character.LeftUpperLeg.CanTouch = true
game.Players.LocalPlayer.Character.LeftLowerArm.CanTouch = true
game.Players.LocalPlayer.Character.LeftUpperArm.CanTouch = true
game.Players.LocalPlayer.Character.RightUpperArm.CanTouch = true
game.Players.LocalPlayer.Character.RightLowerArm.CanTouch = true
game.Players.LocalPlayer.Character.UpperTorso.CanTouch = true
game.Players.LocalPlayer.Character.LowerTorso.CanTouch = true
game.Players.LocalPlayer.Character.HumanoidRootPart.CanTouch = true
end
end)