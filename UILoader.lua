--// Still in BETA Development! \\--

local CalHub = {}
local UIS = game:GetService("UserInputService")
local tween = game:GetService("TweenService")
local coreGui = game:GetService("CoreGui")
local viewport = workspace.CurrentCamera.ViewportSize
local tweenInfo = TweenInfo.new
local mouse = game:GetService("Players").LocalPlayer:GetMouse()
local playersInfo = game.Players.LocalPlayer

function CalHub:MakeDraggable(frame)
    local drag = false
    local dragInput, mousePos, framePos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            drag = true
            mousePos = input.Position
            framePos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    drag = false
                end
            end)
        end
    end)
    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and drag then
            local delta = input.Position - mousePos
            frame.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
        end
    end)
end

function RanName()
    local len = math.random(10, 40)
    local args = {}
    for i = 1, len do
        args[i] = string.char(math.random(50, 130))
    end
    return table.concat(args)
end

function CalHub.CreateWin(title)
    title = title or "Library"
    table.insert(CalHub, title)
    local userIds = playersInfo.UserId
    local thumType = Enum.ThumbnailType.HeadShot
    local thumSize = Enum.ThumbnailSize.Size48x48
    local imgAsync = game.Players:GetUserThumbnailAsync(userIds, thumType, thumSize)
    local tb = true
    local focus = false
    local currenttab = ""
    local GUI = Instance.new("ScreenGui", coreGui)
    local Main = Instance.new("Frame", GUI)
    local Fader = Instance.new("Frame", Main)
    local MainCorner = Instance.new("UICorner", Main)
    local FadeCorner = Instance.new("UICorner", Fader)
    local PlrInfo = Instance.new("TextLabel", Main)
    local PlrImg = Instance.new("ImageLabel", Main)
    local ImgCorner = Instance.new("UICorner", PlrImg)
    local InfoBorder = Instance.new("Frame", Main)
    local TopBar = Instance.new("Frame", Main)
    local TopBorder = Instance.new("Frame", TopBar)
    local UITitle = Instance.new("TextLabel", TopBar)
    local Title = Instance.new("TextLabel", TopBar)
    local Close = Instance.new("ImageButton", TopBar)
    local Minimize = Instance.new("ImageButton", TopBar)
    local Maximize = Instance.new("ImageButton", TopBar)
    local TabHolder = Instance.new("Frame", Main)
    local HoldCorner = Instance.new("UICorner", TabHolder)
    local TabListing = Instance.new("UIListLayout", TabHolder)
    local TabPad = Instance.new("UIPadding", TabHolder)
    local Fix1 = Instance.new("Frame", Main)
    local Fix2 = Instance.new("Frame", Main)
    local HoldBorder = Instance.new("Frame", Main)
    local Contents = Instance.new("Frame", Main)

    GUI.Name = RanName()
    GUI.ResetOnSpawn = false
    GUI.IgnoreGuiInset = true

    Main.Name = title
    Main.Size = UDim2.new(0, 530, 0, 300)
    Main.Position = UDim2.fromOffset((viewport.X / 2) - (Main.Size.X.Offset / 2), (viewport.Y / 2) - (Main.Size.Y.Offset / 2))
    Main.BackgroundColor3 = Color3.fromRGB(24, 25, 33)
    Main.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Main.Active = true
    Main.ClipsDescendants = true
    MainCorner.CornerRadius = UDim.new(0, 10)

    Fader.Name = "Fade"
    Fader.Size = UDim2.new(1, 0, 1, 0)
    Fader.BackgroundColor3 = Color3.fromRGB(24, 25, 33)
    Fader.BackgroundTransparency = 1
    Fader.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Fader.ZIndex = 9999999999
    Fader.ClipsDescendants = true
    FadeCorner.CornerRadius = UDim.new(0, 10)

    PlrInfo.Name = "PlayerInfo"
    PlrInfo.Size = UDim2.new(0, 80, 0, 30)
    PlrInfo.Position = UDim2.new(0, 45, 0, 265)
    PlrInfo.BackgroundTransparency = 1
    PlrInfo.Text = playersInfo.Name
    PlrInfo.TextColor3 = Color3.fromRGB(255, 255, 255)
    PlrInfo.TextSize = 15
    PlrInfo.TextXAlignment = Enum.TextXAlignment.Left
    PlrInfo.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
    PlrInfo.ZIndex = 999

    PlrImg.Name = "PlayerImg"
    PlrImg.Size = UDim2.new(0, 31, 0, 31)
    PlrImg.Position = UDim2.new(0, 9, 0, 263)
    PlrImg.BackgroundColor3 = Color3.fromRGB(39, 40, 48)
    PlrImg.BorderColor3 = Color3.fromRGB(27, 42, 53)
    PlrImg.Image = imgAsync
    PlrImg.ZIndex = 999
    ImgCorner.CornerRadius = UDim.new(1, 0)

    InfoBorder.Name = "InfoLine"
    InfoBorder.Size = UDim2.new(0, 130, 0, 1)
    InfoBorder.Position = UDim2.new(0, 0, 0, 257)
    InfoBorder.BackgroundColor3 = Color3.fromRGB(39, 40, 48)
    InfoBorder.BorderSizePixel = 0
    InfoBorder.ZIndex = 999

    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 34)
    TopBar.BackgroundTransparency = 1
    TopBar.ZIndex = 9999

    TopBorder.Name = "TopLine"
    TopBorder.Size = UDim2.new(1, 0, 0, 1)
    TopBorder.Position = UDim2.new(0, 0, 1, 0)
    TopBorder.BackgroundColor3 = Color3.fromRGB(49, 50, 58)
    TopBorder.BorderSizePixel = 0
    TopBorder.AnchorPoint = Vector2.new(0, 1)
    TopBorder.ZIndex = 99999

    UITitle.Name = "UITitle"
    UITitle.Size = UDim2.new(.2, 0, 1, 0)
    UITitle.Position = UDim2.new(0, 15, 0, 0)
    UITitle.BackgroundTransparency = 1
    UITitle.Text = "CALHUB"
    UITitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    UITitle.TextSize = 21
    UITitle.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.ExtraBold)
    UITitle.TextXAlignment = Enum.TextXAlignment.Left
    UITitle.TextTransparency = 1
    UITitle.ZIndex = 99999

    Title.Name = "Title"
    Title.Size = UDim2.new(.5, 0, 1, 0)
    Title.Position = UDim2.new(0, 15, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = title
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 19
    Title.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.ZIndex = 99999

    Close.Name = "Close"
    Close.Size = UDim2.new(0, 20, 0, 20)
    Close.Position = UDim2.new(1, -30, 0, 7)
    Close.BackgroundTransparency = 1
    Close.Image = "rbxassetid://7072725342"
    Close.ImageColor3 = Color3.fromRGB(137, 144, 163)
    Close.AutoButtonColor = false
    Close.ZIndex = 99999

    Minimize.Name = "Minimize"
    Minimize.Size = UDim2.new(0, 20, 0, 20)
    Minimize.Position = UDim2.new(1, -55, 0, 7)
    Minimize.BackgroundTransparency = 1
    Minimize.Image = "rbxassetid://7734000129"
    Minimize.ImageColor3 = Color3.fromRGB(137, 144, 163)
    Minimize.AutoButtonColor = false
    Minimize.ZIndex = 99999

    Maximize.Name = "Maximize"
    Maximize.Size = UDim2.new(0, 20, 0, 20)
    Maximize.Position = UDim2.new(1, -55, 0, 7)
    Maximize.BackgroundTransparency = 1
    Maximize.Image = "rbxassetid://7734042071"
    Maximize.ImageColor3 = Color3.fromRGB(137, 144, 163)
    Maximize.AutoButtonColor = false
    Maximize.Visible = false
    Maximize.ZIndex = 99999

    TabHolder.Name = "TabHolder"
    TabHolder.Size = UDim2.new(0, 130, 1, -34)
    TabHolder.Position = UDim2.new(0, 0, 0, 34)
    TabHolder.BackgroundColor3 = Color3.fromRGB(31, 32, 40)
    TabHolder.BorderSizePixel = 0
    HoldCorner.CornerRadius = UDim.new(0, 10)
    TabListing.Padding = UDim.new(0, 8)
    TabListing.SortOrder = Enum.SortOrder.LayoutOrder
    TabPad.PaddingBottom = UDim.new(0, 8)
    TabPad.PaddingTop = UDim.new(0, 8)
    TabPad.PaddingLeft = UDim.new(0, 12)

    Fix1.Name = "Hide1"
    Fix1.Size = UDim2.new(0, 110, 0, 20)
    Fix1.Position = UDim2.new(0, 0, 0, 34)
    Fix1.BackgroundColor3 = Color3.fromRGB(31, 32, 40)
    Fix1.BorderSizePixel = 0
    Fix1.ZIndex = 99

    Fix2.Name = "Hide2"
    Fix2.Size = UDim2.new(0, 20, 0, 266)
    Fix2.Position = UDim2.new(0, 110, 0, 34)
    Fix2.BackgroundColor3 = Color3.fromRGB(31, 32, 40)
    Fix2.BorderSizePixel = 0
    Fix2.ZIndex = 99

    HoldBorder.Name = "TabBorder"
    HoldBorder.Size = UDim2.new(0, 1, 0, 266)
    HoldBorder.Position = UDim2.new(0, 130, 0, 34)
    HoldBorder.BackgroundColor3 = Color3.fromRGB(49, 50, 58)
    HoldBorder.BorderSizePixel = 0

    Contents.Name = "Contents"
    Contents.Size = UDim2.new(1, -152, 1, -40)
    Contents.Position = UDim2.new(1, -6, 0, 37.5)
    Contents.BackgroundTransparency = 1
    Contents.AnchorPoint = Vector2.new(1, 0)

    Close.MouseButton1Click:Connect(function()
        Fader.Active = true
        tween:Create(Fader, tweenInfo(.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
        wait(.5)
        tween:Create(Main, tweenInfo(.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0, Main.AbsolutePosition.X + (Main.AbsoluteSize.X / 2), 0, Main.AbsolutePosition.Y + (Main.AbsoluteSize.Y / 2))}):Play()
        task.wait(1)
        GUI:Destroy()
    end)

    Close.MouseEnter:Connect(function()
        Close.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)
    Close.MouseLeave:Connect(function()
        Close.ImageColor3 = Color3.fromRGB(137, 144, 163)
    end)
    Minimize.MouseEnter:Connect(function()
        Minimize.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)
    Minimize.MouseLeave:Connect(function()
        Minimize.ImageColor3 = Color3.fromRGB(137, 144, 163)
    end)
    Maximize.MouseEnter:Connect(function()
        Maximize.ImageColor3 = Color3.fromRGB(255, 255, 255)
    end)
    Maximize.MouseLeave:Connect(function()
        Maximize.ImageColor3 = Color3.fromRGB(137, 144, 163)
    end)
    CalHub:MakeDraggable(Main)

    local TabCreate = {}
    function TabCreate:NewTab(tabTitle)
        tabTitle = tabTitle or "Tab"
        local Tab = Instance.new("TextButton", TabHolder)
        local TabCorner = Instance.new("UICorner", Tab)
        local TabContent = Instance.new("ScrollingFrame", Contents)
        local TabContentPad = Instance.new("UIPadding", TabContent)
        local TabContentList = Instance.new("UIListLayout", TabContent)

        local function upSize()
            local cS = TabContentList.AbsoluteContentSize
            tween:Create(TabContent, tweenInfo(.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {CanvasSize = UDim2.new(0, 0, 0, cS.Y)}):Play()
        end

        Tab.Name = tabTitle .. "Tab"
        Tab.Size = UDim2.new(1, -10, 0, 29)
        Tab.BackgroundColor3 = Color3.fromRGB(58, 138, 253)
        Tab.BorderSizePixel = 0
        Tab.Text = tabTitle
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 16
        Tab.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
        Tab.TextXAlignment = Enum.TextXAlignment.Center
        Tab.ZIndex = 999
        Tab.AutoButtonColor = false
        TabCorner.CornerRadius = UDim.new(0, 5)

        TabContent.Name = "TabContent"
        TabContent.Size = UDim2.new(1, 0, 1, 0)
        TabContent.BackgroundTransparency = 1
        TabContent.ScrollBarThickness = 0
        TabContent.ClipsDescendants = true
        TabContentPad.PaddingBottom = UDim.new(0, 3)
        TabContentPad.PaddingLeft = UDim.new(0, 1)
        TabContentPad.PaddingRight = UDim.new(0, 1)
        TabContentPad.PaddingTop = UDim.new(0, 3)
        TabContentList.Padding = UDim.new(0, 6)
        TabContentList.SortOrder = Enum.SortOrder.LayoutOrder

        Minimize.MouseButton1Click: Connect(function()
            Minimize.Visible = false
            Maximize.Visible = true
            tween:Create(Main, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Size = UDim2.new(0, 250, 0, 34)}):Play()
            tween:Create(TopBorder, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 1}):Play()
            tween:Create(Contents, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Position = UDim2.new(1, -6, 0, 125.5)}):Play()
            tween:Create(Tab, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 1}):Play()
            tween:Create(Fix1, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 1}):Play()
            tween:Create(Fix2, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 1}):Play()
            tween:Create(TabHolder, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 1}):Play()
            tween:Create(Tab, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextTransparency = 1}):Play()
            tween:Create(HoldBorder, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 1}):Play()
            tween:Create(UITitle, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextTransparency = 0}):Play()
            tween:Create(Title, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextTransparency = 1}):Play()
        end)

        Maximize.MouseButton1Click: Connect(function()
            Maximize.Visible = false
            Minimize.Visible = true
            tween:Create(Main, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Size = UDim2.new(0, 530, 0, 300)}):Play()
            tween:Create(TopBorder, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
            tween:Create(Contents, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Position = UDim2.new(1, -6, 0, 37.5)}):Play()
            tween:Create(Tab, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
            tween:Create(Fix1, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
            tween:Create(Fix2, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
            tween:Create(TabHolder, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
            tween:Create(Tab, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextTransparency = 0}):Play()
            tween:Create(HoldBorder, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundTransparency = 0}):Play()
            tween:Create(UITitle, tweenInfo(.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextTransparency = 1}):Play()
            tween:Create(Title, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextTransparency = 0}):Play()
        end)

        if tb then
            tb = false
            Tab.BackgroundColor3 = Color3.fromRGB(58, 138, 253)
            currenttab = Tab.Name
            TabContent.Visible = true
            upSize()
        else
            Tab.BackgroundColor3 = Color3.fromRGB(47, 50, 59)
            TabContent.Visible = false
        end

        TabContent.ChildAdded:Connect(upSize)
        TabContent.ChildRemoved:Connect(upSize)

        upSize()
        Tab.MouseButton1Click:Connect(function()
            upSize()
            for i, v in next, Contents:GetChildren() do
                if v.Name == "TabContent" then
                    v.Visible = false
                end
                TabContent.Visible = true
            end
            for i, v in next, TabHolder:GetChildren() do
                if v.ClassName == "TextButton" then
                    tween:Create(v, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(47, 50, 59)}):Play()
                    Contents.Position = UDim2.new(1, -36, 0, 37.5)
                end
            end
            tween:Create(Tab, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(58, 138, 253)}):Play()
            tween:Create(Contents, tweenInfo(.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Position = UDim2.new(1, -6, 0, 37.5)}):Play()
            currenttab = Tab.Name
        end)

        local Content = {}
        function Content:NewLabel(labelText)
            labelText = labelText or "Label"
            local Label = Instance.new("Frame", TabContent)
            local LabelPad = Instance.new("UIPadding", Label)
            local labelTitle = Instance.new("TextLabel", Label)

            Label.Name = "Label"
            Label.Size = UDim2.new(1, -10, 0, 21)
            Label.BackgroundTransparency = 1
            LabelPad.PaddingBottom = UDim.new(0, 6)
            LabelPad.PaddingRight = UDim.new(0, 6)
            LabelPad.PaddingTop = UDim.new(0, 6)

            labelTitle.Name = "Text"
            labelTitle.Size = UDim2.new(1, 0, 1, 0)
            labelTitle.BackgroundTransparency = 1
            labelTitle.Text = labelText
            labelTitle.TextColor3 = Color3.fromRGB(115, 181, 250)
            labelTitle.TextXAlignment = Enum.TextXAlignment.Left
            labelTitle.TextSize = 16
            labelTitle.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)
            upSize()
        end

        function Content:NewButton(btnTitle, callback)
            btnTitle = btnTitle or "Button"
            callback = callback or function() end
            local Button = Instance.new("TextButton", TabContent)
            local ButtonPad = Instance.new("UIPadding", Button)
            local ButtonCorner = Instance.new("UICorner", Button)
            local BtnTitle = Instance.new("TextLabel", Button)
            local ButtonIcon = Instance.new("ImageLabel", Button)

            Button.Name = "Button"
            Button.Size = UDim2.new(1, -10, 0, 35)
            Button.BackgroundColor3 = Color3.fromRGB(37, 40, 49)
            Button.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Button.Text = ""
            Button.AutoButtonColor = false
            ButtonPad.PaddingBottom = UDim.new(0, 6)
            ButtonPad.PaddingLeft = UDim.new(0, 6)
            ButtonPad.PaddingRight = UDim.new(0, 6)
            ButtonPad.PaddingTop = UDim.new(0, 6)
            ButtonCorner.CornerRadius = UDim.new(0, 8)

            BtnTitle.Name = "Title"
            BtnTitle.Size = UDim2.new(1, -55, 1, 0)
            BtnTitle.BackgroundTransparency = 1
            BtnTitle.Text = btnTitle
            BtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            BtnTitle.TextXAlignment = Enum.TextXAlignment.Left
            BtnTitle.TextSize = 16
            BtnTitle.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)

            ButtonIcon.Name = "Icon"
            ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
            ButtonIcon.Position = UDim2.new(1, 0, 0, 0)
            ButtonIcon.BackgroundTransparency = 1
            ButtonIcon.AnchorPoint = Vector2.new(1, 0)
            ButtonIcon.Image = "rbxassetid://7743870392"
            ButtonIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            upSize()

            Button.MouseButton1Click:Connect(function()
                BtnTitle.TextSize = 0
                ButtonIcon.Size = UDim2.new(0, 0, 0, 0)
                Button.BackgroundTransparency = .7
                tween:Create(BtnTitle, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {TextSize = 16}):Play()
                tween:Create(ButtonIcon, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Size = UDim2.new(0, 20, 0, 20)}):Play()
                tween:Create(Button, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.In, 0, false, 0), {BackgroundTransparency = 0}):Play()
                pcall(callback)
            end)
        end

        function Content:NewToggle(tglTitle, callback)
            tglTitle = tglTitle or "Toggle"
            callback = callback or function() end
            local toggled = false
            local Toggle = Instance.new("TextButton", TabContent)
            local TogglePad = Instance.new("UIPadding", Toggle)
            local ToggleCorner = Instance.new("UICorner", Toggle)
            local ToggleTitle = Instance.new("TextLabel", Toggle)
            local ToggleBtn = Instance.new("Frame", Toggle)
            local ToggleBtnCorner = Instance.new("UICorner", ToggleBtn)
            local ToggleBtnCircle = Instance.new("Frame", ToggleBtn)
            local ToggleBtnCircleCorner = Instance.new("UICorner", ToggleBtnCircle)

            Toggle.Name = "Toggle"
            Toggle.Size = UDim2.new(1, -10, 0, 35)
            Toggle.BackgroundColor3 = Color3.fromRGB(37, 40, 49)
            Toggle.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Toggle.Text = ""
            Toggle.AutoButtonColor = false
            TogglePad.PaddingBottom = UDim.new(0, 6)
            TogglePad.PaddingLeft = UDim.new(0, 6)
            TogglePad.PaddingRight = UDim.new(0, 6)
            TogglePad.PaddingTop = UDim.new(0, 6)
            ToggleCorner.CornerRadius = UDim.new(0, 8)

            ToggleTitle.Name = "Title"
            ToggleTitle.Size = UDim2.new(1, -55, 1, 0)
            ToggleTitle.BackgroundTransparency = 1
            ToggleTitle.Text = tglTitle
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            ToggleTitle.TextSize = 16
            ToggleTitle.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)

            ToggleBtn.Name = "Btn"
            ToggleBtn.Size = UDim2.new(0, 40, 0, 21)
            ToggleBtn.Position = UDim2.new(1, -3, .5, 0)
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(60, 65, 79)
            ToggleBtn.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ToggleBtn.AnchorPoint = Vector2.new(1, .5)
            ToggleBtnCorner.CornerRadius = UDim.new(1, 8)

            ToggleBtnCircle.Name = "Circle"
            ToggleBtnCircle.Size = UDim2.new(0, 16, 0, 16)
            ToggleBtnCircle.Position = UDim2.new(.2, -6, .15, -1)
            ToggleBtnCircle.BackgroundColor3 = Color3.fromRGB(135, 139, 150)
            ToggleBtnCircle.BorderColor3 = Color3.fromRGB(27, 42, 53)
            ToggleBtnCircleCorner.CornerRadius = UDim.new(1, 0)
            upSize()

            Toggle.MouseButton1Click:Connect(function()
                if toggled == false then
                    tween:Create(ToggleBtn, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(58, 138, 253)}):Play()
                    tween:Create(Toggle, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(30, 50, 79)}):Play()
                    tween:Create(ToggleBtnCircle, tweenInfo(.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Position = UDim2.new(.2, 13, .15, -1), BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
                else
                    tween:Create(ToggleBtn, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(60, 65, 79)}):Play()
                    tween:Create(Toggle, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(37, 40, 49)}):Play()
                    tween:Create(ToggleBtnCircle, tweenInfo(.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {Position = UDim2.new(.2, -6, .15, -1), BackgroundColor3 = Color3.fromRGB(135, 139, 150)}):Play()
                end
                toggled = not toggled
                pcall(callback, toggled)
            end)
        end

        function Content:NewSlider(sldTitle, min, max, callback)
            sldTitle = sldTitle or "Slider"
            min = min or 10
            max = max or 100
            callback = callback or function() end
            local Slider = Instance.new("Frame", TabContent)
            local SliderPad = Instance.new("UIPadding", Slider)
            local SliderCorner = Instance.new("UICorner", Slider)
            local SliderTitle = Instance.new("TextLabel", Slider)
            local SliderValue = Instance.new("TextLabel", Slider)
            local ValueCorner = Instance.new("UICorner", SliderValue)
            local SliderBack = Instance.new("TextButton", Slider)
            local BackCorner = Instance.new("UICorner", SliderBack)
            local SliderDrag = Instance.new("Frame", SliderBack)
            local DragCorner = Instance.new("UICorner", SliderDrag)

            Slider.Name = "MainSlider"
            Slider.Size = UDim2.new(1, -10, 0, 46)
            Slider.BackgroundColor3 = Color3.fromRGB(37, 40, 49)
            Slider.BorderColor3 = Color3.fromRGB(27, 42, 53)
            SliderPad.PaddingBottom = UDim.new(0, 6)
            SliderPad.PaddingLeft = UDim.new(0, 6)
            SliderPad.PaddingRight = UDim.new(0, 6)
            SliderPad.PaddingTop = UDim.new(0, 6)
            SliderCorner.CornerRadius = UDim.new(0, 8)

            SliderTitle.Name = "Title"
            SliderTitle.Size = UDim2.new(1, -55, 1, -13)
            SliderTitle.BackgroundTransparency = 1
            SliderTitle.Text = sldTitle
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            SliderTitle.TextSize = 16
            SliderTitle.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold)

            SliderBack.Name = "SliderBack"
            SliderBack.Size = UDim2.new(0, 354, 0, 9)
            SliderBack.Position = UDim2.new(0, 0, 1, 0)
            SliderBack.BackgroundColor3 = Color3.fromRGB(12, 15, 24)
            SliderBack.BorderColor3 = Color3.fromRGB(27, 42, 53)
            SliderBack.AnchorPoint = Vector2.new(0, 1)
            SliderBack.Text = ""
            SliderBack.AutoButtonColor = false
            BackCorner.CornerRadius = UDim.new(0, 8)

            SliderDrag.Name = "Draggable"
            SliderDrag.Size = UDim2.new(0, 0, 1, 0)
            SliderDrag.BackgroundColor3 = Color3.fromRGB(67, 70, 79)
            SliderDrag.BorderColor3 = Color3.fromRGB(27, 42, 53)
            DragCorner.CornerRadius = UDim.new(0, 8)

            SliderValue.Name = "Value"
            SliderValue.Size = UDim2.new(0, 27, 1, -14)
            SliderValue.Position = UDim2.new(1, 0, 0, 0)
            SliderValue.BackgroundColor3 = Color3.fromRGB(58, 138, 253)
            SliderValue.BorderSizePixel = 0
            SliderValue.AnchorPoint = Vector2.new(1, 0)
            SliderValue.Text = min
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 15
            SliderValue.FontFace = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium)
            ValueCorner.CornerRadius = UDim.new(0, 6)
            upSize()

            local value
            SliderBack.MouseButton1Down:Connect(function()
                if not focus then
                    tween:Create(Slider, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(40, 60, 89)}):Play()
                    tween:Create(SliderDrag, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(65, 85, 114)}):Play()
                    tween:Create(SliderBack, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(15, 18, 27)}):Play()
                    value = math.floor((((tonumber(max) - tonumber(min)) / 354) * SliderDrag.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(value)
                    end)
                    SliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 354), 0, 9), "InOut", "Linear", 0.05, true)
                    moveconnection = mouse.Move:Connect(function()
                        SliderValue.Text = value
                        value = math.floor((((tonumber(max) - tonumber(min)) / 354) * SliderDrag.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(value)
                        end)
                        SliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 354), 0, 9), "InOut", "Linear", 0.05, true)
                    end)
                    releaseconnection = UIS.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
                            tween:Create(Slider, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(37, 40, 49)}):Play()
                            tween:Create(SliderDrag, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(67, 70, 79)}):Play()
                            tween:Create(SliderBack, tweenInfo(.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out, 0, false, 0), {BackgroundColor3 = Color3.fromRGB(12, 15, 24)}):Play()
                            value = math.floor((((tonumber(max) - tonumber(min)) / 354) * SliderDrag.AbsoluteSize.X) + tonumber(min))
                            pcall(function()
                                callback(value)
                            end)
                            SliderValue.Text = value
                            SliderDrag:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderDrag.AbsolutePosition.X, 0, 354), 0, 9), "InOut", "Linear", 0.05, true)
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end
            end)
        end
        return Content
    end
    return TabCreate
end
return CalHub
