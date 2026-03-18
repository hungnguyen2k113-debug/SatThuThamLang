local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui", game.CoreGui)

local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,60,0,60)
logo.Position = UDim2.new(0,20,0,200)
logo.Text = ""

logo.BackgroundColor3 = Color3.fromRGB(255,255,255)
logo.BackgroundTransparency = 0.4
logo.AutoButtonColor = false
Instance.new("UICorner", logo).CornerRadius = UDim.new(1,0)

local avatar = Instance.new("ImageLabel", logo)
avatar.Size = UDim2.new(1,0,1,0)
avatar.BackgroundTransparency = 1
avatar.Image = "rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=150&h=150"

local dragging = false
local dragStart = nil
local startPos = nil

logo.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then
		
		dragging = true
		dragStart = input.Position
		startPos = logo.Position
	end
end)

logo.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 
	or input.UserInputType == Enum.UserInputType.Touch then
		
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and (
		input.UserInputType == Enum.UserInputType.MouseMovement 
		or input.UserInputType == Enum.UserInputType.Touch) then
		
		local delta = input.Position - dragStart
		
		logo.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,500,0,260)
frame.Position = UDim2.new(0.5,-300,0.5,-160)
frame.BackgroundColor3 = Color3.fromRGB(40,40,40)
frame.Visible = false
frame.Active = true
frame.Draggable = true

Instance.new("UICorner", frame).CornerRadius = UDim.new(0,12)

local lineTop = Instance.new("Frame", frame)
lineTop.Size = UDim2.new(1,0,0,2)
lineTop.Position = UDim2.new(0,0,0,40)
lineTop.BackgroundColor3 = Color3.fromRGB(200,200,200)

local lineSide = Instance.new("Frame", frame)
lineSide.Size = UDim2.new(0,2,1,-40)
lineSide.Position = UDim2.new(0,140,0,40)
lineSide.BackgroundColor3 = Color3.fromRGB(200,200,200)

task.spawn(function()
	while true do
		for i=0,1,0.02 do
			frame.BorderColor3 = Color3.fromHSV(i,1,1)
			task.wait(0.03)
		end
	end
end)

local top = Instance.new("TextLabel", frame)
top.Size = UDim2.new(1,0,0,40)
top.BackgroundTransparency = 1
top.Text = "BananaPigHub by Hynix yeuem [Premium]"
top.TextColor3 = Color3.fromRGB(255, 215, 0)
top.Font = Enum.Font.GothamBold
top.Size = UDim2.new(1,-120,0,40)
top.Position = UDim2.new(0,10,0,0)
top.TextScaled = false
top.TextSize = 14
top.TextXAlignment = Enum.TextXAlignment.Left 

local closeTab = Instance.new("TextButton", frame)
closeTab.Size = UDim2.new(0,40,0,40)
closeTab.Position = UDim2.new(1,-40,0,0)
closeTab.Text = "-"
closeTab.BackgroundTransparency = 1
closeTab.TextColor3 = Color3.new(1,1,1)

local zoomBtn = Instance.new("TextButton", frame)
zoomBtn.Size = UDim2.new(0,40,0,40)
zoomBtn.Position = UDim2.new(1,-80,0,0)
zoomBtn.Text = "⬜"
zoomBtn.BackgroundTransparency = 1
zoomBtn.TextColor3 = Color3.new(1,1,1)

local exitBtn = Instance.new("TextButton", frame)
exitBtn.Size = UDim2.new(0,40,0,40)
exitBtn.Position = UDim2.new(1,-120,0,0)
exitBtn.Text = "X"
exitBtn.BackgroundTransparency = 1
exitBtn.TextColor3 = Color3.new(1,1,1)

local side = Instance.new("Frame", frame)
side.Size = UDim2.new(0,140,1,-40) 
side.Position = UDim2.new(0,0,0,40)
side.BackgroundTransparency = 1

-- ====== TAB BUTTONS (GIỮ NGUYÊN) ======
local infoBtn = Instance.new("TextButton", side)
infoBtn.Size = UDim2.new(1,0,0,50)
infoBtn.Text = "Info"
infoBtn.TextColor3 = Color3.new(1,1,1)
infoBtn.BackgroundTransparency = 1

local farmBtn = Instance.new("TextButton", side)
farmBtn.Position = UDim2.new(0,0,0,60)
farmBtn.Size = UDim2.new(1,0,0,50)
farmBtn.Text = "Farming"
farmBtn.TextColor3 = Color3.new(1,1,1)
farmBtn.BackgroundTransparency = 1

-- ====== CONTENT CŨ (GIỮ NGUYÊN NHƯNG ẨN) ======
local content = Instance.new("Frame", frame)
content.Position = UDim2.new(0,150,0,40) 
content.Size = UDim2.new(1,-160,1,-40) 
content.BackgroundTransparency = 1
content.Visible = false -- 🔥 ẨN ĐI

-- ====== TẠO 2 PAGE RIÊNG ======
local infoPage = Instance.new("Frame", frame)
infoPage.Position = content.Position
infoPage.Size = content.Size
infoPage.BackgroundTransparency = 1

local farmPage = Instance.new("Frame", frame)
farmPage.Position = content.Position
farmPage.Size = content.Size
farmPage.BackgroundTransparency = 1
farmPage.Visible = false

-- ====== INFO PAGE CHIA 2/5 + 3/5 ======

-- Avatar (trái)
local avatarBox = Instance.new("Frame", infoPage)
avatarBox.Size = UDim2.new(0.4,0,1,0)
avatarBox.BackgroundTransparency = 1

local splitLine = Instance.new("Frame", infoPage)
splitLine.Size = UDim2.new(0,2,1,0)
splitLine.Position = UDim2.new(0.4,0,0,0) -- đúng vị trí 2/5
splitLine.BackgroundColor3 = Color3.fromRGB(150,150,150)

local avatarImg = Instance.new("ImageLabel", avatarBox)
avatarImg.Size = UDim2.new(0.8,0,0.5,0)
avatarImg.Position = UDim2.new(0.1,0,0.1,0)
avatarImg.BackgroundTransparency = 1
avatarImg.Image = avatar.Image

Instance.new("UICorner", avatarImg)

-- Info text (phải)
local infoLabel = Instance.new("TextLabel", infoPage)
infoLabel.Size = UDim2.new(0.6,0,1,0)
infoLabel.Position = UDim2.new(0.4,0,0,0)
infoLabel.TextColor3 = Color3.new(1,1,1)
infoLabel.BackgroundTransparency = 1
infoLabel.TextScaled = true
infoLabel.TextXAlignment = Enum.TextXAlignment.Left
infoLabel.TextYAlignment = Enum.TextYAlignment.Top

infoLabel.Text =
"👤 Thông tin player\n"..
"\nTên: "..LocalPlayer.Name..
"\nuid: "..LocalPlayer.UserId..
"\nRegion: Asia/HoChiMinh\n\n"..
"📱 Liên Hệ\n"..
"TikTok: @nghbt255\n"..
"Zalo: 0394310186"

-- ====== FIX TOGGLE SANG FARM PAGE ======
local function createToggle(name, posY)
	local holder = Instance.new("Frame", farmPage) -- 🔥 CHUYỂN SANG FARM
	holder.Size = UDim2.new(1,0,0,40)
	holder.Position = UDim2.new(0,0,posY,0)
	holder.BackgroundTransparency = 1

	local label = Instance.new("TextLabel", holder)
	label.Size = UDim2.new(0.6,0,1,0)
	label.BackgroundTransparency = 1
	label.Text = name
	label.TextScaled = true
	label.TextColor3 = Color3.new(1,1,1)

	local toggle = Instance.new("TextButton", holder)
	toggle.Size = UDim2.new(0,50,0,22)
	toggle.Position = UDim2.new(1,-60,0.5,-11)
	toggle.BackgroundColor3 = Color3.fromRGB(100,100,100)
	toggle.Text = ""

	local circle = Instance.new("Frame", toggle)
	circle.Size = UDim2.new(0,22,0,22)
	circle.BackgroundColor3 = Color3.fromRGB(255,255,255)
	Instance.new("UICorner", circle)

	local state = false

	toggle.MouseButton1Click:Connect(function()
		state = not state
		
		if state then
			toggle.BackgroundColor3 = Color3.fromRGB(0,255,0)
			circle.Position = UDim2.new(1,-22,0,0)
		else
			toggle.BackgroundColor3 = Color3.fromRGB(100,100,100)
			circle.Position = UDim2.new(0,0,0,0)
		end
	end)
end

createToggle("Bật thông báo Script",0.1)
createToggle("Bug Hitbox Player",0.3)
createToggle("Esp Player",0.5)

-- ====== CHUYỂN TAB ======
infoBtn.MouseButton1Click:Connect(function()
	infoPage.Visible = true
	farmPage.Visible = false
end)

farmBtn.MouseButton1Click:Connect(function()
	infoPage.Visible = false
	farmPage.Visible = true
end)

-- ====== PHẦN DƯỚI GIỮ NGUYÊN 100% ======

local notifications = {}

function createNotify(msg)
	local notif = Instance.new("Frame", gui)
	notif.Size = UDim2.new(0,260,0,50)
	notif.Position = UDim2.new(1,300,0,100)
	notif.BackgroundColor3 = Color3.fromRGB(80,80,80)
	Instance.new("UICorner", notif)

	local ava = Instance.new("ImageLabel", notif)
	ava.Size = UDim2.new(0,50,1,0)
	ava.BackgroundTransparency = 1
	ava.Image = avatar.Image

	local txt = Instance.new("TextLabel", notif)
	txt.Size = UDim2.new(1,-80,1,0)
	txt.Position = UDim2.new(0,60,0,0)
	txt.BackgroundTransparency = 1
	txt.TextColor3 = Color3.new(1,1,1)
	txt.TextScaled = true
	txt.Text = msg

	local close = Instance.new("TextButton", notif)
	close.Size = UDim2.new(0,30,0,30)
	close.Position = UDim2.new(1,-30,0,0)
	close.Text = "X"
	close.BackgroundTransparency = 1
	close.TextColor3 = Color3.new(1,1,1)

	table.insert(notifications, notif)

	for i,v in pairs(notifications) do
		v:TweenPosition(UDim2.new(1,-270,0,100 + (i-1)*60))
	end

	notif:TweenPosition(UDim2.new(1,-270,0,100))

	close.MouseButton1Click:Connect(function()
		notif:Destroy()
	end)

	task.delay(5,function()
		if notif.Parent then
			notif:TweenPosition(UDim2.new(1,300,notif.Position.Y.Scale,notif.Position.Y.Offset))
			task.wait(0.3)
			notif:Destroy()
		end
	end)
end

local zoomed = false
logo.MouseButton1Click:Connect(function()
	frame.Visible = not frame.Visible
	zoomed = not zoomed
	
	if zoomed then
		logo.Size = UDim2.new(0,75,0,75)
		logo.BackgroundTransparency = 0
	else
		logo.Size = UDim2.new(0,60,0,60)
		logo.BackgroundTransparency = 0.4
	end
end)

closeTab.MouseButton1Click:Connect(function()
	frame.Visible = false
end)

exitBtn.MouseButton1Click:Connect(function()
	local confirm = Instance.new("Frame", gui)
	confirm.Size = UDim2.new(0,300,0,150)
	confirm.Position = UDim2.new(0.5,-150,0.5,-75)
-- nền confirm đẹp hơn
confirm.BackgroundColor3 = Color3.fromRGB(45,45,45)
Instance.new("UICorner", confirm).CornerRadius = UDim.new(0,12)

-- TEXT
local txt = Instance.new("TextLabel", confirm)
txt.Size = UDim2.new(1,-20,0.5,0)
txt.Position = UDim2.new(0,10,0,10)
txt.Text = "Script đang chạy\nBạn có chắc muốn tắt không?"
txt.TextScaled = true
txt.TextColor3 = Color3.new(1,1,1)
txt.BackgroundTransparency = 1
txt.TextWrapped = true

-- YES BUTTON (đỏ)
local yes = Instance.new("TextButton", confirm)
yes.Size = UDim2.new(0.45,0,0,40)
yes.Position = UDim2.new(0.05,0,1,-50)
yes.Text = "Yes"
yes.TextColor3 = Color3.new(1,1,1)
yes.BackgroundColor3 = Color3.fromRGB(200,60,60)
Instance.new("UICorner", yes).CornerRadius = UDim.new(0,8)

local no = Instance.new("TextButton", confirm)
no.Size = UDim2.new(0.45,0,0,40)
no.Position = UDim2.new(0.5,0,1,-50)
no.Text = "No"
no.TextColor3 = Color3.new(1,1,1)
no.BackgroundColor3 = Color3.fromRGB(80,80,80)
Instance.new("UICorner", no).CornerRadius = UDim.new(0,8)

	yes.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	no.MouseButton1Click:Connect(function()
		confirm:Destroy()
	end)
end)

task.spawn(function()
	task.wait(1)
	createNotify("👋 Xin chào "..LocalPlayer.Name)
	createNotify("Cảm ơn bạn đã dùng script ❤️")
	createNotify("Tiktok: @nghbt255 | Zalo: 0394310186")
end)