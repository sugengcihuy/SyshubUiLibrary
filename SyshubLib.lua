-- SyshubLib
local SyshubLib = {}
SyshubLib.__index = SyshubLib

-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- GlobalScope
local C_White = Color3.fromRGB(255, 255, 255)
local C_Black = Color3.fromRGB(0, 0, 0)

local E_LJM_Round = Enum.LineJoinMode.Round
local E_LJM_Bevel = Enum.LineJoinMode.Bevel
local E_SSM_Fixed = Enum.StrokeSizingMode.FixedSize
local E_SSM_Scaled = Enum.StrokeSizingMode.ScaledSize
local E_ASM_Context = Enum.ApplyStrokeMode.Contextual
local E_ASM_Border = Enum.ApplyStrokeMode.Border
local E_BSP_Outer = Enum.BorderStrokePosition.Outer
local E_BSP_Center = Enum.BorderStrokePosition.Center
local E_BSP_Inner = Enum.BorderStrokePosition.Inner
local E_FS_Normal = Enum.FontStyle.Normal
local E_FW_Bold = Enum.FontWeight.Bold
local E_FW_Heavy = Enum.FontWeight.Heavy
local E_ST_Tile = Enum.ScaleType.Tile
local E_ST_Fit = Enum.ScaleType.Fit
local E_ST_Crop = Enum.ScaleType.Crop
local E_TXA_Left = Enum.TextXAlignment.Left
local E_SO_Layout = Enum.SortOrder.LayoutOrder
local E_AS_Y = Enum.AutomaticSize.Y
local E_SD_Y = Enum.ScrollingDirection.Y
local E_ZIB_Sibling = Enum.ZIndexBehavior.Sibling

local F_Gotham = Font.new("rbxasset://fonts/families/GothamSSm.json", E_FW_Bold, E_FS_Normal)
local F_GothamHeavy = Font.new("rbxasset://fonts/families/GothamSSm.json", E_FW_Heavy, E_FS_Normal)
local F_Fredoka = Font.new("rbxasset://fonts/families/FredokaOne.json", E_FW_Bold, E_FS_Normal)
local F_SourceSans = Font.new("rbxasset://fonts/families/SourceSansPro.json", E_FW_Bold, E_FS_Normal)

-- Icons
SyshubLib.Icons = {
    Tabs = {
        StealAnEgg        = "rbxassetid://106070557495073",
        Batu              = "rbxassetid://82488028040593",
        PickAxe           = "rbxassetid://118395707292811",
        Binatang          = "rbxassetid://135415406785593",
        Pedang            = "rbxassetid://88232276422832",
        Ikan              = "rbxassetid://140464235181887",
        Tanaman           = "rbxassetid://73991152696434",
        Naga              = "rbxassetid://139006753312271",
        ViolanceDistrict  = "rbxassetid://130144978696466",
        Settings          = "rbxassetid://109119318751042",
        About             = "rbxassetid://109670732793613",
        AutoOpenGreen     = "rbxassetid://114151815303601",
        AutoOpenRed       = "rbxassetid://88614815130985",
        Bell1             = "rbxassetid://120338748385766",
        Bell2             = "rbxassetid://114429603032282",
        BigStar           = "rbxassetid://85858634130907",
        BlueAura          = "rbxassetid://110816145906674",
        BlueGem           = "rbxassetid://75580642423589",
        Bookmark          = "rbxassetid://101152509944101",
        BubbleChat        = "rbxassetid://125107132232172",
        Bunny             = "rbxassetid://137282305910319",
        Candy             = "rbxassetid://107489925838428",
        Checkmark         = "rbxassetid://83708233934996",
        Chest             = "rbxassetid://102956697385732",
        Coin              = "rbxassetid://88382198987921",
        CreditCard        = "rbxassetid://90010954940652",
        Crown             = "rbxassetid://73295014100262",
        Cursor            = "rbxassetid://95425660986390",
        Dice              = "rbxassetid://72122950854575",
        Exclamation       = "rbxassetid://112139757122250",
        Eye               = "rbxassetid://106865999691846",
        FallingStar       = "rbxassetid://94309158367364",
        GiftBox           = "rbxassetid://75703927295225",
        Hammer            = "rbxassetid://107489925838428",
        Heart             = "rbxassetid://74543813107342",
        HornFacePurple    = "rbxassetid://88726867014737",
        House             = "rbxassetid://79972589464606",
        Leaf              = "rbxassetid://133666084176509",
        Lightning         = "rbxassetid://87966269918249",
        LuckyBox          = "rbxassetid://75518129530249",
        Magnet            = "rbxassetid://117127789797812",
        Map               = "rbxassetid://114668846770008",
        MapScroll         = "rbxassetid://114151815303601",
        Medal             = "rbxassetid://91326725777834",
        Money             = "rbxassetid://135201184502217",
        PaperPlane        = "rbxassetid://77511493233901",
        Pencil            = "rbxassetid://120277354690239",
        PlayerFace        = "rbxassetid://109877092320110",
        PlayerProfile     = "rbxassetid://117854237557010",
        Portal            = "rbxassetid://139112742608203",
        Potion            = "rbxassetid://132237733135257",
        PurpleGem         = "rbxassetid://82992727196826",
        RedAura           = "rbxassetid://99401355800318",
        Rocket            = "rbxassetid://112222764547785",
        ScriptPaper       = "rbxassetid://121191202957596",
        Shield            = "rbxassetid://129202095919343",
        Shop              = "rbxassetid://137394132151437",
        Shovel            = "rbxassetid://128628883621881",
        Skip              = "rbxassetid://127396413158931",
        Skull             = "rbxassetid://119722740925900",
        Social            = "rbxassetid://94216614679568",
        SpeedShoe         = "rbxassetid://104220024494992",
        Star              = "rbxassetid://123051928989197",
        Stats             = "rbxassetid://80720489809147",
        Sword             = "rbxassetid://89640140000321",
        Target            = "rbxassetid://129363862756016",
        Trail             = "rbxassetid://126542463069678",
        Trophy            = "rbxassetid://131944713163617",
        Waypoint          = "rbxassetid://95141033904056",
        Webhook           = "rbxassetid://128850841983698",
    },
    Branding = {
        MainLogo          = "rbxassetid://73996941491460",
        MinimizeIcon      = "rbxassetid://116139716819353",
        SideMenuHeader    = "rbxassetid://102171457370701",
    },
    Controls = {
        Close             = "rbxassetid://121177348326161",
        Minimize          = "rbxassetid://112145138181367",
        AccordionArrow    = "rbxassetid://101774428037241",
        DropdownArrow     = "rbxassetid://132016203434518",
        Plus              = "rbxassetid://77098120677548",
        Minus             = "rbxassetid://100944850081529",
        KeyIcon           = "rbxassetid://137132963533530",
    }
}
SyshubLib.Icons.Assets = SyshubLib.Icons.Tabs

-- DropScrollFrame
function SyshubLib.BuildDropScroll()
    local dropScroll = Instance.new("ScrollingFrame")
    dropScroll.Name = "DropScrollFrame"
    dropScroll.AutomaticCanvasSize = E_AS_Y
    dropScroll.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    dropScroll.BackgroundTransparency = 0.15
    dropScroll.BorderSizePixel = 0
    dropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    dropScroll.ScrollBarImageColor3 = Color3.fromRGB(85, 255, 0)
    dropScroll.ScrollBarImageTransparency = 0.2
    dropScroll.ScrollBarThickness = 3
    dropScroll.ScrollingDirection = E_SD_Y
    dropScroll.Size = UDim2.new(0, 222, 0, 100)
    dropScroll.ZIndex = 5000
    dropScroll.ClipsDescendants = true

    local corner = Instance.new("UICorner")
    corner.Name = "UICorner"
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = dropScroll

    local outerStroke = Instance.new("UIStroke")
    outerStroke.Name = "UIStrokeOuter"
    outerStroke.ApplyStrokeMode = E_ASM_Context
    outerStroke.BorderStrokePosition = E_BSP_Outer
    outerStroke.Color = C_Black
    outerStroke.LineJoinMode = E_LJM_Round
    outerStroke.StrokeSizingMode = E_SSM_Fixed
    outerStroke.Thickness = 1.5
    outerStroke.Transparency = 0
    outerStroke.ZIndex = 1
    outerStroke.Parent = dropScroll

    local innerStroke = Instance.new("UIStroke")
    innerStroke.Name = "UIStrokeInner"
    innerStroke.ApplyStrokeMode = E_ASM_Context
    innerStroke.BorderStrokePosition = E_BSP_Inner
    innerStroke.Color = Color3.fromRGB(70, 70, 70)
    innerStroke.LineJoinMode = E_LJM_Round
    innerStroke.StrokeSizingMode = E_SSM_Fixed
    innerStroke.Thickness = 1
    innerStroke.Transparency = 0
    innerStroke.ZIndex = 1
    innerStroke.Parent = dropScroll

    local listLayout = Instance.new("UIListLayout")
    listLayout.Name = "UIListLayout"
    listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    listLayout.Padding = UDim.new(0, 4)
    listLayout.SortOrder = E_SO_Layout
    listLayout.Parent = dropScroll

    local padding = Instance.new("UIPadding")
    padding.Name = "UIPadding"
    padding.PaddingBottom = UDim.new(0, 4)
    padding.PaddingLeft = UDim.new(0, 4)
    padding.PaddingRight = UDim.new(0, 4)
    padding.PaddingTop = UDim.new(0, 4)
    padding.Parent = dropScroll

    local opt = Instance.new("TextButton")
    opt.Name = "OptionTemplate"
    opt.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
    opt.BackgroundTransparency = 0.3
    opt.FontFace = F_Gotham
    opt.LayoutOrder = 1
    opt.Size = UDim2.new(1, -4, 0, 26)
    opt.Text = "Option 1"
    opt.TextColor3 = Color3.fromRGB(240, 240, 240)
    opt.TextSize = 13
    opt.TextStrokeTransparency = 0
    opt.TextWrapped = true
    opt.ZIndex = 5005
    opt.Visible = false
    opt.Parent = dropScroll

    local optCorner = Instance.new("UICorner")
    optCorner.Name = "UICorner"
    optCorner.CornerRadius = UDim.new(0, 4)
    optCorner.Parent = opt

    local optStroke = Instance.new("UIStroke")
    optStroke.Name = "UIStroke"
    optStroke.ApplyStrokeMode = E_ASM_Border
    optStroke.BorderStrokePosition = E_BSP_Outer
    optStroke.Color = C_Black
    optStroke.LineJoinMode = E_LJM_Round
    optStroke.StrokeSizingMode = E_SSM_Fixed
    optStroke.Thickness = 1
    optStroke.Transparency = 0
    optStroke.ZIndex = 1
    optStroke.Parent = opt

    return dropScroll
end

-- Main Ui
-- Save Modal
function SyshubLib.BuildSaveModal(parent)
    local bgFrame = Instance.new("Frame")
    bgFrame.Name = "SaveConfigModal"
    bgFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    bgFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    bgFrame.Size = UDim2.new(0, 185, 0, 111)
    bgFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    bgFrame.BackgroundTransparency = 0.4
    bgFrame.BorderSizePixel = 0
    bgFrame.ZIndex = 10000
    bgFrame.Visible = false

    local bgCorner = Instance.new("UICorner")
    bgCorner.Name = "UICorner"
    bgCorner.CornerRadius = UDim.new(0, 5)
    bgCorner.Parent = bgFrame

    local bgStrokeOuter = Instance.new("UIStroke")
    bgStrokeOuter.Name = "UIStrokeOuter"
    bgStrokeOuter.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    bgStrokeOuter.BorderStrokePosition = Enum.BorderStrokePosition.Outer
    bgStrokeOuter.Color = C_Black
    bgStrokeOuter.Thickness = 1.5
    bgStrokeOuter.Parent = bgFrame

    local bgStrokeInner = Instance.new("UIStroke")
    bgStrokeInner.Name = "UIStrokeInner"
    bgStrokeInner.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    bgStrokeInner.BorderStrokePosition = Enum.BorderStrokePosition.Inner
    bgStrokeInner.Color = Color3.fromRGB(61, 61, 61)
    bgStrokeInner.Thickness = 1.5
    bgStrokeInner.Parent = bgFrame

    -- InputNameBox
    local inputBox = Instance.new("TextBox")
    inputBox.Name = "InputNameBox"
    inputBox.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
    inputBox.BackgroundTransparency = 0.6
    inputBox.BorderSizePixel = 0
    inputBox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    inputBox.PlaceholderText = "Input Name.."
    inputBox.PlaceholderColor3 = Color3.fromRGB(180, 180, 180)
    inputBox.Position = UDim2.new(0.037837836891413, 0, 0.13513512909412, 0)
    inputBox.Size = UDim2.new(0, 170, 0, 33)
    inputBox.Text = ""
    inputBox.TextColor3 = C_White
    inputBox.TextSize = 14
    inputBox.TextStrokeTransparency = 0
    inputBox.TextWrapped = true
    inputBox.ClearTextOnFocus = false
    inputBox.ZIndex = 10001
    inputBox.Parent = bgFrame

    local boxCorner = Instance.new("UICorner")
    boxCorner.CornerRadius = UDim.new(0, 5)
    boxCorner.Parent = inputBox

    local boxStrokeOuter = Instance.new("UIStroke")
    boxStrokeOuter.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStrokeOuter.BorderStrokePosition = Enum.BorderStrokePosition.Outer
    boxStrokeOuter.Color = C_Black
    boxStrokeOuter.Thickness = 1.5
    boxStrokeOuter.Parent = inputBox

    local boxStrokeInner = Instance.new("UIStroke")
    boxStrokeInner.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    boxStrokeInner.BorderStrokePosition = Enum.BorderStrokePosition.Inner
    boxStrokeInner.Color = Color3.fromRGB(61, 61, 61)
    boxStrokeInner.Thickness = 1.5
    boxStrokeInner.Parent = inputBox

    -- Confirmbtn
    local confirmBtn = Instance.new("ImageButton")
    confirmBtn.Name = "Confirmbtn"
    confirmBtn.BackgroundColor3 = C_White
    confirmBtn.BorderSizePixel = 0
    confirmBtn.Position = UDim2.new(0.52432429790497, 0, 0.65765768289566, 0)
    confirmBtn.Size = UDim2.new(0, 80, 0, 31)
    confirmBtn.ZIndex = 10001
    confirmBtn.Parent = bgFrame

    local confirmCorner = Instance.new("UICorner")
    confirmCorner.CornerRadius = UDim.new(0, 5)
    confirmCorner.Parent = confirmBtn

    local confirmStroke = Instance.new("UIStroke")
    confirmStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    confirmStroke.BorderStrokePosition = Enum.BorderStrokePosition.Center
    confirmStroke.Color = C_Black
    confirmStroke.Thickness = 2
    confirmStroke.Parent = confirmBtn

    local confirmGrad = Instance.new("UIGradient")
    confirmGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(212, 255, 0))
    })
    confirmGrad.Rotation = 90
    confirmGrad.Parent = confirmBtn

    local confirmTxt = Instance.new("TextLabel")
    confirmTxt.Name = "ConfirmText"
    confirmTxt.BackgroundTransparency = 1
    confirmTxt.BorderSizePixel = 0
    confirmTxt.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    confirmTxt.Position = UDim2.new(0.11249999701977, 0, 0.096774190664291, 0)
    confirmTxt.Size = UDim2.new(0, 62, 0, 25)
    confirmTxt.Text = "Confirm"
    confirmTxt.TextColor3 = C_White
    confirmTxt.TextScaled = true
    confirmTxt.TextSize = 14
    confirmTxt.TextWrapped = true
    confirmTxt.ZIndex = 10002
    confirmTxt.Parent = confirmBtn

    local confirmTxtStroke = Instance.new("UIStroke")
    confirmTxtStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    confirmTxtStroke.BorderStrokePosition = Enum.BorderStrokePosition.Outer
    confirmTxtStroke.Color = C_Black
    confirmTxtStroke.Thickness = 2
    confirmTxtStroke.Parent = confirmTxt

    -- Cancelbtn
    local cancelBtn = Instance.new("ImageButton")
    cancelBtn.Name = "Cancelbtn"
    cancelBtn.BackgroundColor3 = C_White
    cancelBtn.BorderSizePixel = 0
    cancelBtn.Position = UDim2.new(0.037837836891413, 0, 0.65765768289566, 0)
    cancelBtn.Size = UDim2.new(0, 80, 0, 31)
    cancelBtn.ZIndex = 10001
    cancelBtn.Parent = bgFrame

    local cancelCorner = Instance.new("UICorner")
    cancelCorner.CornerRadius = UDim.new(0, 5)
    cancelCorner.Parent = cancelBtn

    local cancelStroke = Instance.new("UIStroke")
    cancelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    cancelStroke.BorderStrokePosition = Enum.BorderStrokePosition.Center
    cancelStroke.Color = C_Black
    cancelStroke.Thickness = 2
    cancelStroke.Parent = cancelBtn

    local cancelGrad = Instance.new("UIGradient")
    cancelGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 149, 0))
    })
    cancelGrad.Rotation = 90
    cancelGrad.Parent = cancelBtn

    local cancelTxt = Instance.new("TextLabel")
    cancelTxt.Name = "CancelText"
    cancelTxt.BackgroundTransparency = 1
    cancelTxt.BorderSizePixel = 0
    cancelTxt.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    cancelTxt.Position = UDim2.new(0.11249999701977, 0, 0.096774190664291, 0)
    cancelTxt.Size = UDim2.new(0, 62, 0, 25)
    cancelTxt.Text = "Cancel"
    cancelTxt.TextColor3 = C_White
    cancelTxt.TextScaled = true
    cancelTxt.TextSize = 14
    cancelTxt.TextWrapped = true
    cancelTxt.ZIndex = 10002
    cancelTxt.Parent = cancelBtn

    local cancelTxtStroke = Instance.new("UIStroke")
    cancelTxtStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
    cancelTxtStroke.BorderStrokePosition = Enum.BorderStrokePosition.Outer
    cancelTxtStroke.Color = C_Black
    cancelTxtStroke.Thickness = 2
    cancelTxtStroke.Parent = cancelTxt

    if parent then
        bgFrame.Parent = parent
    end

    return bgFrame, inputBox, confirmBtn, cancelBtn
end

-- WebhookTemplate
function SyshubLib.BuildWebhookTemplate()
    local cGroup = Instance.new("CanvasGroup")
    cGroup.Name = "TemplateWebhook"
    cGroup.BackgroundColor3 = Color3.fromRGB(0, 51, 75)
    cGroup.BorderColor3 = C_Black
    cGroup.BorderSizePixel = 0
    cGroup.Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0)
    cGroup.Size = UDim2.new(0, 524, 0, 56)

    local corner1 = Instance.new("UICorner")
    corner1.Name = "UICorner"
    corner1.Parent = cGroup

    local stroke1 = Instance.new("UIStroke")
    stroke1.Name = "UIStroke"
    stroke1.ApplyStrokeMode = E_ASM_Context
    stroke1.BorderStrokePosition = E_BSP_Center
    stroke1.Color = C_Black
    stroke1.Enabled = true
    stroke1.LineJoinMode = E_LJM_Round
    stroke1.StrokeSizingMode = E_SSM_Fixed
    stroke1.Thickness = 1.5
    stroke1.Transparency = 0
    stroke1.ZIndex = 1
    stroke1.Parent = cGroup

    local gradFrame = Instance.new("Frame")
    gradFrame.Name = "Gradient"
    gradFrame.BackgroundColor3 = C_White
    gradFrame.BorderColor3 = C_Black
    gradFrame.BorderSizePixel = 0
    gradFrame.Position = UDim2.new(0, 0, -0.0011961801210418, 0)
    gradFrame.Size = UDim2.new(0, 524, 0, 51)
    gradFrame.Parent = cGroup

    local corner2 = Instance.new("UICorner")
    corner2.Name = "UICorner"
    corner2.Parent = gradFrame

    local uigrad = Instance.new("UIGradient")
    uigrad.Name = "UIGradient"
    uigrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))
    })
    uigrad.Rotation = 90
    uigrad.Parent = gradFrame

    local stud = Instance.new("ImageLabel")
    stud.Name = "Stud"
    stud.AnchorPoint = Vector2.new(0.5, 0.5)
    stud.BackgroundColor3 = C_White
    stud.BackgroundTransparency = 1
    stud.BorderColor3 = C_Black
    stud.BorderSizePixel = 0
    stud.Image = "rbxassetid://6927295847"
    stud.ImageColor3 = Color3.fromRGB(0, 170, 255)
    stud.Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0)
    stud.ScaleType = E_ST_Tile
    stud.Size = UDim2.new(0, 523, 0, 53)
    stud.TileSize = UDim2.new(0, 80, 0, 80)
    stud.Parent = gradFrame

    local rays1 = Instance.new("ImageLabel")
    rays1.Name = "Rays"
    rays1.AnchorPoint = Vector2.new(0.5, 0.5)
    rays1.BackgroundColor3 = C_White
    rays1.BackgroundTransparency = 1
    rays1.BorderColor3 = C_Black
    rays1.BorderSizePixel = 0
    rays1.Image = "rbxassetid://80179449391256"
    rays1.Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0)
    rays1.Size = UDim2.new(0, 158, 0, 56)
    rays1.Parent = gradFrame

    local rays2 = Instance.new("ImageLabel")
    rays2.Name = "Rays"
    rays2.AnchorPoint = Vector2.new(0.5, 0.5)
    rays2.BackgroundColor3 = C_White
    rays2.BackgroundTransparency = 1
    rays2.BorderColor3 = C_Black
    rays2.BorderSizePixel = 0
    rays2.Image = "rbxassetid://98981360538955"
    rays2.Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0)
    rays2.Size = UDim2.new(0, 158, 0, 50)
    rays2.Parent = gradFrame

    local inputBox = Instance.new("TextBox")
    inputBox.Name = "InputBox"
    inputBox.BackgroundColor3 = Color3.fromRGB(58, 58, 58)
    inputBox.BackgroundTransparency = 0.6
    inputBox.BorderColor3 = C_Black
    inputBox.BorderSizePixel = 0
    inputBox.CursorPosition = -1
    inputBox.FontFace = F_Gotham
    inputBox.PlaceholderColor3 = Color3.fromRGB(79, 79, 79)
    inputBox.PlaceholderText = "https://discord.com"
    inputBox.Position = UDim2.new(0.29007634520531, 0, 0.16036388278008, 0)
    inputBox.Size = UDim2.new(0, 280, 0, 30)
    inputBox.Text = ""
    inputBox.TextColor3 = C_White
    inputBox.TextSize = 18
    inputBox.TextTruncate = Enum.TextTruncate.AtEnd
    inputBox.TextWrapped = true
    inputBox.ClearTextOnFocus = false
    inputBox.Parent = cGroup

    local inStroke1 = Instance.new("UIStroke")
    inStroke1.Name = "UIStroke"
    inStroke1.ApplyStrokeMode = E_ASM_Border
    inStroke1.BorderStrokePosition = E_BSP_Outer
    inStroke1.Color = C_Black
    inStroke1.Enabled = true
    inStroke1.LineJoinMode = E_LJM_Round
    inStroke1.StrokeSizingMode = E_SSM_Fixed
    inStroke1.Thickness = 1.5
    inStroke1.Transparency = 0
    inStroke1.ZIndex = 1
    inStroke1.Parent = inputBox

    local inStroke2 = Instance.new("UIStroke")
    inStroke2.Name = "UIStroke"
    inStroke2.ApplyStrokeMode = E_ASM_Border
    inStroke2.BorderStrokePosition = E_BSP_Inner
    inStroke2.Color = Color3.fromRGB(76, 76, 76)
    inStroke2.Enabled = true
    inStroke2.LineJoinMode = E_LJM_Round
    inStroke2.StrokeSizingMode = E_SSM_Fixed
    inStroke2.Thickness = 1.5
    inStroke2.Transparency = 0
    inStroke2.ZIndex = 1
    inStroke2.Parent = inputBox

    local inCorner = Instance.new("UICorner")
    inCorner.Name = "UICorner"
    inCorner.CornerRadius = UDim.new(0.1, 0)
    inCorner.Parent = inputBox

    local inStroke3 = Instance.new("UIStroke")
    inStroke3.Name = "UIStroke"
    inStroke3.ApplyStrokeMode = E_ASM_Context
    inStroke3.BorderStrokePosition = E_BSP_Outer
    inStroke3.Color = C_Black
    inStroke3.Enabled = true
    inStroke3.LineJoinMode = E_LJM_Bevel
    inStroke3.StrokeSizingMode = E_SSM_Fixed
    inStroke3.Thickness = 3
    inStroke3.Transparency = 0
    inStroke3.ZIndex = 1
    inStroke3.Parent = inputBox

    local inPadding = Instance.new("UIPadding")
    inPadding.Name = "UIPadding"
    inPadding.PaddingLeft = UDim.new(0, 10)
    inPadding.PaddingRight = UDim.new(0, 10)
    inPadding.Parent = inputBox

    -- Toggle Button
    local toggleBtn = Instance.new("ImageButton")
    toggleBtn.Name = "Togglebtn"
    toggleBtn.BackgroundColor3 = Color3.fromRGB(74, 74, 74)
    toggleBtn.BackgroundTransparency = 0.5
    toggleBtn.BorderColor3 = C_Black
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0)
    toggleBtn.Size = UDim2.new(0, 70, 0, 31)
    toggleBtn.ZIndex = 2
    toggleBtn.Parent = cGroup

    local togCorner = Instance.new("UICorner")
    togCorner.Name = "UICorner"
    togCorner.CornerRadius = UDim.new(0.1, 0)
    togCorner.Parent = toggleBtn

    local togStroke1 = Instance.new("UIStroke")
    togStroke1.Name = "UIStroke"
    togStroke1.ApplyStrokeMode = E_ASM_Context
    togStroke1.BorderStrokePosition = E_BSP_Outer
    togStroke1.Color = C_Black
    togStroke1.Enabled = true
    togStroke1.LineJoinMode = E_LJM_Round
    togStroke1.StrokeSizingMode = E_SSM_Fixed
    togStroke1.Thickness = 1.5
    togStroke1.Parent = toggleBtn

    local togStroke2 = Instance.new("UIStroke")
    togStroke2.Name = "UIStroke"
    togStroke2.ApplyStrokeMode = E_ASM_Context
    togStroke2.BorderStrokePosition = E_BSP_Inner
    togStroke2.Color = Color3.fromRGB(76, 76, 76)
    togStroke2.Enabled = true
    togStroke2.LineJoinMode = E_LJM_Round
    togStroke2.StrokeSizingMode = E_SSM_Fixed
    togStroke2.Thickness = 1.5
    togStroke2.Parent = toggleBtn

    local indFrame = Instance.new("Frame")
    indFrame.Name = "IndikatorFrame"
    indFrame.BackgroundColor3 = C_White
    indFrame.BorderColor3 = C_Black
    indFrame.BorderSizePixel = 0
    indFrame.Position = UDim2.new(0.07, 0, 0.096774190664291, 0)
    indFrame.Size = UDim2.new(0, 25, 0, 25)
    indFrame.Parent = toggleBtn

    local indStroke = Instance.new("UIStroke")
    indStroke.Name = "UIStroke"
    indStroke.ApplyStrokeMode = E_ASM_Context
    indStroke.BorderStrokePosition = E_BSP_Outer
    indStroke.Color = Color3.fromRGB(16, 20, 26)
    indStroke.Enabled = true
    indStroke.LineJoinMode = E_LJM_Round
    indStroke.StrokeSizingMode = E_SSM_Fixed
    indStroke.Thickness = 2.5
    indStroke.Parent = indFrame

    local indCorner = Instance.new("UICorner")
    indCorner.Name = "UICorner"
    indCorner.CornerRadius = UDim.new(0.1, 0)
    indCorner.Parent = indFrame

    local indGrad = Instance.new("UIGradient")
    indGrad.Name = "UIGradient"
    indGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
    })
    indGrad.Rotation = 90
    indGrad.Parent = indFrame

    local titleTxt = Instance.new("TextLabel")
    titleTxt.Name = "TitleText"
    titleTxt.AnchorPoint = Vector2.new(0.5, 0.5)
    titleTxt.BackgroundColor3 = C_White
    titleTxt.BackgroundTransparency = 1
    titleTxt.BorderColor3 = C_Black
    titleTxt.BorderSizePixel = 0
    titleTxt.FontFace = F_Fredoka
    titleTxt.Position = UDim2.new(0.13731057941914, 0, 0.43346214294434, 0)
    titleTxt.Size = UDim2.new(0, 121, 0, 36)
    titleTxt.Text = "Webhook URL"
    titleTxt.TextColor3 = C_White
    titleTxt.TextScaled = true
    titleTxt.TextSize = 14
    titleTxt.TextWrapped = true
    titleTxt.Parent = cGroup

    local titleStroke = Instance.new("UIStroke")
    titleStroke.Name = "UIStroke"
    titleStroke.ApplyStrokeMode = E_ASM_Context
    titleStroke.BorderStrokePosition = E_BSP_Outer
    titleStroke.Color = C_Black
    titleStroke.Enabled = true
    titleStroke.LineJoinMode = E_LJM_Round
    titleStroke.StrokeSizingMode = E_SSM_Fixed
    titleStroke.Thickness = 4
    titleStroke.Transparency = 0
    titleStroke.ZIndex = 1
    titleStroke.Parent = titleTxt

    return cGroup
end

-- ButtonTextTemplate
function SyshubLib.BuildButtonTextTemplate()
    local btn = Instance.new("ImageButton")
    btn.Name = "TemplateButtonText"
    btn.BackgroundColor3 = C_White
    btn.BorderColor3 = C_Black
    btn.BorderSizePixel = 0
    btn.Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0)
    btn.Size = UDim2.new(0, 70, 0, 31)
    btn.ZIndex = 2

    local corner = Instance.new("UICorner")
    corner.Name = "UICorner"
    corner.CornerRadius = UDim.new(0.1, 0)
    corner.Parent = btn

    local outStroke = Instance.new("UIStroke")
    outStroke.Name = "UIStroke"
    outStroke.ApplyStrokeMode = E_ASM_Context
    outStroke.BorderStrokePosition = E_BSP_Outer
    outStroke.Color = C_Black
    outStroke.Enabled = true
    outStroke.LineJoinMode = E_LJM_Round
    outStroke.StrokeSizingMode = E_SSM_Fixed
    outStroke.Thickness = 1.5
    outStroke.Transparency = 0
    outStroke.ZIndex = 1
    outStroke.Parent = btn

    local inStroke = Instance.new("UIStroke")
    inStroke.Name = "UIStroke"
    inStroke.ApplyStrokeMode = E_ASM_Context
    inStroke.BorderStrokePosition = E_BSP_Inner
    inStroke.Color = Color3.fromRGB(76, 76, 76)
    inStroke.Enabled = true
    inStroke.LineJoinMode = E_LJM_Round
    inStroke.StrokeSizingMode = E_SSM_Fixed
    inStroke.Thickness = 1.5
    inStroke.Transparency = 0
    inStroke.ZIndex = 1
    inStroke.Parent = btn

    local grad = Instance.new("UIGradient")
    grad.Name = "UIGradient"
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 255, 0))
    })
    grad.Rotation = 90
    grad.Parent = btn

    local lbl = Instance.new("TextLabel")
    lbl.Name = "TitleText"
    lbl.AnchorPoint = Vector2.new(0.5, 0.5)
    lbl.BackgroundColor3 = C_White
    lbl.BackgroundTransparency = 1
    lbl.BorderColor3 = C_Black
    lbl.BorderSizePixel = 0
    lbl.FontFace = F_Fredoka
    lbl.Position = UDim2.new(0.49443098902702, 0, 0.4818489253521, 0)
    lbl.Size = UDim2.new(0, 66, 0, 21)
    lbl.Text = "Contoh Aja"
    lbl.TextColor3 = C_White
    lbl.TextScaled = true
    lbl.TextSize = 14
    lbl.TextWrapped = true
    lbl.Parent = btn

    local lblStroke = Instance.new("UIStroke")
    lblStroke.Name = "UIStroke"
    lblStroke.ApplyStrokeMode = E_ASM_Context
    lblStroke.BorderStrokePosition = E_BSP_Outer
    lblStroke.Color = C_Black
    lblStroke.Enabled = true
    lblStroke.LineJoinMode = E_LJM_Round
    lblStroke.StrokeSizingMode = E_SSM_Fixed
    lblStroke.Thickness = 2
    lblStroke.Transparency = 0
    lblStroke.ZIndex = 1
    lblStroke.Parent = lbl

    return btn
end

-- ButtonIconTemplate
function SyshubLib.BuildButtonIconTemplate()
    local btn = Instance.new("ImageButton")
    btn.Name = "TemplateButtonIcon"
    btn.BackgroundColor3 = C_White
    btn.BorderColor3 = C_Black
    btn.BorderSizePixel = 0
    btn.Position = UDim2.new(0.84351146221161, 0, 0.23179244995117, 0)
    btn.Size = UDim2.new(0, 70, 0, 31)
    btn.ZIndex = 2

    local corner = Instance.new("UICorner")
    corner.Name = "UICorner"
    corner.CornerRadius = UDim.new(0.1, 0)
    corner.Parent = btn

    local outStroke = Instance.new("UIStroke")
    outStroke.Name = "UIStroke"
    outStroke.ApplyStrokeMode = E_ASM_Context
    outStroke.BorderStrokePosition = E_BSP_Outer
    outStroke.Color = C_Black
    outStroke.Enabled = true
    outStroke.LineJoinMode = E_LJM_Round
    outStroke.StrokeSizingMode = E_SSM_Fixed
    outStroke.Thickness = 1.5
    outStroke.Transparency = 0
    outStroke.ZIndex = 1
    outStroke.Parent = btn

    local inStroke = Instance.new("UIStroke")
    inStroke.Name = "UIStroke"
    inStroke.ApplyStrokeMode = E_ASM_Context
    inStroke.BorderStrokePosition = E_BSP_Inner
    inStroke.Color = Color3.fromRGB(76, 76, 76)
    inStroke.Enabled = true
    inStroke.LineJoinMode = E_LJM_Round
    inStroke.StrokeSizingMode = E_SSM_Fixed
    inStroke.Thickness = 1.5
    inStroke.Transparency = 0
    inStroke.ZIndex = 1
    inStroke.Parent = btn

    local grad = Instance.new("UIGradient")
    grad.Name = "UIGradient"
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(85, 255, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 255, 0))
    })
    grad.Rotation = 90
    grad.Parent = btn

    local icon = Instance.new("ImageLabel")
    icon.Name = "IconImage"
    icon.BackgroundColor3 = C_White
    icon.BackgroundTransparency = 1
    icon.BorderColor3 = C_Black
    icon.BorderSizePixel = 0
    icon.Image = "rbxassetid://77511493233901"
    icon.Position = UDim2.new(0.28571429848671, 0, 0.032258063554764, 0)
    icon.ScaleType = E_ST_Fit
    icon.Size = UDim2.new(0, 30, 0, 30)
    icon.Parent = btn

    return btn
end

function SyshubLib.BuildGui(targetParent)
    local objects = {}
    local function c(id, className, parentId, props)
        local o = Instance.new(className)
        for k, v in pairs(props) do
            pcall(function() o[k] = v end)
        end
        objects[id] = o
        if parentId ~= 0 then
            pcall(function() o.Parent = objects[parentId] end)
        end
        return o
    end

c(1, "ScreenGui", 0, { Name = "SyshubNewww", Enabled = false, ResetOnSpawn = false, ZIndexBehavior = E_ZIB_Sibling })
c(2, "Frame", 1, { Name = "LoginPageFrame", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.4996485710144, 0, 0.49957093596458, 0), Size = UDim2.new(0, 382, 0, 257), Visible = false, ZIndex = 2 })
c(3, "CanvasGroup", 2, { Name = "LoginPageBg", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, 5.9372720073725e-08, 0), Size = UDim2.new(0, 382, 0, 266) })
c(4, "UICorner", 3, { Name = "UICorner" })
c(5, "UIStroke", 3, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(6, "ImageLabel", 3, { Name = "Logo", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://73996941491460", Position = UDim2.new(0.48691099882126, 0, 0.15369649231434, 0), Size = UDim2.new(0, 218, 0, 121) })
c(7, "Frame", 3, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 382, 0, 258) })
c(8, "UICorner", 7, { Name = "UICorner" })
c(9, "UIGradient", 7, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(10, "ImageLabel", 7, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49967277050018, 0, 0.49922144412994, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 381, 0, 257), TileSize = UDim2.new(0, 80, 0, 80) })
c(11, "ImageLabel", 7, { Name = "Dec", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://87607875389487", Position = UDim2.new(0.52356022596359, 0, -0.077519379556179, 0), Rotation = 180, Size = UDim2.new(0, 182, 0, 236) })
c(12, "ImageLabel", 7, { Name = "Dec", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://87607875389487", Position = UDim2.new(0, 0, 0.081395350396633, 0), Size = UDim2.new(0, 182, 0, 236) })
c(13, "UICorner", 12, { Name = "UICorner" })
c(14, "ImageButton", 3, { Name = "Closebtn", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://121177348326161", Position = UDim2.new(0.93982857465744, 0, 0.086405530571938, 0), Size = UDim2.new(0, 30, 0, 30) })
c(15, "ImageLabel", 3, { Name = "SyshybIcon", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://73996941491460", Position = UDim2.new(0.5, 0, 0.2222895771265, 0), Size = UDim2.new(0, 227, 0, 120), Visible = true, ZIndex = 15 })
c(16, "CanvasGroup", 3, { Name = "KeyBg", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11256544291973, 0, 0.3345864713192, 0), Size = UDim2.new(0, 286, 0, 42) })
c(17, "UICorner", 16, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(18, "UIStroke", 16, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(19, "TextBox", 16, { Name = "KeyBox", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Gotham, PlaceholderColor3 = Color3.fromRGB(120, 120, 120), PlaceholderText = "Enter Your Key", RichText = true, Size = UDim2.new(0, 286, 0, 39), Text = "", TextColor3 = C_White, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(20, "UICorner", 19, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(21, "UIGradient", 19, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(22, "UIPadding", 19, { Name = "UIPadding", PaddingBottom = UDim.new(0, 50), PaddingLeft = UDim.new(0, 50), PaddingRight = UDim.new(0, 50), PaddingTop = UDim.new(0, 50) })
c(23, "ImageLabel", 16, { Name = "ImageLabel", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://137132963533530", Position = UDim2.new(0.031468532979488, 0, 0.071428574621677, 0), Size = UDim2.new(0, 35, 0, 35) })
c(24, "CanvasGroup", 3, { Name = "LoginbtnHolder", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.32460734248161, 0, 0.59774434566498, 0), Size = UDim2.new(0, 124, 0, 42) })
c(25, "UICorner", 24, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(26, "UIStroke", 24, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(27, "ImageButton", 24, { Name = "Loginbtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ScaleType = E_ST_Tile, Size = UDim2.new(0, 124, 0, 37), TileSize = UDim2.new(0, 80, 0, 80) })
c(28, "UICorner", 27, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(29, "UIGradient", 27, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(30, "TextLabel", 27, { Name = "LoginText", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Gotham, Position = UDim2.new(0.21774193644524, 0, 0.16216215491295, 0), Size = UDim2.new(0, 69, 0, 25), Text = "Login", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, ZIndex = 2 })
c(31, "UIStroke", 30, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Bevel, StrokeSizingMode = E_SSM_Fixed, Thickness = 4.5999999046326, Transparency = 0, ZIndex = 1 })
c(32, "ImageLabel", 27, { Name = "ImageLabel", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Size = UDim2.new(0, 124, 0, 37) })
c(33, "Frame", 1, { Name = "LoaderFrame", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.5905060172081, 0, 0.49896907806396, 0), Size = UDim2.new(0, 551, 0, 388) })
c(34, "CanvasGroup", 33, { Name = "HeaderFrame", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(0, 57, 84), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0, 0), Size = UDim2.new(0, 551, 0, 62) })
c(35, "UIStroke", 34, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(36, "UICorner", 34, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(37, "Frame", 34, { Name = "Grad", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0.45161288976669, 0), Size = UDim2.new(0, 551, 0, 56) })
c(38, "UICorner", 37, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(39, "UIGradient", 37, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(40, "ImageLabel", 37, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.4910714328289, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 551, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(41, "ImageLabel", 37, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://99539206426667", Position = UDim2.new(0.26678764820099, 0, 0.42857140302658, 0), ScaleType = E_ST_Crop, Size = UDim2.new(0, 294, 0, 62) })
c(42, "ImageLabel", 34, { Name = "SyshybIcon", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://73996941491460", Position = UDim2.new(0.5, 0, 0.45161288976669, 0), Size = UDim2.new(0, 227, 0, 120), Visible = true, ZIndex = 15 })
c(43, "ImageButton", 34, { Name = "Closebtn", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://121177348326161", Position = UDim2.new(0.95553541183472, 0, 0.44354838132858, 0), Size = UDim2.new(0, 30, 0, 30) })
c(44, "ImageButton", 34, { Name = "Minimizebtn", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://112145138181367", Position = UDim2.new(0.88475501537323, 0, 0.44354838132858, 0), Size = UDim2.new(0, 30, 0, 30) })
c(45, "CanvasGroup", 33, { Name = "MainBg", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0.54768043756485, 0), Size = UDim2.new(0, 551, 0, 351) })
c(46, "UIStroke", 45, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(47, "UICorner", 45, { Name = "UICorner" })
c(48, "Frame", 45, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 551, 0, 345) })
c(49, "UICorner", 48, { Name = "UICorner" })
c(50, "UIGradient", 48, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(51, "CanvasGroup", 33, { Name = "SideHeaderBg", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.20508168637753, 0, 0.00096651166677475, 0), Size = UDim2.new(0, 203, 0, 61) })
c(52, "UIStroke", 51, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(53, "UICorner", 51, { Name = "UICorner" })
c(54, "Frame", 51, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011960952542722, 0), Size = UDim2.new(0, 203, 0, 55) })
c(55, "UICorner", 54, { Name = "UICorner" })
c(56, "UIGradient", 54, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(57, "ImageLabel", 54, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(58, "ImageLabel", 54, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(59, "ImageLabel", 54, { Name = "Menuicon", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://102171457370701", Position = UDim2.new(0.1650246232748, 0, 0.5, 0), Size = UDim2.new(0, 51, 0, 43) })
c(60, "TextLabel", 51, { Name = "SideHeader", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61822658777237, 0, 0.43954911828041, 0), Size = UDim2.new(0, 133, 0, 42), Text = "Menu", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(61, "UIStroke", 60, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(62, "Frame", 33, { Name = "SidemenuFrame", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.20377723872662, 0, 0.54768043756485, 0), Size = UDim2.new(0, 224, 0, 351) })
c(63, "ScrollingFrame", 62, { Name = "SidemenuScroll", Active = true, AnchorPoint = Vector2.new(0.5, 0.5), AutomaticCanvasSize = E_AS_Y, BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.49944195151329, 0, 0.5, 0), ScrollBarImageColor3 = C_Black, ScrollBarThickness = 0, ScrollingDirection = E_SD_Y, Size = UDim2.new(0, 223, 0, 351) })
c(64, "UIListLayout", 63, { Name = "UIListLayout", HorizontalAlignment = Enum.HorizontalAlignment.Center, Padding = UDim.new(0, 13), SortOrder = E_SO_Layout })
c(65, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(66, "UICorner", 65, { Name = "UICorner" })
c(67, "CanvasGroup", 65, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(68, "UICorner", 67, { Name = "UICorner" })
c(69, "UIStroke", 67, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(70, "Frame", 67, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(71, "UICorner", 70, { Name = "UICorner" })
c(72, "UIGradient", 70, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(73, "ImageLabel", 70, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(74, "ImageLabel", 70, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(75, "TextLabel", 70, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Steal An Egg", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(76, "UIStroke", 75, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(77, "ImageLabel", 70, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://106070557495073", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(78, "UIPadding", 63, { Name = "UIPadding", PaddingTop = UDim.new(0, 1) })
c(79, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(80, "UICorner", 79, { Name = "UICorner" })
c(81, "CanvasGroup", 79, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(82, "UICorner", 81, { Name = "UICorner" })
c(83, "UIStroke", 81, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(84, "Frame", 81, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(85, "UICorner", 84, { Name = "UICorner" })
c(86, "UIGradient", 84, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(87, "ImageLabel", 84, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(88, "ImageLabel", 84, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(89, "TextLabel", 84, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Batu", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(90, "UIStroke", 89, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(91, "ImageLabel", 84, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://82488028040593", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(92, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(93, "UICorner", 92, { Name = "UICorner" })
c(94, "CanvasGroup", 92, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(95, "UICorner", 94, { Name = "UICorner" })
c(96, "UIStroke", 94, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(97, "Frame", 94, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(98, "UICorner", 97, { Name = "UICorner" })
c(99, "UIGradient", 97, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(100, "ImageLabel", 97, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(101, "ImageLabel", 97, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(102, "TextLabel", 97, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "PickAxe", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(103, "UIStroke", 102, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(104, "ImageLabel", 97, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://118395707292811", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(105, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(106, "UICorner", 105, { Name = "UICorner" })
c(107, "CanvasGroup", 105, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(108, "UICorner", 107, { Name = "UICorner" })
c(109, "UIStroke", 107, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(110, "Frame", 107, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(111, "UICorner", 110, { Name = "UICorner" })
c(112, "UIGradient", 110, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(113, "ImageLabel", 110, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(114, "ImageLabel", 110, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(115, "TextLabel", 110, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Binatang", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(116, "UIStroke", 115, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(117, "ImageLabel", 110, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://135415406785593", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(118, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(119, "UICorner", 118, { Name = "UICorner" })
c(120, "CanvasGroup", 118, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(121, "UICorner", 120, { Name = "UICorner" })
c(122, "UIStroke", 120, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(123, "Frame", 120, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(124, "UICorner", 123, { Name = "UICorner" })
c(125, "UIGradient", 123, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(126, "ImageLabel", 123, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(127, "ImageLabel", 123, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(128, "TextLabel", 123, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Pedang", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(129, "UIStroke", 128, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(130, "ImageLabel", 123, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://88232276422832", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(131, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(132, "UICorner", 131, { Name = "UICorner" })
c(133, "CanvasGroup", 131, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(134, "UICorner", 133, { Name = "UICorner" })
c(135, "UIStroke", 133, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(136, "Frame", 133, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(137, "UICorner", 136, { Name = "UICorner" })
c(138, "UIGradient", 136, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(139, "ImageLabel", 136, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(140, "ImageLabel", 136, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(141, "TextLabel", 136, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Ikan", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(142, "UIStroke", 141, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(143, "ImageLabel", 136, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://140464235181887", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(144, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(145, "UICorner", 144, { Name = "UICorner" })
c(146, "CanvasGroup", 144, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(147, "UICorner", 146, { Name = "UICorner" })
c(148, "UIStroke", 146, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(149, "Frame", 146, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(150, "UICorner", 149, { Name = "UICorner" })
c(151, "UIGradient", 149, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(152, "ImageLabel", 149, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(153, "ImageLabel", 149, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(154, "TextLabel", 149, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Tanaman", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(155, "UIStroke", 154, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(156, "ImageLabel", 149, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://73991152696434", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(157, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(158, "UICorner", 157, { Name = "UICorner" })
c(159, "CanvasGroup", 157, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(160, "UICorner", 159, { Name = "UICorner" })
c(161, "UIStroke", 159, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(162, "Frame", 159, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(163, "UICorner", 162, { Name = "UICorner" })
c(164, "UIGradient", 162, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(165, "ImageLabel", 162, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(166, "ImageLabel", 162, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(167, "TextLabel", 162, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Naga", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(168, "UIStroke", 167, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(169, "ImageLabel", 162, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://139006753312271", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(170, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(171, "UICorner", 170, { Name = "UICorner" })
c(172, "CanvasGroup", 170, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(173, "UICorner", 172, { Name = "UICorner" })
c(174, "UIStroke", 172, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(175, "Frame", 172, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(176, "UICorner", 175, { Name = "UICorner" })
c(177, "UIGradient", 175, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(178, "ImageLabel", 175, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(179, "ImageLabel", 175, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(180, "TextLabel", 175, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Violance District", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(181, "UIStroke", 180, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(182, "ImageLabel", 175, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://130144978696466", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(183, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(184, "UICorner", 183, { Name = "UICorner" })
c(185, "CanvasGroup", 183, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(186, "UICorner", 185, { Name = "UICorner" })
c(187, "UIStroke", 185, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(188, "Frame", 185, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(189, "UICorner", 188, { Name = "UICorner" })
c(190, "UIGradient", 188, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(191, "ImageLabel", 188, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(192, "ImageLabel", 188, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(193, "TextLabel", 188, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "Settings", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(194, "UIStroke", 193, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(195, "ImageLabel", 188, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://109119318751042", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(196, "ImageButton", 63, { Name = "Templatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-3.7583223644333e-08, 0, 0, 0), Size = UDim2.new(0, 203, 0, 58) })
c(197, "UICorner", 196, { Name = "UICorner" })
c(198, "CanvasGroup", 196, { Name = "StyleFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 203, 0, 58) })
c(199, "UICorner", 198, { Name = "UICorner" })
c(200, "UIStroke", 198, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(201, "Frame", 198, { Name = "Stud", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-0.00492610828951, 0, -0.017241379246116, 0), Size = UDim2.new(0, 202, 0, 53) })
c(202, "UICorner", 201, { Name = "UICorner" })
c(203, "UIGradient", 201, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(204, "ImageLabel", 201, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.5, 0, 0.5, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 203, 0, 55), TileSize = UDim2.new(0, 80, 0, 80) })
c(205, "ImageLabel", 201, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.38916257023811, 0, 0.5545454621315, 0), Size = UDim2.new(0, 158, 0, 61) })
c(206, "TextLabel", 201, { Name = "GameName", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.61896824836731, 0, 0.48251429200172, 0), Size = UDim2.new(0, 125, 0, 35), Text = "About", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(207, "UIStroke", 206, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(208, "ImageLabel", 201, { Name = "GameImage", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://109670732793613", Position = UDim2.new(0.1434168368578, 0, 0.48761829733849, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0.21347899734974, 0, 0.79834920167923, 0) })
c(209, "Frame", 33, { Name = "MainFrame", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0.54123711585999, 0), Size = UDim2.new(0, 551, 0, 344) })
c(210, "ScrollingFrame", 209, { Name = "MainTemplateScrollFrame", Active = true, AnchorPoint = Vector2.new(0.5, 0.5), AutomaticCanvasSize = E_AS_Y, BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), ScrollBarImageColor3 = C_Black, ScrollBarThickness = 1, ScrollingDirection = E_SD_Y, Size = UDim2.new(0, 551, 0, 344) })
c(211, "UIPadding", 210, { Name = "UIPadding", PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 3) })
c(212, "UIListLayout", 210, { Name = "UIListLayout", Padding = UDim.new(0, 10), SortOrder = E_SO_Layout })
c(213, "CanvasGroup", 210, { Name = "MainTemplateFrame", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-5.6409572124494e-08, 0, 0, 0), Size = UDim2.new(0, 536, 0, 55) })
c(214, "UICorner", 213, { Name = "UICorner" })
c(215, "ImageButton", 213, { Name = "MainTemplatebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", Position = UDim2.new(-5.6935778758316e-08, 0, 0, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 536, 0, 50), TileSize = UDim2.new(0, 80, 0, 80) })
c(216, "UICorner", 215, { Name = "UICorner" })
c(217, "UIGradient", 215, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(218, "ImageLabel", 215, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://109516122757226", Position = UDim2.new(0.12247734516859, 0, 0.59607970714569, 0), Size = UDim2.new(0, 323, 0, 268) })
c(219, "TextLabel", 215, { Name = "MainTitle", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.20385628938675, 0, 0.4962574839592, 0), Size = UDim2.new(0, 150, 0, 36), Text = "Mode Slebew", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(220, "UIStroke", 219, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(221, "ImageLabel", 215, { Name = "ArrowIcon", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://101774428037241", Position = UDim2.new(0.93114024400711, 0, 0.50926500558853, 0), Rotation = 90, Size = UDim2.new(0, 50, 0, 50), ZIndex = 2 })
c(222, "ImageLabel", 215, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(223, "TextBox", 215, { Name = "Searchbox", BackgroundColor3 = Color3.fromRGB(35, 35, 35), BackgroundTransparency = 0.30000001192093, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_SourceSans, PlaceholderText = "Search....", Position = UDim2.new(0.40298494696617, 0, 0.23999999463558, 0), Size = UDim2.new(0, 231, 0, 25), Text = "", TextColor3 = C_White, TextDirection = Enum.TextDirection.LeftToRight, TextScaled = true, TextSize = 14, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(224, "UICorner", 223, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(225, "ImageLabel", 223, { Name = "ImageLabel", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://2804603863", Position = UDim2.new(0.88293826580048, 45, 0.54000002145767, 0), Rotation = 90, Size = UDim2.new(0, 15, 0, 15) })
c(226, "UIStroke", 223, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(85, 255, 0), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1, Transparency = 0.60000002384186, ZIndex = 1 })
c(227, "UIPadding", 223, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 40), PaddingTop = UDim.new(0, 5) })
c(228, "UIStroke", 223, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(229, "UIStroke", 213, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(230, "Frame", 210, { Name = "DropdownTemplateBgFrame", AutomaticSize = E_AS_Y, BackgroundColor3 = Color3.fromRGB(0, 85, 127), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.69822484254837, 0), Size = UDim2.new(0, 536, 0, 311) })
c(231, "UICorner", 230, { Name = "UICorner" })
c(232, "UIStroke", 230, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(57, 57, 57), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(233, "UIStroke", 230, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(234, "UIListLayout", 230, { Name = "UIListLayout", Padding = UDim.new(0, 5), SortOrder = E_SO_Layout })
c(235, "UIPadding", 230, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) })
c(236, "CanvasGroup", 230, { Name = "TemplateToggle", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(237, "UICorner", 236, { Name = "UICorner" })
c(238, "UIStroke", 236, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(239, "Frame", 236, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(240, "UICorner", 239, { Name = "UICorner" })
c(241, "UIGradient", 239, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(242, "ImageLabel", 239, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(243, "ImageLabel", 239, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(244, "ImageButton", 239, { Name = "Togglebtn", BackgroundColor3 = Color3.fromRGB(74, 74, 74), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0), Size = UDim2.new(0, 70, 0, 31), ZIndex = 2 })
c(245, "UICorner", 244, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(246, "UIStroke", 244, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(247, "UIStroke", 244, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(248, "Frame", 244, { Name = "IndikatorFrame", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.56769496202469, 0, 0.096774190664291, 0), Size = UDim2.new(0, 25, 0, 25) })
c(249, "UIStroke", 248, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = Color3.fromRGB(16, 20, 26), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(250, "UICorner", 248, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(251, "UIGradient", 248, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))}), Rotation = 90 })
c(252, "ImageLabel", 239, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(253, "TextBox", 239, { Name = "Keybind", BackgroundColor3 = Color3.fromRGB(63, 63, 63), BackgroundTransparency = 0.40000000596046, BorderColor3 = C_White, BorderSizePixel = 0, FontFace = F_SourceSans, PlaceholderColor3 = C_White, PlaceholderText = "...", Position = UDim2.new(0.75763356685638, 0, 0.19607843458652, 0), Size = UDim2.new(0, 31, 0, 31), Text = "", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true })
c(254, "UIStroke", 253, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(255, "TextLabel", 236, { Name = "TitleText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.13731057941914, 0, 0.43346214294434, 0), Size = UDim2.new(0, 121, 0, 36), Text = "Title", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(256, "UIStroke", 255, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 4, Transparency = 0, ZIndex = 1 })
c(257, "CanvasGroup", 230, { Name = "TemplateSlider", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(258, "UICorner", 257, { Name = "UICorner" })
c(259, "UIStroke", 257, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(260, "Frame", 257, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(261, "UICorner", 260, { Name = "UICorner" })
c(262, "UIGradient", 260, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(263, "ImageLabel", 260, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(264, "ImageLabel", 260, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(265, "ImageLabel", 260, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(266, "Frame", 257, { Name = "BarHolder", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(94, 17, 19), BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.5051811337471, 0, 0.44792461395264, 0), Size = UDim2.new(0.45528650283813, 0, 0.3210506439209, 0) })
c(267, "TextLabel", 266, { Name = "IndicatorText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_GothamHeavy, LayoutOrder = 1, Position = UDim2.new(0.49447423219681, 0, 0.5632683634758, 0), Size = UDim2.new(0.59924513101578, 0, 0.73227429389954, 0), Text = "1", TextColor3 = Color3.fromRGB(251, 251, 251), TextScaled = true, TextSize = 14, TextWrapped = true, ZIndex = 25 })
c(268, "UIGradient", 267, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C_White), ColorSequenceKeypoint.new(0.5319516658783, C_White), ColorSequenceKeypoint.new(0.56649392843246, Color3.fromRGB(202, 202, 202)), ColorSequenceKeypoint.new(1, C_White)}), Rotation = 90 })
c(269, "UIStroke", 267, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(270, "CanvasGroup", 266, { Name = "BarBG", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(17, 94, 0), BorderColor3 = C_Black, BorderSizePixel = 0, ClipsDescendants = false, Position = UDim2.new(0.49778106808662, 0, 0.54294514656067, 0), Size = UDim2.new(0.98781031370163, 0, 0.91411006450653, 0), ZIndex = 5 })
c(271, "Frame", 270, { Name = "Bar", AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-1.7447360733058e-05, 0, 0.50000011920929, 0), Size = UDim2.new(0.32945215702057, 0, 1.0000002384186, 0), ZIndex = 5 })
c(272, "UIStroke", 271, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Scaled, Thickness = 0.059614915400743, Transparency = 0, ZIndex = 1 })
c(273, "UIGradient", 271, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(132, 255, 16)), ColorSequenceKeypoint.new(0.55440413951874, Color3.fromRGB(157, 255, 0)), ColorSequenceKeypoint.new(0.81692570447922, Color3.fromRGB(56, 177, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 255, 0))}), Rotation = 90 })
c(274, "UICorner", 270, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(275, "UIShadow", 270, { Name = "UIShadow" })
c(276, "UIStroke", 270, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(277, "UIStroke", 270, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(85, 255, 0), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(278, "TextLabel", 257, { Name = "TitleText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.13731057941914, 0, 0.43346214294434, 0), Size = UDim2.new(0, 121, 0, 36), Text = "Title", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(279, "UIStroke", 278, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 4, Transparency = 0, ZIndex = 1 })
c(280, "CanvasGroup", 230, { Name = "TemplateSdTg", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(281, "UICorner", 280, { Name = "UICorner" })
c(282, "UIStroke", 280, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(283, "Frame", 280, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(284, "UICorner", 283, { Name = "UICorner" })
c(285, "UIGradient", 283, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(286, "ImageLabel", 283, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(287, "ImageLabel", 283, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(288, "ImageLabel", 283, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(289, "Frame", 280, { Name = "BarHolder", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(94, 17, 19), BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.50599551200867, 0, 0.39435318112373, 0), Size = UDim2.new(0.44990387558937, 0, 0.3210506439209, 0) })
c(290, "TextLabel", 289, { Name = "IndicatorText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_GothamHeavy, LayoutOrder = 1, Position = UDim2.new(0.49607390165329, 0, 0.5632683634758, 0), Size = UDim2.new(0.60118448734283, 0, 0.73227429389954, 0), Text = "1", TextColor3 = Color3.fromRGB(251, 251, 251), TextScaled = true, TextSize = 14, TextWrapped = true, ZIndex = 25 })
c(291, "UIGradient", 290, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C_White), ColorSequenceKeypoint.new(0.5319516658783, C_White), ColorSequenceKeypoint.new(0.56649392843246, Color3.fromRGB(202, 202, 202)), ColorSequenceKeypoint.new(1, C_White)}), Rotation = 90 })
c(292, "UIStroke", 290, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(293, "CanvasGroup", 289, { Name = "BarBG", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = Color3.fromRGB(17, 94, 0), BorderColor3 = C_Black, BorderSizePixel = 0, ClipsDescendants = false, Position = UDim2.new(0.49939200282097, 0, 0.54294604063034, 0), Size = UDim2.new(0.99100708961487, 0, 0.91411006450653, 0), ZIndex = 5 })
c(294, "Frame", 293, { Name = "Bar", AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(3.1097119062906e-05, 0, 0.50000011920929, 0), Size = UDim2.new(0.33364459872246, 0, 1.0000002384186, 0), ZIndex = 5 })
c(295, "UIStroke", 294, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Scaled, Thickness = 0.059614915400743, Transparency = 0, ZIndex = 1 })
c(296, "UIGradient", 294, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(132, 255, 16)), ColorSequenceKeypoint.new(0.55440413951874, Color3.fromRGB(157, 255, 0)), ColorSequenceKeypoint.new(0.81692570447922, Color3.fromRGB(56, 177, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(38, 255, 0))}), Rotation = 90 })
c(297, "UICorner", 293, { Name = "UICorner", CornerRadius = UDim.new(1, 0) })
c(298, "UIShadow", 293, { Name = "UIShadow" })
c(299, "UIStroke", 293, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(300, "UIStroke", 293, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(85, 255, 0), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1, Transparency = 0, ZIndex = 1 })
c(301, "ImageButton", 280, { Name = "Togglebtn", BackgroundColor3 = Color3.fromRGB(74, 74, 74), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0), Size = UDim2.new(0, 70, 0, 31), ZIndex = 2 })
c(302, "UICorner", 301, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(303, "UIStroke", 301, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(304, "UIStroke", 301, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(305, "Frame", 301, { Name = "IndikatorFrame", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.56769496202469, 0, 0.096774190664291, 0), Size = UDim2.new(0, 25, 0, 25) })
c(306, "UIStroke", 305, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = Color3.fromRGB(16, 20, 26), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(307, "UICorner", 305, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(308, "UIGradient", 305, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))}), Rotation = 90 })
c(309, "TextLabel", 280, { Name = "TitleText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.13731057941914, 0, 0.43346214294434, 0), Size = UDim2.new(0, 121, 0, 36), Text = "Title", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(310, "UIStroke", 309, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 4, Transparency = 0, ZIndex = 1 })
c(311, "CanvasGroup", 230, { Name = "TemplateDropdown", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(312, "UICorner", 311, { Name = "UICorner" })
c(313, "UIStroke", 311, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(314, "Frame", 311, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(315, "UICorner", 314, { Name = "UICorner" })
c(316, "UIGradient", 314, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(317, "ImageLabel", 314, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(318, "ImageLabel", 314, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(319, "ImageLabel", 314, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(320, "ImageButton", 311, { Name = "Togglebtn", BackgroundColor3 = Color3.fromRGB(74, 74, 74), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0), Size = UDim2.new(0, 70, 0, 31), ZIndex = 2 })
c(321, "UICorner", 320, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(322, "UIStroke", 320, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(323, "UIStroke", 320, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(324, "Frame", 320, { Name = "IndikatorFrame", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.56769496202469, 0, 0.096774190664291, 0), Size = UDim2.new(0, 25, 0, 25) })
c(325, "UIStroke", 324, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = Color3.fromRGB(16, 20, 26), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(326, "UICorner", 324, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(327, "UIGradient", 324, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))}), Rotation = 90 })
c(328, "Frame", 311, { Name = "DropHolder", BackgroundColor3 = Color3.fromRGB(58, 58, 58), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.2919847369194, 0, 0.21393530070782, 0), Size = UDim2.new(0, 222, 0, 31) })
c(329, "UICorner", 328, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(330, "UIStroke", 328, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(331, "UIStroke", 328, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(332, "TextLabel", 328, { Name = "IndicatorText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_GothamHeavy, LayoutOrder = 1, Position = UDim2.new(0.49497446417809, 0, 0.56326788663864, 0), Size = UDim2.new(0.59985160827637, 0, 0.73227423429489, 0), Text = "Slebew", TextColor3 = Color3.fromRGB(251, 251, 251), TextScaled = true, TextSize = 14, TextWrapped = true, ZIndex = 25 })
c(333, "UIStroke", 332, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Bevel, StrokeSizingMode = E_SSM_Scaled, Thickness = 0.11999999731779, Transparency = 0, ZIndex = 1 })
c(334, "UIGradient", 332, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, C_White), ColorSequenceKeypoint.new(0.5319516658783, C_White), ColorSequenceKeypoint.new(0.56649392843246, Color3.fromRGB(202, 202, 202)), ColorSequenceKeypoint.new(1, C_White)}), Rotation = 90 })
c(335, "ImageButton", 328, { Name = "Hitbox", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(-1.3685013300346e-07, 0, 0, 0), Size = UDim2.new(0, 222, 0, 31) })
c(336, "ImageLabel", 328, { Name = "DropIcon", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://132016203434518", Position = UDim2.new(0.91976845264435, 0, 0.45161288976669, 0), Size = UDim2.new(0, 45, 0, 50) })
c(337, "TextLabel", 311, { Name = "TitleText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.13731057941914, 0, 0.43346214294434, 0), Size = UDim2.new(0, 121, 0, 36), Text = "Title", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(338, "UIStroke", 337, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 4, Transparency = 0, ZIndex = 1 })
c(339, "CanvasGroup", 230, { Name = "TemplateTBox", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(340, "UICorner", 339, { Name = "UICorner" })
c(341, "UIStroke", 339, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(342, "Frame", 339, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(343, "UICorner", 342, { Name = "UICorner" })
c(344, "UIGradient", 342, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(345, "ImageLabel", 342, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(346, "ImageLabel", 342, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(347, "ImageLabel", 342, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(348, "ImageButton", 339, { Name = "Togglebtn", BackgroundColor3 = Color3.fromRGB(74, 74, 74), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0), Size = UDim2.new(0, 70, 0, 31), ZIndex = 2 })
c(349, "UICorner", 348, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(350, "UIStroke", 348, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(351, "UIStroke", 348, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(352, "Frame", 348, { Name = "IndikatorFrame", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.56769496202469, 0, 0.096774190664291, 0), Size = UDim2.new(0, 25, 0, 25) })
c(353, "UIStroke", 352, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = Color3.fromRGB(16, 20, 26), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(354, "UICorner", 352, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(355, "UIGradient", 352, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))}), Rotation = 90 })
c(356, "TextBox", 339, { Name = "InputBox", BackgroundColor3 = Color3.fromRGB(58, 58, 58), BackgroundTransparency = 0.60000002384186, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Gotham, PlaceholderColor3 = C_White, PlaceholderText = "1", Position = UDim2.new(0.44847327470779, 0, 0.16036388278008, 0), Size = UDim2.new(0, 63, 0, 30), Text = "", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(357, "UIStroke", 356, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(358, "UIStroke", 356, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Border, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(359, "UICorner", 356, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(360, "UIStroke", 356, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Bevel, StrokeSizingMode = E_SSM_Fixed, Thickness = 3, Transparency = 0, ZIndex = 1 })
c(361, "ImageButton", 339, { Name = "Plusbtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://77098120677548", Position = UDim2.new(0.58969467878342, 0, 0.14285714924335, 0), Size = UDim2.new(0, 30, 0, 30) })
c(362, "ImageButton", 339, { Name = "Minbtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://100944850081529", Position = UDim2.new(0.36641222238541, 0, 0.14285714924335, 0), Size = UDim2.new(0, 30, 0, 30) })
c(363, "TextLabel", 339, { Name = "TitleText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.13731057941914, 0, 0.43346214294434, 0), Size = UDim2.new(0, 121, 0, 36), Text = "Title", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(364, "UIStroke", 363, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 4, Transparency = 0, ZIndex = 1 })
c(365, "ScrollingFrame", 209, { Name = "SettingScrollFrame", Active = true, AnchorPoint = Vector2.new(0.5, 0.5), AutomaticCanvasSize = E_AS_Y, BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0), ScrollBarImageColor3 = C_Black, ScrollBarThickness = 1, ScrollingDirection = E_SD_Y, Size = UDim2.new(0, 551, 0, 344), Visible = false })
c(366, "UIPadding", 365, { Name = "UIPadding", PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 3) })
c(367, "Frame", 365, { Name = "FpsBgFrame", BackgroundColor3 = Color3.fromRGB(0, 85, 127), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 536, 0, 68) })
c(368, "UICorner", 367, { Name = "UICorner" })
c(369, "UIStroke", 367, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(57, 57, 57), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(370, "UIStroke", 367, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(371, "UIListLayout", 367, { Name = "UIListLayout", Padding = UDim.new(0, 5), SortOrder = E_SO_Layout })
c(372, "UIPadding", 367, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) })
c(373, "CanvasGroup", 367, { Name = "FpsBoostToggle", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(374, "UICorner", 373, { Name = "UICorner" })
c(375, "UIStroke", 373, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(376, "Frame", 373, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(377, "UICorner", 376, { Name = "UICorner" })
c(378, "UIGradient", 376, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(379, "ImageLabel", 376, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(380, "ImageLabel", 376, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(381, "ImageButton", 376, { Name = "Togglebtn", BackgroundColor3 = Color3.fromRGB(74, 74, 74), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.84351146221161, 0, 0.19607843458652, 0), Size = UDim2.new(0, 70, 0, 31), ZIndex = 2 })
c(382, "UICorner", 381, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(383, "UIStroke", 381, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(384, "UIStroke", 381, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(76, 76, 76), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(385, "Frame", 381, { Name = "IndikatorFrame", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.56769496202469, 0, 0.096774190664291, 0), Size = UDim2.new(0, 25, 0, 25) })
c(386, "UIStroke", 385, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = Color3.fromRGB(16, 20, 26), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(387, "UICorner", 385, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(388, "UIGradient", 385, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))}), Rotation = 90 })
c(389, "ImageLabel", 376, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.81826704740524, 0, 0.49113631248474, 0), Size = UDim2.new(0, 158, 0, 50) })
c(390, "TextLabel", 373, { Name = "TitleText", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.14876095950603, 0, 0.45740619301796, 0), Size = UDim2.new(0, 133, 0, 42), Text = "Fps Boost", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(391, "UIStroke", 390, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(392, "UIListLayout", 365, { Name = "UIListLayout", Padding = UDim.new(0, 10), SortOrder = E_SO_Layout })
c(393, "Frame", 365, { Name = "ConfigBgFrame", BackgroundColor3 = Color3.fromRGB(0, 85, 127), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, 0.25739645957947, 0), Size = UDim2.new(0, 536, 0, 254) })
c(394, "UICorner", 393, { Name = "UICorner" })
c(395, "UIStroke", 393, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(57, 57, 57), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(396, "UIStroke", 393, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(397, "UIListLayout", 393, { Name = "UIListLayout", Padding = UDim.new(0, 5), SortOrder = E_SO_Layout })
c(398, "UIPadding", 393, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) })
c(399, "CanvasGroup", 393, { Name = "ConfigToggle", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 524, 0, 105) })
c(400, "UICorner", 399, { Name = "UICorner" })
c(401, "UIStroke", 399, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(402, "Frame", 399, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011965796584263, 0), Size = UDim2.new(0, 524, 0, 99) })
c(403, "UICorner", 402, { Name = "UICorner" })
c(404, "UIGradient", 402, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(405, "ImageLabel", 402, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.48831108212471, 0, 0.48095116019249, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 95), TileSize = UDim2.new(0, 80, 0, 80) })
c(406, "ImageLabel", 402, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.2040481120348, 0, 0.52922767400742, 0), ScaleType = E_ST_Crop, Size = UDim2.new(0, 214, 0, 104) })
c(407, "ImageLabel", 402, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://98981360538955", Position = UDim2.new(0.79307919740677, 0, 0.47934699058533, 0), Rotation = 180, ScaleType = E_ST_Crop, Size = UDim2.new(0, 215, 0, 94) })
c(408, "CanvasGroup", 402, { Name = "SaveBg", BackgroundColor3 = Color3.fromRGB(44, 0, 66), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.77671754360199, 0, 0.10101009905338, 0), Size = UDim2.new(0, 100, 0, 37) })
c(409, "ImageButton", 408, { Name = "SaveBtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 100, 0, 34) })
c(410, "UIGradient", 409, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(170, 0, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(63, 0, 94))}) })
c(411, "UICorner", 409, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(412, "ImageLabel", 409, { Name = "SaveIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://79791496315194", Position = UDim2.new(0.059999998658895, -3, 0.058823529630899, 0), Size = UDim2.new(0, 30, 0, 30) })
c(413, "TextLabel", 409, { Name = "SaveTxt", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.36000001430511, 0, 0.058823529630899, 0), Size = UDim2.new(0, 58, 0, 29), Text = "Save", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(414, "UIStroke", 413, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(415, "UIStroke", 408, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(416, "UICorner", 408, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(417, "CanvasGroup", 402, { Name = "LoadBg", BackgroundColor3 = Color3.fromRGB(0, 81, 0), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.77671754360199, 0, 0.10101009905338, 45), Size = UDim2.new(0, 100, 0, 37) })
c(418, "ImageButton", 417, { Name = "LoadBtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 100, 0, 34) })
c(419, "UIGradient", 418, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 103, 0))}) })
c(420, "UICorner", 418, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(421, "ImageLabel", 418, { Name = "LoadIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://114659130758967", Position = UDim2.new(0.059999998658895, -3, 0.058823529630899, 0), Size = UDim2.new(0, 30, 0, 30) })
c(422, "TextLabel", 418, { Name = "LoadTxt", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.36000001430511, 0, 0.058823529630899, 0), Size = UDim2.new(0, 58, 0, 29), Text = "Load", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(423, "UIStroke", 422, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(424, "UIStroke", 417, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(425, "UICorner", 417, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(426, "TextLabel", 399, { Name = "Save", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.14876095950603, 0, 0.27645379304886, 0), Size = UDim2.new(0, 133, 0, 42), Text = "Save Config", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(427, "UIStroke", 426, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(428, "TextLabel", 399, { Name = "Load", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.14876095950603, 0, 0.67645382881165, 0), Size = UDim2.new(0, 133, 0, 42), Text = "Load Config", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(429, "UIStroke", 428, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 5, Transparency = 0, ZIndex = 1 })
c(430, "ScrollingFrame", 393, { Name = "ScrollingConfig", Active = true, AutomaticCanvasSize = E_AS_Y, BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.034220531582832, 0, 0.44672131538391, 0), ScrollBarImageColor3 = C_Black, ScrollingDirection = E_SD_Y, Size = UDim2.new(0, 523, 0, 132) })
c(431, "UIPadding", 430, { Name = "UIPadding", PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8), PaddingTop = UDim.new(0, 8) })
c(432, "Frame", 430, { Name = "ConfigCardTemplate", BackgroundColor3 = Color3.fromRGB(75, 75, 75), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, 6.2027595504333e-08, 0), Size = UDim2.new(0, 80, 0, 80) })
c(433, "UICorner", 432, { Name = "UICorner", CornerRadius = UDim.new(0, 5) })
c(434, "UIStroke", 432, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(435, "UIStroke", 432, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(0, 170, 255), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(436, "ImageLabel", 432, { Name = "ConfigIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://130594403641593", Position = UDim2.new(0.17499999701977, 0, 0.29166665673256, 0), Size = UDim2.new(0, 50, 0, 50) })
c(437, "TextLabel", 432, { Name = "ConfigName", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.13499984145164, 0, -0.033333335071802, 0), Size = UDim2.new(0, 58, 0, 53), Text = "Config Name", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(438, "UIStroke", 437, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2.5, Transparency = 0, ZIndex = 1 })
c(439, "ImageButton", 432, { Name = "DeleteBtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.13750000298023, 0, 0.72500002384186, 0), Size = UDim2.new(0, 58, 0, 27) })
c(440, "UIGradient", 439, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 0, 0))}), Rotation = 90 })
c(441, "UIStroke", 439, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(442, "UICorner", 439, { Name = "UICorner", CornerRadius = UDim.new(0, 3) })
c(443, "ImageLabel", 439, { Name = "ImageLabel", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://11768918600", Position = UDim2.new(0.29310345649719, 0, 0.074074074625969, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0, 23, 0, 23) })
c(444, "UIGridLayout", 430, { Name = "UIGridLayout", CellPadding = UDim2.new(0, 23, 0, 10), CellSize = UDim2.new(0, 80, 0, 120), FillDirectionMaxCells = 5, SortOrder = E_SO_Layout })
c(445, "Frame", 209, { Name = "AboutFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 551, 0, 344), Visible = false })
c(446, "UIPadding", 445, { Name = "UIPadding", PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 3) })
c(447, "ImageLabel", 445, { Name = "SyshybIcon", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://73996941491460", Position = UDim2.new(0.49815157055855, 0, 0.087707608938217, 0), Size = UDim2.new(0, 227, 0, 120), Visible = true, ZIndex = 15 })
c(448, "TextLabel", 445, { Name = "Copyright", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_SourceSans, Position = UDim2.new(0.29390019178391, 0, 0.92899405956268, 0), Size = UDim2.new(0, 222, 0, 17), Text = "© 2026 Syshub. All rights reserved.", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(449, "Frame", 445, { Name = "LinkFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.0018484288593754, 31, 0.46745565533638, 5), Size = UDim2.new(0, 222, 0, 152) })
c(450, "Frame", 449, { Name = "DiscordFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.06148124486208, 0, 0.46705996990204, 0), Size = UDim2.new(0, 153, 0, 33) })
c(452, "TextLabel", 450, { Name = "Link", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.093218632042408, 0, -0.024029355496168, 0), Size = UDim2.new(0, 125, 0, 34), Text = "discord.gg/syshub", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(453, "ImageLabel", 450, { Name = "DiscordIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://89655945612700", Position = UDim2.new(-0.27518638968468, 0, -0.43078705668449, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0, 60, 0, 60) })
c(454, "ImageButton", 450, { Name = "GoTobtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(1, 0, -0.090909093618393, 0), Size = UDim2.new(0, 37, 0, 37) })
c(455, "UIPadding", 449, { Name = "UIPadding", PaddingLeft = UDim.new(0, 35) })
c(456, "Frame", 449, { Name = "TiktokFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.06148124486208, 0, 0.46705996990204, 0), Size = UDim2.new(0, 153, 0, 33) })
c(457, "ImageButton", 456, { Name = "GoTobtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(1, 0, -0.090909093618393, 0), Size = UDim2.new(0, 37, 0, 37) })
c(459, "TextLabel", 456, { Name = "Link", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.093218632042408, 0, -0.024029355496168, 0), Size = UDim2.new(0, 125, 0, 34), Text = "@syshub.official", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(460, "ImageLabel", 456, { Name = "TiktokIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://124527434158099", Position = UDim2.new(-0.27518638968468, 0, -0.43078705668449, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0, 60, 0, 60) })
c(461, "Frame", 449, { Name = "WebsiteFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.06148124486208, 0, 0.46705996990204, 0), Size = UDim2.new(0, 153, 0, 33) })
c(462, "ImageButton", 461, { Name = "GoTobtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(1, 0, -0.090909093618393, 0), Size = UDim2.new(0, 37, 0, 37) })
c(464, "TextLabel", 461, { Name = "Link", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.093218632042408, 0, -0.024029355496168, 0), Size = UDim2.new(0, 125, 0, 34), Text = "syshub.net", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(465, "ImageLabel", 461, { Name = "WebIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://83357882847538", Position = UDim2.new(-0.27518638968468, 0, -0.43078705668449, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0, 60, 0, 60) })
c(466, "UIGridLayout", 449, { Name = "UIGridLayout", CellPadding = UDim2.new(0, 100, 0, 30), CellSize = UDim2.new(0, 153, 0, 33), FillDirection = Enum.FillDirection.Vertical, FillDirectionMaxCells = 2, SortOrder = E_SO_Layout })
c(467, "Frame", 449, { Name = "WaFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.06148124486208, 0, 0.46705996990204, 0), Size = UDim2.new(0, 153, 0, 33) })
c(468, "ImageButton", 467, { Name = "GoTobtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://115911786914037", Position = UDim2.new(1, 0, -0.090909093618393, 0), Size = UDim2.new(0, 37, 0, 37) })
c(470, "TextLabel", 467, { Name = "Link", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.093218632042408, 0, -0.024029355496168, 0), Size = UDim2.new(0, 125, 0, 34), Text = "wa.me/syshub", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(471, "ImageLabel", 467, { Name = "WaIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://124898037420185", Position = UDim2.new(-0.27518638968468, 0, -0.43078705668449, 0), ScaleType = E_ST_Fit, Size = UDim2.new(0, 60, 0, 60) })
c(472, "TextLabel", 445, { Name = "Keterangan", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_SourceSans, Position = UDim2.new(0.016635859385133, 0, 0.16863904893398, 0), Size = UDim2.new(0, 522, 0, 86), Text = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", TextColor3 = C_White, TextSize = 18, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left, TextYAlignment = Enum.TextYAlignment.Top })
c(473, "Frame", 209, { Name = "ServerFrame", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 551, 0, 344), Visible = false })
c(474, "UIPadding", 473, { Name = "UIPadding", PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 10) })
c(475, "ScrollingFrame", 473, { Name = "ServerScrollFrame", Active = true, AnchorPoint = Vector2.new(0.5, 0.5), AutomaticCanvasSize = E_AS_Y, BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, CanvasSize = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.45225211977959, 0), ScrollBarImageColor3 = C_Black, ScrollBarThickness = 1, ScrollingDirection = E_SD_Y, Size = UDim2.new(0, 551, 0, 311) })
c(476, "UIPadding", 475, { Name = "UIPadding", PaddingBottom = UDim.new(0, 3), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 3) })
c(477, "Frame", 475, { Name = "TemplateServer", BackgroundColor3 = Color3.fromRGB(0, 85, 127), BackgroundTransparency = 0.5, BorderColor3 = C_Black, BorderSizePixel = 0, Size = UDim2.new(0, 536, 0, 68) })
c(478, "UICorner", 477, { Name = "UICorner" })
c(479, "UIStroke", 477, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Inner, Color = Color3.fromRGB(57, 57, 57), Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(480, "UIStroke", 477, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(481, "UIListLayout", 477, { Name = "UIListLayout", Padding = UDim.new(0, 5), SortOrder = E_SO_Layout })
c(482, "UIPadding", 477, { Name = "UIPadding", PaddingBottom = UDim.new(0, 5), PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5) })
c(483, "CanvasGroup", 477, { Name = "ServerTemplateBg", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.11977186053991, 0, 0.0016583747928962, 0), Size = UDim2.new(0, 524, 0, 56) })
c(484, "UICorner", 483, { Name = "UICorner" })
c(485, "UIStroke", 483, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Center, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 1.5, Transparency = 0, ZIndex = 1 })
c(486, "Frame", 483, { Name = "Gradient", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0, 0, -0.0011961801210418, 0), Size = UDim2.new(0, 524, 0, 51) })
c(487, "UICorner", 486, { Name = "UICorner" })
c(488, "UIGradient", 486, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(489, "ImageLabel", 486, { Name = "Stud", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ImageColor3 = Color3.fromRGB(0, 170, 255), Position = UDim2.new(0.49976146221161, 0, 0.48039215803146, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 523, 0, 53), TileSize = UDim2.new(0, 80, 0, 80) })
c(490, "ImageLabel", 486, { Name = "Rays", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://80179449391256", Position = UDim2.new(0.15061298012733, 0, 0.55754774808884, 0), Size = UDim2.new(0, 158, 0, 56) })
c(491, "ImageButton", 486, { Name = "GoTobtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://131656522154972", Position = UDim2.new(0.86832058429718, 0, 0.019607843831182, 0), Size = UDim2.new(0, 45, 0, 45) })
c(492, "ImageLabel", 486, { Name = "GlobeIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://83357882847538", Position = UDim2.new(0, 9, 0.058823529630899, 0), Size = UDim2.new(0, 45, 0, 45) })
c(493, "ImageLabel", 486, { Name = "PlayerIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://78108941818643", Position = UDim2.new(0.60496181249619, 0, 0.058823529630899, 0), Size = UDim2.new(0, 45, 0, 45) })
c(494, "TextLabel", 486, { Name = "PlayerAmount", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.64303576946259, 48, 0.45110365748405, 0), Size = UDim2.new(0, 47, 0, 31), Text = "50", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(495, "UIStroke", 494, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 3, Transparency = 0, ZIndex = 1 })
c(496, "TextLabel", 483, { Name = "IdServer", AnchorPoint = Vector2.new(0.5, 0.5), BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.2737609744072, 5, 0.42169189453125, 0), Size = UDim2.new(0, 178, 0, 42), Text = "Id : 1209-0912-0912", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextWrapped = true })
c(497, "UIStroke", 496, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 3, Transparency = 0, ZIndex = 1 })
c(498, "UIListLayout", 475, { Name = "UIListLayout", Padding = UDim.new(0, 10), SortOrder = E_SO_Layout })
c(499, "ImageButton", 473, { Name = "Refreshbtn", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.76423418521881, 0, 0.91238671541214, 3), Size = UDim2.new(0, 120, 0, 25) })
c(500, "ImageLabel", 499, { Name = "ImageLabel", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://93834424925446", LayoutOrder = 1, Size = UDim2.new(0, 24, 0, 24) })
c(501, "TextLabel", 499, { Name = "RefreshLabel", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, FontFace = F_Fredoka, Position = UDim2.new(0.28333333134651, 0, 0, 0), Size = UDim2.new(0, 86, 0, 24), Text = "Refresh", TextColor3 = C_White, TextScaled = true, TextSize = 14, TextStrokeTransparency = 0, TextWrapped = true, TextXAlignment = E_TXA_Left })
c(502, "CanvasGroup", 1, { Name = "MinimizeModeHolder", BackgroundColor3 = Color3.fromRGB(0, 51, 75), BorderColor3 = C_Black, BorderSizePixel = 0, Position = UDim2.new(0.88932037353516, 0, 0.35343036055565, 0), Size = UDim2.new(0, 50, 0, 50), Visible = false })
c(503, "UICorner", 502, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(504, "UIStroke", 502, { Name = "UIStroke", ApplyStrokeMode = E_ASM_Context, BorderOffset = UDim.new(0, 0), BorderStrokePosition = E_BSP_Outer, Color = C_Black, Enabled = true, LineJoinMode = E_LJM_Round, StrokeSizingMode = E_SSM_Fixed, Thickness = 2, Transparency = 0, ZIndex = 1 })
c(505, "ImageButton", 502, { Name = "OpenClosebtn", BackgroundColor3 = C_White, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://6927295847", ScaleType = E_ST_Tile, Size = UDim2.new(0, 50, 0, 47) })
c(506, "UICorner", 505, { Name = "UICorner", CornerRadius = UDim.new(0.10000000149012, 0) })
c(507, "UIGradient", 505, { Name = "UIGradient", Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 85, 127))}), Rotation = 90 })
c(508, "ImageLabel", 505, { Name = "Rays", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://15308188543", Position = UDim2.new(-0.68000000715256, 0, -0.73151350021362, 0), Size = UDim2.new(0, 100, 0, 82) })
c(509, "ImageLabel", 505, { Name = "SyshubIcon", BackgroundColor3 = C_White, BackgroundTransparency = 1, BorderColor3 = C_Black, BorderSizePixel = 0, Image = "rbxassetid://116139716819353", Position = UDim2.new(-0.21999999880791, 0, -0.38297873735428, 0), ScaleType = E_ST_Tile, Size = UDim2.new(0, 72, 0, 80), Visible = true, ZIndex = 15 })

    local root = objects[1]
    if targetParent then
        root.Parent = targetParent
    end
    return root, objects
end


function SyshubLib:CreateWindow(config)
    config = config or {}
    local title = config.Title or "Syshub"
    local keySystem = (config.KeySystem == true)
    local validKey = config.Key or "syshub"
    local keyValidator = config.KeyValidator
    local defaultTab = config.DefaultTab or "About"
    local toggleKey = config.ToggleKey or Enum.KeyCode.RightControl

    local parent = config.Parent
    if not parent then
        local pcallOk, coreGui = pcall(function() return game:GetService("CoreGui") end)
        if pcallOk and coreGui then
            parent = coreGui
        else
            parent = Players.LocalPlayer:WaitForChild("PlayerGui")
        end
    end

    -- Single Instance
    local sharedEnv = (typeof(getgenv) == "function" and getgenv()) or _G
    if sharedEnv and sharedEnv.SyshubActiveWindow and typeof(sharedEnv.SyshubActiveWindow.Destroy) == "function" then
        pcall(function() sharedEnv.SyshubActiveWindow:Destroy() end)
        sharedEnv.SyshubActiveWindow = nil
    end

    if SyshubLib._CurrentWindow and typeof(SyshubLib._CurrentWindow.Destroy) == "function" then
        pcall(function() SyshubLib._CurrentWindow:Destroy() end)
        SyshubLib._CurrentWindow = nil
    end

    pcall(function()
        for _, oldChild in ipairs(parent:GetChildren()) do
            if oldChild:IsA("ScreenGui") and (oldChild.Name == "SyshubNewww" or oldChild.Name == "SyshubHub") then
                oldChild:Destroy()
            end
        end
    end)

    -- Connection Tracker
    local connections = {}
    local function trackConn(conn)
        if conn then
            table.insert(connections, conn)
        end
        return conn
    end

    local fpsBoostEnabled = false
    local fpsBoostConnection = nil
    local toggleFps = nil

    -- Ui Tree
    local root, T = SyshubLib.BuildGui(parent)
    root.Enabled = true

    -- Scalling Ui
    local uiScale = Instance.new("UIScale")
    uiScale.Scale = UserInputService.TouchEnabled and 0.7 or 1
    uiScale.Parent = root

    -- Save Modal
    local saveModal, saveInputBox, saveConfirmBtn, saveCancelBtn = SyshubLib.BuildSaveModal(root)

    -- References
    local loginFrame      = T[2]    -- LoginPageFrame
    local loginCloseBtn   = T[14]   -- Login Close
    local keyBox          = T[19]   -- KeyBox
    local loginBtn        = T[27]   -- Loginbtn
    local loaderFrame     = T[33]   -- LoaderFrame
    local headerFrame     = T[34]   -- HeaderFrame
    local topCloseBtn     = T[43]   -- Header Close
    local topMinimizeBtn  = T[44]   -- Minimize
    local sidemenuScroll  = T[63]   -- SidemenuScroll
    local mainFrame       = T[209]  -- MainFrame
    local mainScroll      = T[210]  -- MainTemplateScrollFrame
    local settingScroll   = T[365]  -- SettingScrollFrame
    local aboutFrame      = T[445]  -- AboutFrame
    local serverFrame     = T[473]  -- ServerFrame
    local minModeHolder   = T[502]  -- MinimizeModeHolder
    local minOpenCloseBtn = T[505]  -- Restore

    -- Templates
    local templateTabBtn        = T[65]:Clone()   -- Templatebtn
    local templateSectionHeader = T[213]:Clone()  -- MainTemplateFrame
    local templateSectionBody   = T[230]:Clone()  -- DropdownTemplateBgFrame
    local templateToggle        = T[236]:Clone()  -- TemplateToggle
    local templateSlider        = T[257]:Clone()  -- TemplateSlider
    local templateSliderToggle  = T[280]:Clone()  -- TemplateSdTg
    local templateDropdown      = T[311]:Clone()  -- TemplateDropdown
    local templateTextBox       = T[339]:Clone()  -- TemplateTBox
    local templateScrollFrame   = mainScroll:Clone()
    local templateConfigCard    = T[432]:Clone()  -- ConfigCard

    local scrollingConfig = T[430]
    if scrollingConfig then
        for _, child in ipairs(scrollingConfig:GetChildren()) do
            if child:IsA("Frame") and child.Name == "ConfigCardTemplate" then
                child:Destroy()
            end
        end
    end

    local templateDropScroll    = SyshubLib.BuildDropScroll()
    local templateWebhook       = SyshubLib.BuildWebhookTemplate()
    local templateButtonText    = SyshubLib.BuildButtonTextTemplate()
    local templateButtonIcon    = SyshubLib.BuildButtonIconTemplate()

    -- Window Object
    local window = {
        Root = root,
        Tabs = {},
        Flags = {},
        Elements = {},
        SavedConfigs = {},
        SelectedConfigCard = nil,
        SelectedConfigName = nil,
        CurrentTab = nil,
        ActiveDropdown = nil,
        Folder = config.Folder or tostring(game.PlaceId or "SysHub"),
    }

    -- Cleanup Routine
    local isDestroyed = false
    local function cleanupAll()
        if isDestroyed then return end
        isDestroyed = true

        -- Disable Fps
        if fpsBoostEnabled and toggleFps then
            pcall(toggleFps)
        end
        if fpsBoostConnection then
            pcall(function() fpsBoostConnection:Disconnect() end)
            fpsBoostConnection = nil
        end

        -- CleanToggles
        for _, element in pairs(window.Elements) do
            pcall(function()
                if type(element) == "table" and type(element.Get) == "function" and type(element.Set) == "function" then
                    if element.Get() == true then
                        element.Set(false)
                    end
                end
            end)
        end

        -- Disconnect Listeners
        for _, conn in ipairs(connections) do
            pcall(function()
                if conn and conn.Connected then
                    conn:Disconnect()
                end
            end)
        end
        table.clear(connections)

        -- OnClose Callback
        if config.OnClose then
            pcall(config.OnClose)
        end

        -- Destroy Gui
        if root and root.Parent then
            pcall(function() root:Destroy() end)
        end

        if SyshubLib._CurrentWindow == window then
            SyshubLib._CurrentWindow = nil
        end
        if sharedEnv and sharedEnv.SyshubActiveWindow == window then
            sharedEnv.SyshubActiveWindow = nil
        end
    end

    window.Destroy = cleanupAll
    SyshubLib._CurrentWindow = window
    if sharedEnv then
        sharedEnv.SyshubActiveWindow = window
    end

    root.Destroying:Connect(cleanupAll)

    for _, child in ipairs(sidemenuScroll:GetChildren()) do
        if child:IsA("GuiButton") or child:IsA("Frame") then
            child:Destroy()
        end
    end
    for _, child in ipairs(mainScroll:GetChildren()) do
        if child:IsA("GuiObject") and not child:IsA("UIPadding") and not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end

    -- Dropdown Holder
    local dropOverlay = Instance.new("Frame")
    dropOverlay.Name = "DropdownOverlay"
    dropOverlay.BackgroundTransparency = 1
    dropOverlay.BorderSizePixel = 0
    dropOverlay.Size = UDim2.new(1, 0, 1, 0)
    dropOverlay.Position = UDim2.new(0, 0, 0, 0)
    dropOverlay.ZIndex = 5000
    dropOverlay.Parent = loaderFrame

    function window:CloseActiveDropdown()
        if window.ActiveDropdown then
            window.ActiveDropdown.Close()
            window.ActiveDropdown = nil
        end
    end

    -- Draggable Logic
    local function makeDraggable(handle, target)
        local dragging = false
        local dragInput, dragStart, startPos

        handle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = target.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        handle.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        trackConn(UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                target.Position = UDim2.new(
                    startPos.X.Scale,
                    startPos.X.Offset + delta.X,
                    startPos.Y.Scale,
                    startPos.Y.Offset + delta.Y
                )
            end
        end))
    end

    makeDraggable(headerFrame, loaderFrame)
    makeDraggable(minOpenCloseBtn, minModeHolder)

    topCloseBtn.MouseButton1Click:Connect(function()
        cleanupAll()
    end)

    topMinimizeBtn.MouseButton1Click:Connect(function()
        window:CloseActiveDropdown()
        loaderFrame.Visible = false
        minModeHolder.Visible = true
    end)

    minOpenCloseBtn.MouseButton1Click:Connect(function()
        minModeHolder.Visible = false
        loaderFrame.Visible = true
    end)

    -- Hotkey Logic
    if toggleKey then
        trackConn(UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.KeyCode == toggleKey then
                if loaderFrame.Visible then
                    window:CloseActiveDropdown()
                    loaderFrame.Visible = false
                    minModeHolder.Visible = true
                else
                    minModeHolder.Visible = false
                    loaderFrame.Visible = true
                end
            end
        end))
    end

    -- Login Handler
    if keySystem then
        loginFrame.Visible = true
        loaderFrame.Visible = false
        minModeHolder.Visible = false

        loginCloseBtn.MouseButton1Click:Connect(function()
            cleanupAll()
        end)

        local function verifyKey()
            local entered = keyBox.Text
            local success = false
            if keyValidator then
                success = keyValidator(entered)
            elseif type(validKey) == "table" then
                for _, k in ipairs(validKey) do
                    if entered == k then success = true break end
                end
            else
                success = (entered == tostring(validKey))
            end

            if success then
                TweenService:Create(loginFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0.5, 0, 0.45, 0)
                }):Play()
                task.delay(0.2, function()
                    loginFrame.Visible = false
                    loaderFrame.Visible = true
                    window:SelectTab(defaultTab)
                end)
            else
                keyBox.Text = ""
                keyBox.PlaceholderText = "Invalid Key! Try again"
                local shakeStart = loginFrame.Position
                for i = 1, 3 do
                    loginFrame.Position = shakeStart + UDim2.new(0, 8, 0, 0)
                    task.wait(0.04)
                    loginFrame.Position = shakeStart - UDim2.new(0, 8, 0, 0)
                    task.wait(0.04)
                end
                loginFrame.Position = shakeStart
            end
        end

        loginBtn.MouseButton1Click:Connect(verifyKey)
        keyBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then verifyKey() end
        end)
    else
        loginFrame.Visible = false
        loaderFrame.Visible = true
    end

    -- SideMenu Animation
    local function setTabButtonVisual(tabObj, isActive, anim)
        local btn = tabObj.Button
        if not btn then return end

        local styleFrame = btn:FindFirstChild("StyleFrame")
        local studFrame = styleFrame and styleFrame:FindFirstChild("Stud")
        local studGrad = studFrame and studFrame:FindFirstChildOfClass("UIGradient")
        local targetBtnSize = isActive and UDim2.new(0, 194, 0, 54) or UDim2.new(0, 203, 0, 58)

        if styleFrame then styleFrame.Size = UDim2.new(1, 0, 1, 0) end
        if studFrame then studFrame.Size = UDim2.new(1, -2, 1, -4) end

        if anim then
            local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            TweenService:Create(btn, ti, { Size = targetBtnSize }):Play()
        else
            btn.Size = targetBtnSize
        end

        if studGrad then
            if isActive then
                studGrad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 210, 255)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 110, 170))
                })
            else
                studGrad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 140, 210)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 70, 105))
                })
            end
        end
    end

    function window:SelectTab(tabName)
        window.CurrentTab = tabName
        window:CloseActiveDropdown()

        for _, tab in ipairs(window.Tabs) do
            local isCurrent = (tab.Name == tabName)
            setTabButtonVisual(tab, isCurrent, true)
            if tab.Scroll and tab.Name ~= "Settings" then
                tab.Scroll.Visible = isCurrent
            end
        end

        settingScroll.Visible = (tabName == "Settings")
        aboutFrame.Visible    = (tabName == "About")
        serverFrame.Visible   = (tabName == "Server")
    end

    local aboutDescLabel = aboutFrame:FindFirstChild("Keterangan")
    if aboutDescLabel then
        local descText = (config.About and config.About.Description) or config.AboutDescription or config.AboutText
        if descText then
            aboutDescLabel.Text = tostring(descText)
        else
            aboutDescLabel.Text = "Syshub Hub adalah script hub modern Roblox dengan antarmuka elegan, performa tinggi, dan fitur lengkap."
        end
    end

    local function setLinkText(frameName, text)
        if not text then return end
        local f = aboutFrame:FindFirstChild(frameName, true)
        if f then
            local lbl = f:FindFirstChild("Link") or f:FindFirstChildOfClass("TextLabel")
            if lbl then
                lbl.Text = tostring(text)
            end
        end
    end

    local aboutCfg = config.About or {}
    local dLink = aboutCfg.Discord or aboutCfg.discord or "discord.gg/syshub"
    local tLink = aboutCfg.TikTok or aboutCfg.Tiktok or aboutCfg.tiktok or "@syshub.official"
    local wLink = aboutCfg.Website or aboutCfg.website or aboutCfg.Web or aboutCfg.web or "syshub.net"
    local aLink = aboutCfg.WhatsApp or aboutCfg.Whatsapp or aboutCfg.whatsapp or aboutCfg.Wa or aboutCfg.wa or "+62 812-3456-7890"

    setLinkText("DiscordFrame", dLink)
    setLinkText("TiktokFrame", tLink)
    setLinkText("WebsiteFrame", wLink)
    setLinkText("WaFrame", aLink)

    local linkFrame = aboutFrame:FindFirstChild("LinkFrame", true) or T[449]
    if linkFrame then
        linkFrame.Size = UDim2.new(0, 520, 0, 152)
        linkFrame.ClipsDescendants = false
        for _, card in ipairs(linkFrame:GetChildren()) do
            if card:IsA("Frame") or card:IsA("GuiObject") then
                local linkLabel = card:FindFirstChild("Link") or card:FindFirstChildOfClass("TextLabel")
                local goBtn = card:FindFirstChild("GoTobtn") or card:FindFirstChildOfClass("ImageButton")
                if linkLabel and goBtn then
                    goBtn.Active = true
                    goBtn.ZIndex = 15
                    local function copyLink()
                        local url = tostring(linkLabel.Text)
                        pcall(function()
                            if setclipboard then
                                setclipboard(url)
                            elseif syn and syn.write_clipboard then
                                syn.write_clipboard(url)
                            elseif toclipboard then
                                toclipboard(url)
                            end
                        end)
                        print("[Syshub] Link copied to clipboard: " .. url)
                        local orig = linkLabel.Text
                        if orig ~= "Copied!" then
                            linkLabel.Text = "Copied!"
                            task.delay(1, function()
                                if linkLabel and linkLabel.Parent then
                                    linkLabel.Text = orig
                                end
                            end)
                        end
                    end
                    goBtn.MouseButton1Click:Connect(copyLink)
                    card.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            copyLink()
                        end
                    end)
                end
            end
        end
    end

    function window:SetAboutText(newText)
        if aboutDescLabel then
            aboutDescLabel.Text = tostring(newText)
        end
    end

    function window:SetAboutLinks(linkTable)
        linkTable = linkTable or {}
        local d = linkTable.Discord or linkTable.discord
        local t = linkTable.TikTok or linkTable.Tiktok or linkTable.tiktok
        local w = linkTable.Website or linkTable.website or linkTable.Web or linkTable.web
        local a = linkTable.WhatsApp or linkTable.Whatsapp or linkTable.whatsapp or linkTable.Wa or linkTable.wa
        if d then setLinkText("DiscordFrame", d) end
        if t then setLinkText("TiktokFrame", t) end
        if w then setLinkText("WebsiteFrame", w) end
        if a then setLinkText("WaFrame", a) end
    end

    -- Config Folder
    local BaseFolder = "SyshubHub/" .. (window.Folder or tostring(game.PlaceId or "SysHub")) .. "/config/"

    -- Card Visual
    function window:SetCardVisual(card, isSelected, anim)
        if not card or not card.Parent then return end
        local innerStroke = nil
        for _, child in ipairs(card:GetChildren()) do
            if child:IsA("UIStroke") and child.BorderStrokePosition == Enum.BorderStrokePosition.Inner then
                innerStroke = child
                break
            end
        end
        if not innerStroke then
            for _, child in ipairs(card:GetChildren()) do
                if child:IsA("UIStroke") and child.Color ~= C_Black then
                    innerStroke = child
                    break
                end
            end
        end

        local targetStrokeColor = isSelected and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(55, 55, 55)
        local targetStrokeThickness = isSelected and 2.5 or 1.5
        local targetBgColor = isSelected and Color3.fromRGB(30, 50, 40) or Color3.fromRGB(75, 75, 75)
        local targetBgTrans = isSelected and 0.2 or 0.6

        if anim then
            local ti = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
            if innerStroke then
                TweenService:Create(innerStroke, ti, {
                    Color = targetStrokeColor,
                    Thickness = targetStrokeThickness
                }):Play()
            end
            TweenService:Create(card, ti, {
                BackgroundColor3 = targetBgColor,
                BackgroundTransparency = targetBgTrans
            }):Play()
        else
            if innerStroke then
                innerStroke.Color = targetStrokeColor
                innerStroke.Thickness = targetStrokeThickness
            end
            card.BackgroundColor3 = targetBgColor
            card.BackgroundTransparency = targetBgTrans
        end
    end

    function window:SelectConfigCard(targetCard, configName)
        window.SelectedConfigCard = targetCard
        window.SelectedConfigName = configName

        if scrollingConfig then
            for _, child in ipairs(scrollingConfig:GetChildren()) do
                if (child:IsA("Frame") or child:IsA("CanvasGroup")) and child.Name:sub(1, 7) == "Config_" then
                    local isThis = (child == targetCard)
                    window:SetCardVisual(child, isThis, true)
                end
            end
        end
    end

    -- Card Holder
    function window:AddConfigCard(configName, onLoad, onDelete)
        if not scrollingConfig or not templateConfigCard then return end
        local card = templateConfigCard:Clone()
        card.Name = "Config_" .. configName
        card.Visible = true

        local nameLabel = card:FindFirstChild("ConfigName")
        if nameLabel then
            nameLabel.Text = configName
        end

        local isDeleting = false
        local delBtn = card:FindFirstChild("DeleteBtn")
        if delBtn then
            delBtn.MouseButton1Click:Connect(function()
                isDeleting = true
                if window.SelectedConfigCard == card then
                    window.SelectedConfigCard = nil
                    window.SelectedConfigName = nil
                end

                pcall(function()
                    local path = BaseFolder .. configName .. ".json"
                    if type(isfile) == "function" and isfile(path) and type(delfile) == "function" then
                        delfile(path)
                    end
                    if window.SavedConfigs then
                        window.SavedConfigs[configName] = nil
                    end
                end)

                card:Destroy()
                if onDelete then onDelete(configName) end
            end)
        end

        -- Card Click
        local function onCardClicked(input)
            if isDeleting then return end
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                window:SelectConfigCard(card, configName)
                if onLoad then onLoad(configName) end
            end
        end
        card.InputBegan:Connect(onCardClicked)
        if nameLabel then nameLabel.InputBegan:Connect(onCardClicked) end
        local cfgIcon = card:FindFirstChild("ConfigIcon")
        if cfgIcon then cfgIcon.InputBegan:Connect(onCardClicked) end

        window:SetCardVisual(card, false, false)
        card.Parent = scrollingConfig
        return card
    end

    -- Save Config
    function window:SmartSaveConfig(configName)
        task.spawn(function()
            pcall(function()
                if type(isfolder) == "function" and type(makefolder) == "function" then
                    if not isfolder("SyshubHub") then makefolder("SyshubHub") end
                    local rootPath = "SyshubHub/" .. (window.Folder or tostring(game.PlaceId or "SysHub"))
                    if not isfolder(rootPath) then makefolder(rootPath) end
                    local cfgDir = rootPath .. "/config"
                    if not isfolder(cfgDir) then makefolder(cfgDir) end
                end

                local data = {}
                for id, element in pairs(window.Elements) do
                    if type(element) == "table" then
                        local val = nil
                        pcall(function()
                            if type(element.Get) == "function" then
                                val = element:Get()
                            elseif element.CurrentOption ~= nil then
                                val = element.CurrentOption
                            elseif element.Value ~= nil then
                                val = element.Value 
                            elseif element.CurrentValue ~= nil then
                                val = element.CurrentValue 
                            elseif element.State ~= nil then
                                val = element.State
                            elseif element.Selected ~= nil then
                                val = element.Selected
                            end
                        end)

                        if val == nil and window.Flags and window.Flags[id] ~= nil then
                            val = window.Flags[id]
                        end

                        if type(val) == "function" then pcall(function() val = val() end) end
                        if type(val) == "table" and val.Min ~= nil and val.Max ~= nil and val.Default ~= nil then 
                            val = val.Default 
                        end
                        if val ~= nil then data[id] = val end
                    end
                end

                for flagName, flagVal in pairs(window.Flags) do
                    if data[flagName] == nil and type(flagVal) ~= "function" and type(flagVal) ~= "table" then
                        data[flagName] = flagVal
                    end
                end

                -- Sanitize Data
                for k, v in pairs(data) do
                    if typeof(v) == "EnumItem" then
                        data[k] = v.Name
                    elseif type(v) ~= "string" and type(v) ~= "number" and type(v) ~= "boolean" and type(v) ~= "table" then
                        data[k] = tostring(v)
                    end
                end

                local sEnc, jsonStr = pcall(function() return HttpService:JSONEncode(data) end)
                if not sEnc or not jsonStr then
                    warn("[Syshub] JSONEncode error: " .. tostring(jsonStr))
                    return
                end

                if type(writefile) == "function" then
                    local sWrite, wErr = pcall(function()
                        writefile(BaseFolder .. configName .. ".json", jsonStr)
                    end)
                    if not sWrite then
                        warn("[Syshub] Writefile error: " .. tostring(wErr))
                    end
                end
                window.SavedConfigs = window.SavedConfigs or {}
                window.SavedConfigs[configName] = data
                print("[Syshub] Config berhasil disimpan: " .. tostring(configName))
            end)
        end)
    end

    -- Load Config
    function window:SmartLoadConfig(configName)
        task.spawn(function()
            local path = BaseFolder .. configName .. ".json"
            local data = nil

            if type(isfile) == "function" and isfile(path) and type(readfile) == "function" then
                local s, decoded = pcall(function() return HttpService:JSONDecode(readfile(path)) end)
                if s and type(decoded) == "table" then
                    data = decoded
                end
            elseif window.SavedConfigs and window.SavedConfigs[configName] then
                data = window.SavedConfigs[configName]
            end

            if data and type(data) == "table" then
                -- Phase 1
                local loadCount = 0
                for id, val in pairs(data) do
                    local element = window.Elements[id]
                    if element and type(val) ~= "boolean" then
                        pcall(function()
                            if type(element.SetValue) == "function" then element:SetValue(val)
                            elseif type(element.Set) == "function" then element:Set(val)
                            elseif type(element.Select) == "function" then element:Select(val) end
                        end)
                        loadCount = loadCount + 1
                        if loadCount % 2 == 0 then RunService.Heartbeat:Wait() end 
                    end
                end

                task.wait(0.2)

                -- Phase 2
                local toggleCount = 0
                for id, val in pairs(data) do
                    local element = window.Elements[id]
                    if element and type(val) == "boolean" then
                        pcall(function()
                            if type(element.SetValue) == "function" then element:SetValue(val)
                            elseif type(element.Set) == "function" then element:Set(val)
                            elseif type(element.Select) == "function" then element:Select(val) end
                        end)
                        toggleCount = toggleCount + 1
                        if toggleCount % 2 == 0 then RunService.Heartbeat:Wait() end
                    end
                end
                print("[Syshub] Config berhasil dimuat: " .. tostring(configName))
            else
                warn("[Syshub] File config tidak ditemukan atau kosong: " .. tostring(configName))
            end
        end)
    end

    local headerSyshybIcon = headerFrame:FindFirstChild("SyshybIcon")
    if headerSyshybIcon then
        headerSyshybIcon.Visible = true
        headerSyshybIcon.ZIndex = 15
        headerSyshybIcon.Image = "rbxassetid://73996941491460"
    end
    local loginSyshybIcon = loginFrame and loginFrame:FindFirstChild("SyshybIcon", true)
    if loginSyshybIcon then
        loginSyshybIcon.Visible = true
        loginSyshybIcon.ZIndex = 15
        loginSyshybIcon.Image = "rbxassetid://73996941491460"
    end
    local aboutSyshybIcon = aboutFrame:FindFirstChild("SyshybIcon")
    if aboutSyshybIcon then
        aboutSyshybIcon.Visible = true
        aboutSyshybIcon.ZIndex = 15
        aboutSyshybIcon.Image = "rbxassetid://73996941491460"
    end

    local fpsToggleBtn  = T[381] or (settingScroll and settingScroll:FindFirstChild("Togglebtn", true))
    local fpsIndikator  = T[385] or (fpsToggleBtn and fpsToggleBtn:FindFirstChild("IndikatorFrame", true))
    fpsBoostEnabled = false
    fpsBoostConnection = nil

    local function updateFpsVisual(anim)
        if not fpsIndikator then return end
        local targetPos = fpsBoostEnabled and UDim2.new(0.57, 0, 0.097, 0) or UDim2.new(0.07, 0, 0.097, 0)
        local grad = fpsIndikator:FindFirstChildOfClass("UIGradient")
        if anim then
            TweenService:Create(fpsIndikator, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = targetPos
            }):Play()
        else
            fpsIndikator.Position = targetPos
        end
        if grad then
            if fpsBoostEnabled then
                grad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))
                })
            else
                grad.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                    ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                })
            end
        end
    end

    updateFpsVisual(false)

    -- Optimizer
    local function optimizeObject(obj)
        if obj:IsA("BasePart") then
            pcall(function()
                obj.Material = Enum.Material.SmoothPlastic
                obj.Reflectance = 0
                obj.CastShadow = false
            end)
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            pcall(function()
                obj.Transparency = 1
            end)
        elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") then
            pcall(function()
                obj.Enabled = false
            end)
        elseif obj:IsA("Explosion") then
            pcall(function()
                obj.Visible = false
            end)
        end
    end

    toggleFps = function()
        fpsBoostEnabled = not fpsBoostEnabled
        window.Flags["FPSBoost"] = fpsBoostEnabled
        updateFpsVisual(true)

        pcall(function()
            local lighting = game:GetService("Lighting")
            local ws = game:GetService("Workspace")

            if fpsBoostEnabled then
                lighting.GlobalShadows = false
                lighting.FogEnd = 9e9
                lighting.ShadowSoftness = 0
                settings().Rendering.QualityLevel = Enum.QualityLevel.Level01

                for _, v in ipairs(lighting:GetChildren()) do
                    if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") then
                        pcall(function() v.Enabled = false end)
                    end
                end

                -- Sweep Map
                task.spawn(function()
                    local descendants = ws:GetDescendants()
                    local count = 0
                    for i = 1, #descendants do
                        if not fpsBoostEnabled then break end
                        optimizeObject(descendants[i])
                        count = count + 1
                        if count % 150 == 0 then
                            task.wait()
                        end
                    end
                end)

                -- Listen Spawns
                if not fpsBoostConnection then
                    fpsBoostConnection = trackConn(ws.DescendantAdded:Connect(function(newObj)
                        if fpsBoostEnabled then
                            optimizeObject(newObj)
                        end
                    end))
                end
            else
                lighting.GlobalShadows = true
                settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic

                for _, v in ipairs(lighting:GetChildren()) do
                    if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") then
                        pcall(function() v.Enabled = true end)
                    end
                end

                if fpsBoostConnection then
                    fpsBoostConnection:Disconnect()
                    fpsBoostConnection = nil
                end
            end
        end)

        if config.OnFpsBoost then
            config.OnFpsBoost(fpsBoostEnabled)
        end
        print("[Syshub] FPS Boost toggled:", fpsBoostEnabled)
    end

    if fpsToggleBtn then
        fpsToggleBtn.MouseButton1Click:Connect(toggleFps)
    end

    local saveBtn = settingScroll:FindFirstChild("SaveBtn", true)
    local loadBtn = settingScroll:FindFirstChild("LoadBtn", true)

    -- Save Button
    if saveBtn then
        saveBtn.MouseButton1Click:Connect(function()
            if saveInputBox then
                saveInputBox.Text = ""
            end
            if saveModal then
                saveModal.Visible = true
                task.delay(0.05, function()
                    if saveInputBox then
                        saveInputBox:CaptureFocus()
                    end
                end)
            end
        end)
    end

    -- Cancel Button
    if saveCancelBtn then
        saveCancelBtn.MouseButton1Click:Connect(function()
            if saveModal then
                saveModal.Visible = false
            end
        end)
    end

    -- Confirm Save
    local function doConfirmSave()
        if not saveModal or not saveModal.Visible then return end
        local rawText = saveInputBox and saveInputBox.Text or ""
        local typedName = rawText:match("^%s*(.-)%s*$")

        if not typedName or typedName == "" then
            local existingNumbers = {}
            if scrollingConfig then
                for _, child in ipairs(scrollingConfig:GetChildren()) do
                    if (child:IsA("Frame") or child:IsA("CanvasGroup")) and child.Name:sub(1, 7) == "Config_" then
                        local num = tonumber(child.Name:match("%d+"))
                        if num then
                            existingNumbers[num] = true
                        end
                    end
                end
            end
            local nextNum = 1
            while existingNumbers[nextNum] do
                nextNum = nextNum + 1
            end
            typedName = "Config " .. nextNum
        end

        saveModal.Visible = false

        window:SmartSaveConfig(typedName)
        local newCard = window:AddConfigCard(typedName)
        if newCard then
            window:SelectConfigCard(newCard, typedName)
        end
    end

    if saveConfirmBtn then
        saveConfirmBtn.MouseButton1Click:Connect(doConfirmSave)
    end

    if saveInputBox then
        saveInputBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                doConfirmSave()
            end
        end)
    end

    if loadBtn then
        loadBtn.MouseButton1Click:Connect(function()
            if window.SelectedConfigName then
                window:SmartLoadConfig(window.SelectedConfigName)
            else
                local firstCard, firstName = nil, nil
                if scrollingConfig then
                    for _, child in ipairs(scrollingConfig:GetChildren()) do
                        if (child:IsA("Frame") or child:IsA("CanvasGroup")) and child.Name:sub(1, 7) == "Config_" then
                            firstCard = child
                            firstName = child.Name:sub(8)
                            break
                        end
                    end
                end
                if firstCard and firstName then
                    window:SelectConfigCard(firstCard, firstName)
                    window:SmartLoadConfig(firstName)
                else
                    warn("[Syshub] Belum ada file config yang dipilih!")
                end
            end
        end)
    end

    -- Auto Load
    task.spawn(function()
        pcall(function()
            if type(isfolder) == "function" and isfolder(BaseFolder) and type(listfiles) == "function" then
                local firstCard, firstName = nil, nil
                for _, fPath in ipairs(listfiles(BaseFolder)) do
                    local cfgName = fPath:match("([^/\\]+)%.json$")
                    if cfgName and scrollingConfig then
                        local card = window:AddConfigCard(cfgName)
                        if not firstCard then
                            firstCard = card
                            firstName = cfgName
                        end
                    end
                end
                if firstCard and firstName then
                    window:SelectConfigCard(firstCard, firstName)
                end
            end
        end)
    end)

    --Tab Creator
    function window:CreateTab(tabConfig)
        tabConfig = tabConfig or {}
        local tabName = tabConfig.Name or "Tab"
        local tabIcon = tabConfig.Icon 
            or SyshubLib.Icons.Tabs[tabName]
            or (tabName == "Steal An Egg" and SyshubLib.Icons.Tabs.StealAnEgg)
            or (tabName == "PickAxe" and SyshubLib.Icons.Tabs.PickAxe)
            or (tabName == "Batu" and SyshubLib.Icons.Tabs.Batu)
            or (tabName == "Settings" and SyshubLib.Icons.Tabs.Settings)
            or (tabName == "About" and SyshubLib.Icons.Tabs.About)
            or SyshubLib.Icons.Tabs.StealAnEgg

        local tabBtn = templateTabBtn:Clone()
        tabBtn.Name = "Tab_" .. tabName
        tabBtn.Visible = true
        tabBtn.Parent = sidemenuScroll

        local tabTitle = tabBtn:FindFirstChild("GameName", true)
        if tabTitle then
            tabTitle.Text = tabName
        end

        local tabImage = tabBtn:FindFirstChild("GameImage", true)
        if tabImage and tabIcon then
            tabImage.Image = tabIcon
        end

        local tabScroll = nil
        if tabName == "Settings" then
            tabScroll = settingScroll
        elseif tabName ~= "About" and tabName ~= "Server" then
            tabScroll = templateScrollFrame:Clone()
            tabScroll.Name = "Scroll_" .. tabName
            tabScroll.Visible = false
            tabScroll.Parent = mainFrame

            for _, child in ipairs(tabScroll:GetChildren()) do
                if child:IsA("GuiObject") and not child:IsA("UIPadding") and not child:IsA("UIListLayout") then
                    child:Destroy()
                end
            end

            tabScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
                window:CloseActiveDropdown()
            end)
        end

        local tabObj = {
            Name = tabName,
            Button = tabBtn,
            Scroll = tabScroll,
            Sections = {},
        }

        tabBtn.MouseButton1Click:Connect(function()
            window:SelectTab(tabName)
        end)

        table.insert(window.Tabs, tabObj)

        if tabName == defaultTab or (#window.Tabs == 1 and not defaultTab) then
            window:SelectTab(tabName)
        else
            setTabButtonVisual(tabObj, false, false)
        end

        -- Attach widgets
        local function attachWidgetMethods(targetTable, getContainer)
            local function resolveContainer()
                if type(getContainer) == "function" then
                    return getContainer()
                end
                return getContainer
            end

            -- Keybind Helper
            local function resolveKeyCode(kc)
                if typeof(kc) == "EnumItem" then
                    return kc
                end
                if type(kc) == "string" and kc ~= "" and kc ~= "None" and kc ~= "..." then
                    local s, res = pcall(function() return Enum.KeyCode[kc] end)
                    if s and res then return res end
                    for _, item in ipairs(Enum.KeyCode:GetEnumItems()) do
                        if item.Name:lower() == kc:lower() then
                            return item
                        end
                    end
                end
                return nil
            end

            -- Add Toggle
            function targetTable:AddToggle(toggleConfig)
                local parentBody = resolveContainer()
                toggleConfig = toggleConfig or {}
                local name = toggleConfig.Name or "Toggle"
                local defaultVal = toggleConfig.Default or false
                local callback = toggleConfig.Callback or function() end
                local keybind = toggleConfig.Keybind

                local toggleInst = templateToggle:Clone()
                toggleInst.Name = "Toggle_" .. name
                toggleInst.Visible = true
                toggleInst.Parent = parentBody

                local titleLabel = toggleInst:FindFirstChild("TitleText", true) or toggleInst:FindFirstChildOfClass("TextLabel")
                if titleLabel then
                    titleLabel.Text = name
                end

                local toggleBtn = toggleInst:FindFirstChild("Togglebtn", true)
                local indicator = toggleBtn and toggleBtn:FindFirstChild("IndikatorFrame", true)
                local keyBoxInst = toggleInst:FindFirstChild("Keybind", true)

                local state = defaultVal
                window.Flags[name] = state

                local function updateVisual(anim)
                    if not indicator then return end
                    local targetPos = state and UDim2.new(0.57, 0, 0.097, 0) or UDim2.new(0.07, 0, 0.097, 0)
                    local grad = indicator:FindFirstChildOfClass("UIGradient")

                    if anim then
                        TweenService:Create(indicator, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = targetPos
                        }):Play()
                    else
                        indicator.Position = targetPos
                    end

                    if grad then
                        if state then
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))
                            })
                        else
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                            })
                        end
                    end
                end

                updateVisual(false)

                local function toggle()
                    state = not state
                    window.Flags[name] = state
                    updateVisual(true)
                    pcall(function() callback(state) end)
                end

                if toggleBtn then
                    toggleBtn.MouseButton1Click:Connect(toggle)
                end

                -- Keybind Init
                local boundKeyCode = resolveKeyCode(keybind)
                if keyBoxInst then
                    window.Flags[name .. "_Keybind"] = boundKeyCode and boundKeyCode.Name or ""
                end

                local isBinding = false
                local function updateKeyboxText()
                    if not keyBoxInst then return end
                    keyBoxInst.Text = boundKeyCode and boundKeyCode.Name or "..."
                end
                updateKeyboxText()

                local function applyToggleKey(kc)
                    boundKeyCode = resolveKeyCode(kc)
                    window.Flags[name .. "_Keybind"] = boundKeyCode and boundKeyCode.Name or ""
                    updateKeyboxText()
                end

                if keyBoxInst then
                    keyBoxInst.Focused:Connect(function()
                        isBinding = true
                        keyBoxInst.Text = "..."
                    end)

                    keyBoxInst.FocusLost:Connect(function()
                        isBinding = false
                        updateKeyboxText()
                    end)
                end

                trackConn(UserInputService.InputBegan:Connect(function(input, gp)
                    if isBinding and input.UserInputType == Enum.UserInputType.Keyboard then
                        if input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Escape then
                            applyToggleKey(nil)
                        else
                            applyToggleKey(input.KeyCode)
                        end
                        isBinding = false
                        if keyBoxInst then
                            keyBoxInst:ReleaseFocus()
                        end
                        return
                    end

                    if gp then return end
                    if boundKeyCode and input.KeyCode == boundKeyCode then
                        toggle()
                    end
                end))

                local toggleObj = {
                    Set = function(self, newVal)
                        if newVal == nil then newVal = self end
                        state = newVal
                        window.Flags[name] = state
                        updateVisual(true)
                        pcall(function() callback(state) end)
                    end,
                    SetValue = function(self, newVal)
                        if newVal == nil then newVal = self end
                        toggleObj.Set(newVal)
                    end,
                    SetKeybind = function(self, kc)
                        if kc == nil then kc = self end
                        applyToggleKey(kc)
                    end,
                    GetKeybind = function()
                        return boundKeyCode and boundKeyCode.Name or ""
                    end,
                    Get = function(...)
                        return state
                    end,
                    Instance = toggleInst,
                }
                window.Elements[name] = toggleObj

                -- Toggle Keybind
                if keyBoxInst then
                    local toggleKeybindObj = {
                        Set = function(self, kc)
                            if kc == nil then kc = self end
                            applyToggleKey(kc)
                        end,
                        SetValue = function(self, kc)
                            if kc == nil then kc = self end
                            applyToggleKey(kc)
                        end,
                        Get = function(...)
                            return boundKeyCode and boundKeyCode.Name or ""
                        end,
                        Instance = keyBoxInst,
                    }
                    window.Elements[name .. "_Keybind"] = toggleKeybindObj
                end

                return toggleObj
            end

            -- Add Keybind
            function targetTable:AddKeybind(keybindConfig)
                local parentBody = resolveContainer()
                keybindConfig = keybindConfig or {}
                local name = keybindConfig.Name or "Keybind"
                local defaultKey = keybindConfig.Default
                local callback = keybindConfig.Callback or function() end

                local kbInst = templateToggle:Clone()
                kbInst.Name = "Keybind_" .. name
                kbInst.Visible = true
                kbInst.Parent = parentBody

                local titleLabel = kbInst:FindFirstChild("TitleText", true)
                if titleLabel then
                    titleLabel.Text = name
                end

                local toggleBtn = kbInst:FindFirstChild("Togglebtn", true)
                if toggleBtn then toggleBtn.Visible = false end

                local keyBoxInst = kbInst:FindFirstChild("Keybind", true)
                local boundKeyCode = resolveKeyCode(defaultKey)
                window.Flags[name] = boundKeyCode and boundKeyCode.Name or ""

                local isBinding = false
                local function updateText()
                    if not keyBoxInst then return end
                    keyBoxInst.Text = boundKeyCode and boundKeyCode.Name or "..."
                end
                updateText()

                local function applyKey(kc)
                    boundKeyCode = resolveKeyCode(kc)
                    window.Flags[name] = boundKeyCode and boundKeyCode.Name or ""
                    updateText()
                end

                if keyBoxInst then
                    keyBoxInst.Size = UDim2.new(0, 60, 0, 31)
                    keyBoxInst.Position = UDim2.new(0.85, 0, 0.2, 0)
                    keyBoxInst.Focused:Connect(function()
                        isBinding = true
                        keyBoxInst.Text = "..."
                    end)
                    keyBoxInst.FocusLost:Connect(function()
                        isBinding = false
                        updateText()
                    end)
                end

                trackConn(UserInputService.InputBegan:Connect(function(input, gp)
                    if isBinding and input.UserInputType == Enum.UserInputType.Keyboard then
                        if input.KeyCode == Enum.KeyCode.Backspace or input.KeyCode == Enum.KeyCode.Escape then
                            applyKey(nil)
                        else
                            applyKey(input.KeyCode)
                        end
                        isBinding = false
                        if keyBoxInst then
                            keyBoxInst:ReleaseFocus()
                        end
                        return
                    end

                    if gp then return end
                    if boundKeyCode and input.KeyCode == boundKeyCode then
                        pcall(function() callback(boundKeyCode) end)
                    end
                end))

                local keybindObj = {
                    Set = function(self, kc)
                        if kc == nil then kc = self end
                        applyKey(kc)
                    end,
                    SetValue = function(self, kc)
                        if kc == nil then kc = self end
                        applyKey(kc)
                    end,
                    Get = function(...)
                        return boundKeyCode and boundKeyCode.Name or ""
                    end,
                    Instance = kbInst,
                }
                window.Elements[name] = keybindObj
                return keybindObj
            end

            -- Add Slider
            function targetTable:AddSlider(sliderConfig)
                local parentBody = resolveContainer()
                sliderConfig = sliderConfig or {}
                local name = sliderConfig.Name or "Slider"
                local min = sliderConfig.Min or 0
                local max = sliderConfig.Max or 100
                local defaultVal = sliderConfig.Default or min
                local callback = sliderConfig.Callback or function() end

                local sliderInst = templateSlider:Clone()
                sliderInst.Name = "Slider_" .. name
                sliderInst.Visible = true
                sliderInst.Parent = parentBody

                local titleLabel = sliderInst:FindFirstChild("TitleText", true) or sliderInst:FindFirstChildOfClass("TextLabel")
                if titleLabel then
                    titleLabel.Text = name
                end

                local barHolder = sliderInst:FindFirstChild("BarHolder", true)
                local barBG = barHolder and barHolder:FindFirstChild("BarBG", true)
                local bar = barBG and barBG:FindFirstChild("Bar", true)
                local indicator = barHolder and barHolder:FindFirstChild("IndicatorText", true)

                local currentVal = math.clamp(defaultVal, min, max)
                window.Flags[name] = currentVal

                local function setVal(val, fireCallback)
                    currentVal = math.clamp(math.floor(val + 0.5), min, max)
                    window.Flags[name] = currentVal
                    local pct = (currentVal - min) / math.max(1, (max - min))
                    if bar then
                        bar.Size = UDim2.new(math.clamp(pct, 0, 1), 0, 1, 0)
                    end
                    if indicator then
                        indicator.Text = tostring(currentVal)
                    end
                    if fireCallback then
                        callback(currentVal)
                    end
                end

                setVal(currentVal, false)

                if barBG then
                    local dragging = false
                    local function updateFromInput(input)
                        local relX = input.Position.X - barBG.AbsolutePosition.X
                        local pct = math.clamp(relX / barBG.AbsoluteSize.X, 0, 1)
                        setVal(min + pct * (max - min), true)
                    end

                    barBG.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            dragging = true
                            updateFromInput(input)
                        end
                    end)

                    barBG.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                        end
                    end)

                    trackConn(UserInputService.InputChanged:Connect(function(input)
                        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            updateFromInput(input)
                        end
                    end))
                end

                local sliderObj = {
                    Set = function(v) setVal(v, true) end,
                    SetValue = function(self, v)
                        if self ~= sliderObj and v == nil then v = self end
                        setVal(v, true)
                    end,
                    Get = function() return currentVal end,
                }
                window.Elements[name] = sliderObj
                return sliderObj
            end

            -- Slider Toggle
            function targetTable:AddSliderToggle(sdtgConfig)
                local parentBody = resolveContainer()
                sdtgConfig = sdtgConfig or {}
                local name = sdtgConfig.Name or "SliderToggle"
                local min = sdtgConfig.Min or 0
                local max = sdtgConfig.Max or 100
                local sliderDef = sdtgConfig.SliderDefault or min
                local sliderCallback = sdtgConfig.SliderCallback or function() end
                local toggleDef = sdtgConfig.ToggleDefault or false
                local toggleCallback = sdtgConfig.ToggleCallback or function() end

                local sdtgInst = templateSliderToggle:Clone()
                sdtgInst.Name = "SdTg_" .. name
                sdtgInst.Visible = true
                sdtgInst.Parent = parentBody

                local titleLabel = sdtgInst:FindFirstChild("TitleText", true) or sdtgInst:FindFirstChildOfClass("TextLabel")
                if titleLabel then
                    titleLabel.Text = name
                end

                -- Wire Slider
                local barHolder = sdtgInst:FindFirstChild("BarHolder", true)
                local barBG = barHolder and barHolder:FindFirstChild("BarBG", true)
                local bar = barBG and barBG:FindFirstChild("Bar", true)
                local indicator = barHolder and barHolder:FindFirstChild("IndicatorText", true)
                local currentVal = math.clamp(sliderDef, min, max)

                local function setVal(val, fireCb)
                    currentVal = math.clamp(math.floor(val + 0.5), min, max)
                    window.Flags[name .. "_Slider"] = currentVal
                    local pct = (currentVal - min) / math.max(1, (max - min))
                    if bar then bar.Size = UDim2.new(math.clamp(pct, 0, 1), 0, 1, 0) end
                    if indicator then indicator.Text = tostring(currentVal) end
                    if fireCb then sliderCallback(currentVal) end
                end
                setVal(currentVal, false)

                if barBG then
                    local dragging = false
                    local function updateInput(input)
                        local relX = input.Position.X - barBG.AbsolutePosition.X
                        local pct = math.clamp(relX / barBG.AbsoluteSize.X, 0, 1)
                        setVal(min + pct * (max - min), true)
                    end
                    barBG.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            dragging = true
                            updateInput(input)
                        end
                    end)
                    barBG.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            dragging = false
                        end
                    end)
                    trackConn(UserInputService.InputChanged:Connect(function(input)
                        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                            updateInput(input)
                        end
                    end))
                end

                -- Wire Toggle
                local toggleBtn = sdtgInst:FindFirstChild("Togglebtn", true)
                local indFrame = toggleBtn and toggleBtn:FindFirstChild("IndikatorFrame", true)
                local tState = toggleDef
                window.Flags[name .. "_Toggle"] = tState

                local function updateTVisual(anim)
                    if not indFrame then return end
                    local targetPos = tState and UDim2.new(0.57, 0, 0.097, 0) or UDim2.new(0.07, 0, 0.097, 0)
                    local grad = indFrame:FindFirstChildOfClass("UIGradient")
                    if anim then
                        TweenService:Create(indFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = targetPos
                        }):Play()
                    else
                        indFrame.Position = targetPos
                    end
                    if grad then
                        if tState then
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))
                            })
                        else
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                            })
                        end
                    end
                end
                updateTVisual(false)

                if toggleBtn then
                    toggleBtn.MouseButton1Click:Connect(function()
                        tState = not tState
                        window.Flags[name .. "_Toggle"] = tState
                        updateTVisual(true)
                        toggleCallback(tState)
                    end)
                end

                local sdtgObj = {
                    SetSlider = function(v) setVal(v, true) end,
                    SetToggle = function(s)
                        tState = s
                        window.Flags[name .. "_Toggle"] = tState
                        updateTVisual(true)
                        toggleCallback(tState)
                    end,
                }
                window.Elements[name .. "_Slider"] = {
                    Set = function(v) setVal(v, true) end,
                    SetValue = function(self, v) if self ~= sdtgObj and v == nil then v = self end setVal(v, true) end,
                    Get = function() return currentVal end,
                }
                window.Elements[name .. "_Toggle"] = {
                    Set = function(s) sdtgObj.SetToggle(s) end,
                    SetValue = function(self, s) if self ~= sdtgObj and s == nil then s = self end sdtgObj.SetToggle(s) end,
                    Get = function() return tState end,
                }
                return sdtgObj
            end

            -- Add Dropdown
            function targetTable:AddDropdown(dropdownConfig)
                local parentBody = resolveContainer()
                dropdownConfig = dropdownConfig or {}
                local name = dropdownConfig.Name or "Dropdown"
                local options = dropdownConfig.Options or {}
                local defaultVal = dropdownConfig.Default or options[1] or ""
                local callback = dropdownConfig.Callback or function() end
                local hasToggle = dropdownConfig.HasToggle or false
                local toggleCallback = dropdownConfig.ToggleCallback or function() end

                local dropInst = templateDropdown:Clone()
                dropInst.Name = "Dropdown_" .. name
                dropInst.Visible = true
                dropInst.Size = UDim2.new(0, 524, 0, 56)
                dropInst.Parent = parentBody

                local titleLabel = dropInst:FindFirstChild("TitleText", true) or dropInst:FindFirstChildOfClass("TextLabel")
                if titleLabel then
                    titleLabel.Text = name
                end

                local dropHolder = dropInst:FindFirstChild("DropHolder", true)
                local indicator = dropHolder and dropHolder:FindFirstChild("IndicatorText", true)
                local hitbox = dropHolder and dropHolder:FindFirstChild("Hitbox", true)
                local dropIcon = dropHolder and dropHolder:FindFirstChild("DropIcon", true)
                local sideToggleBtn = dropInst:FindFirstChild("Togglebtn", true)

                if hitbox then
                    hitbox.Size = UDim2.new(1, 0, 1, 0)
                    hitbox.Position = UDim2.new(0, 0, 0, 0)
                    hitbox.ZIndex = 50
                    hitbox.Active = true
                    hitbox.Selectable = true
                end
                if indicator then indicator.Active = false end
                if dropIcon then dropIcon.Active = false end

                -- Side Toggle
                local sideToggleObj = nil
                local tState = dropdownConfig.ToggleDefault or false
                local function updateSideT(anim)
                    if not sideToggleBtn then return end
                    local indFrame = sideToggleBtn:FindFirstChild("IndikatorFrame", true)
                    if not indFrame then return end
                    local targetPos = tState and UDim2.new(0.57, 0, 0.097, 0) or UDim2.new(0.07, 0, 0.097, 0)
                    local grad = indFrame:FindFirstChildOfClass("UIGradient")
                    if anim then
                        TweenService:Create(indFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = targetPos
                        }):Play()
                    else
                        indFrame.Position = targetPos
                    end
                    if grad then
                        if tState then
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))
                            })
                        else
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                            })
                        end
                    end
                end

                if not hasToggle and sideToggleBtn then
                    sideToggleBtn.Visible = false
                    if dropHolder then
                        dropHolder.Size = UDim2.new(0, 310, 0, 31)
                    end
                elseif hasToggle and sideToggleBtn then
                    sideToggleBtn.Visible = true
                    window.Flags[name .. "_Toggle"] = tState
                    updateSideT(false)
                    sideToggleBtn.MouseButton1Click:Connect(function()
                        tState = not tState
                        window.Flags[name .. "_Toggle"] = tState
                        updateSideT(true)
                        pcall(function() toggleCallback(tState) end)
                    end)

                    sideToggleObj = {
                        Set = function(self, s)
                            if s == nil then s = self end
                            tState = not not s
                            window.Flags[name .. "_Toggle"] = tState
                            updateSideT(true)
                            pcall(function() toggleCallback(tState) end)
                        end,
                        SetValue = function(self, s)
                            if s == nil then s = self end
                            sideToggleObj.Set(s)
                        end,
                        Get = function(...)
                            return tState
                        end,
                    }
                    window.Elements[name .. "_Toggle"] = sideToggleObj
                end

                -- DropScrollFrame
                local dropScroll = templateDropScroll:Clone()
                dropScroll.Name = "DropScroll_" .. name
                dropScroll.Visible = false
                dropScroll.ZIndex = 5000
                dropScroll.Parent = dropOverlay

                local optionTemplate = dropScroll:FindFirstChild("OptionTemplate")
                if optionTemplate then
                    optionTemplate.Visible = false
                end

                local isOpen = false
                local currentVal = defaultVal
                window.Flags[name] = currentVal

                if indicator then
                    indicator.Text = (currentVal and tostring(currentVal) ~= "") and tostring(currentVal) or "Select..."
                end

                local outsideClickConn = nil
                local function closeDropdown()
                    if not isOpen then return end
                    isOpen = false
                    dropScroll.Visible = false
                    if outsideClickConn then
                        outsideClickConn:Disconnect()
                        outsideClickConn = nil
                    end
                    if dropIcon then
                        TweenService:Create(dropIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Rotation = 0
                        }):Play()
                    end
                    if window.ActiveDropdown and window.ActiveDropdown.Close == closeDropdown then
                        window.ActiveDropdown = nil
                    end
                end

                local function updateDropdownPosition()
                    if not dropHolder or not dropHolder.Parent then return end
                    local holderPos = dropHolder.AbsolutePosition
                    local overlayPos = dropOverlay.AbsolutePosition
                    local relX = holderPos.X - overlayPos.X
                    local relY = (holderPos.Y - overlayPos.Y) + dropHolder.AbsoluteSize.Y + 1
                    local numOpts = #options
                    local targetH = math.clamp(numOpts * 30 + 8, 38, 120)

                    dropScroll.Position = UDim2.new(0, relX, 0, relY)
                    dropScroll.Size = UDim2.new(0, dropHolder.AbsoluteSize.X, 0, targetH)
                end

                local function openDropdown()
                    if isOpen then return end
                    window:CloseActiveDropdown()
                    isOpen = true
                    updateDropdownPosition()
                    dropScroll.Visible = true

                    if dropIcon then
                        TweenService:Create(dropIcon, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Rotation = 180
                        }):Play()
                    end

                    window.ActiveDropdown = {
                        Close = closeDropdown
                    }

                    task.delay(0.05, function()
                        if not isOpen then return end
                        outsideClickConn = trackConn(UserInputService.InputBegan:Connect(function(input)
                            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                                local mPos = UserInputService:GetMouseLocation()
                                local sPos = dropScroll.AbsolutePosition
                                local sSize = dropScroll.AbsoluteSize
                                local hPos = dropHolder.AbsolutePosition
                                local hSize = dropHolder.AbsoluteSize
                                local inScroll = (mPos.X >= sPos.X and mPos.X <= sPos.X + sSize.X and mPos.Y >= sPos.Y and mPos.Y <= sPos.Y + sSize.Y + 36)
                                local inHolder = (mPos.X >= hPos.X and mPos.X <= hPos.X + hSize.X and mPos.Y >= hPos.Y and mPos.Y <= hPos.Y + hSize.Y + 36)
                                if not inScroll and not inHolder then
                                    closeDropdown()
                                end
                            end
                        end))
                    end)
                end

                local isToggling = false
                local function toggleDropdown()
                    if isToggling then return end
                    isToggling = true
                    task.delay(0.12, function() isToggling = false end)
                    if isOpen then
                        closeDropdown()
                    else
                        openDropdown()
                    end
                end

                if hitbox then
                    hitbox.MouseButton1Click:Connect(toggleDropdown)
                else
                    dropHolder.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                            toggleDropdown()
                        end
                    end)
                end

                local function populateOptions(optList)
                    for _, child in ipairs(dropScroll:GetChildren()) do
                        if child:IsA("GuiButton") and child ~= optionTemplate then
                            child:Destroy()
                        end
                    end

                    for _, opt in ipairs(optList) do
                        local btn = optionTemplate:Clone()
                        btn.Name = "Option_" .. tostring(opt)
                        btn.Text = tostring(opt)
                        btn.Visible = true
                        btn.ZIndex = 5005
                        btn.Active = true
                        btn.Parent = dropScroll

                        btn.MouseEnter:Connect(function()
                            TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0.1 }):Play()
                        end)
                        btn.MouseLeave:Connect(function()
                            TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundTransparency = 0.3 }):Play()
                        end)

                        btn.MouseButton1Click:Connect(function()
                            currentVal = opt
                            window.Flags[name] = currentVal
                            if indicator then
                                indicator.Text = tostring(opt)
                            end
                            closeDropdown()
                            callback(opt)
                        end)
                    end
                end

                populateOptions(options)

                -- Dropdown Functions
                local function applyOption(opt)
                    currentVal = opt
                    window.Flags[name] = currentVal
                    if indicator then
                        indicator.Text = (opt and tostring(opt) ~= "") and tostring(opt) or "Select..."
                    end
                    pcall(function() callback(opt) end)
                end

                local dropObj = {
                    Set = function(self, opt)
                        if opt == nil then opt = self end
                        applyOption(opt)
                    end,
                    SetValue = function(self, opt)
                        if opt == nil then opt = self end
                        applyOption(opt)
                    end,
                    Select = function(self, opt)
                        if opt == nil then opt = self end
                        applyOption(opt)
                    end,
                    Refresh = function(newOpts)
                        options = newOpts
                        populateOptions(options)
                    end,
                    Get = function(...)
                        return currentVal
                    end,
                    SetToggle = function(self, s)
                        if s == nil then s = self end
                        if not hasToggle or not sideToggleObj then return end
                        sideToggleObj.Set(s)
                    end,
                    GetToggle = function()
                        return tState
                    end,
                    Instance = dropInst,
                }
                window.Elements[name] = dropObj
                return dropObj
            end

            -- Add TextBox
            function targetTable:AddTextBox(tboxConfig)
                local parentBody = resolveContainer()
                tboxConfig = tboxConfig or {}
                local name = tboxConfig.Name or "Input"
                local defaultVal = tboxConfig.Default or "1"
                local placeholder = tboxConfig.Placeholder or "Enter..."
                local callback = tboxConfig.Callback or function() end
                local hasToggle = tboxConfig.HasToggle or false
                local toggleDefault = tboxConfig.ToggleDefault or false
                local toggleCallback = tboxConfig.ToggleCallback or function() end

                local tboxInst = templateTextBox:Clone()
                tboxInst.Name = "TBox_" .. name
                tboxInst.Visible = true
                tboxInst.Parent = parentBody

                local titleLabel = tboxInst:FindFirstChild("TitleText", true) or tboxInst:FindFirstChildOfClass("TextLabel")
                if titleLabel then
                    titleLabel.Text = name
                end

                local inputBox = tboxInst:FindFirstChild("InputBox", true)
                local plusBtn = tboxInst:FindFirstChild("Plusbtn", true)
                local minBtn = tboxInst:FindFirstChild("Minbtn", true)
                local sideToggle = tboxInst:FindFirstChild("Togglebtn", true)
                local indFrame = sideToggle and sideToggle:FindFirstChild("IndikatorFrame", true)

                local currentVal = tostring(defaultVal)
                local toggleState = toggleDefault
                window.Flags[name] = currentVal

                local function applyTextVal(val)
                    currentVal = tostring(val or "")
                    window.Flags[name] = currentVal
                    if inputBox then
                        inputBox.Text = currentVal
                    end
                    pcall(function() callback(currentVal) end)
                end

                if inputBox then
                    inputBox.Text = currentVal
                    inputBox.PlaceholderText = placeholder

                    inputBox.FocusLost:Connect(function(enterPressed)
                        currentVal = inputBox.Text
                        window.Flags[name] = currentVal
                        pcall(function() callback(currentVal) end)
                    end)
                end

                if plusBtn and inputBox then
                    plusBtn.MouseButton1Click:Connect(function()
                        local num = tonumber(inputBox.Text) or 0
                        num = num + 1
                        inputBox.Text = tostring(num)
                        currentVal = inputBox.Text
                        window.Flags[name] = currentVal
                        pcall(function() callback(currentVal) end)
                    end)
                end

                if minBtn and inputBox then
                    minBtn.MouseButton1Click:Connect(function()
                        local num = tonumber(inputBox.Text) or 0
                        num = num - 1
                        inputBox.Text = tostring(num)
                        currentVal = inputBox.Text
                        window.Flags[name] = currentVal
                        pcall(function() callback(currentVal) end)
                    end)
                end

                -- Toggle Logic
                local function updateToggleVisual(anim)
                    if not indFrame then return end
                    local targetPos = toggleState and UDim2.new(0.57, 0, 0.097, 0) or UDim2.new(0.07, 0, 0.097, 0)
                    local grad = indFrame:FindFirstChildOfClass("UIGradient")
                    if anim then
                        TweenService:Create(indFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = targetPos
                        }):Play()
                    else
                        indFrame.Position = targetPos
                    end
                    if grad then
                        if toggleState then
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))
                            })
                        else
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                            })
                        end
                    end
                end

                if sideToggle then
                    if hasToggle then
                        sideToggle.Visible = true
                        window.Flags[name .. "_Toggle"] = toggleState
                        updateToggleVisual(false)

                        sideToggle.MouseButton1Click:Connect(function()
                            toggleState = not toggleState
                            window.Flags[name .. "_Toggle"] = toggleState
                            updateToggleVisual(true)
                            pcall(function() toggleCallback(toggleState) end)
                        end)
                    else
                        sideToggle.Visible = false
                    end
                end

                local tboxObj = {
                    Set = function(self, val)
                        if val == nil then val = self end
                        applyTextVal(val)
                    end,
                    SetValue = function(self, val)
                        if val == nil then val = self end
                        if type(val) == "table" then
                            if val.Value ~= nil then applyTextVal(val.Value) end
                            if val.Enabled ~= nil and sideToggle and hasToggle then
                                toggleState = not not val.Enabled
                                window.Flags[name .. "_Toggle"] = toggleState
                                updateToggleVisual(true)
                                pcall(function() toggleCallback(toggleState) end)
                            end
                        else
                            applyTextVal(val)
                        end
                    end,
                    Get = function(...)
                        return (inputBox and inputBox.Text) or currentVal
                    end,
                    SetToggle = function(self, s)
                        if s == nil then s = self end
                        if not sideToggle or not hasToggle then return end
                        toggleState = not not s
                        window.Flags[name .. "_Toggle"] = toggleState
                        updateToggleVisual(true)
                        pcall(function() toggleCallback(toggleState) end)
                    end,
                    GetToggle = function()
                        return toggleState
                    end,
                    Instance = tboxInst,
                }
                window.Elements[name] = tboxObj

                if hasToggle and sideToggle then
                    local sideToggleObj = {
                        Set = function(self, s)
                            if s == nil then s = self end
                            tboxObj.SetToggle(s)
                        end,
                        SetValue = function(self, s)
                            if s == nil then s = self end
                            tboxObj.SetToggle(s)
                        end,
                        Get = function(...)
                            return toggleState
                        end,
                    }
                    window.Elements[name .. "_Toggle"] = sideToggleObj
                end

                return tboxObj
            end

            -- Add Webhook
            function targetTable:AddWebhook(webhookConfig)
                local parentBody = resolveContainer()
                webhookConfig = webhookConfig or {}
                local name = webhookConfig.Name or "Webhook URL"
                local defaultVal = webhookConfig.Default or webhookConfig.Url or ""
                local placeholder = webhookConfig.Placeholder or "https://discord.com"
                local callback = webhookConfig.Callback or function() end
                local hasToggle = (webhookConfig.HasToggle ~= false)
                local toggleDefault = webhookConfig.ToggleDefault or webhookConfig.Enabled or false
                local toggleCallback = webhookConfig.ToggleCallback or function() end

                local webhookInst = templateWebhook:Clone()
                webhookInst.Name = "Webhook_" .. name
                webhookInst.Visible = true
                webhookInst.Parent = parentBody

                local titleLabel = webhookInst:FindFirstChild("TitleText", true) or webhookInst:FindFirstChildOfClass("TextLabel")
                if titleLabel then
                    titleLabel.Text = name
                end

                local inputBox = webhookInst:FindFirstChild("InputBox", true)
                local sideToggle = webhookInst:FindFirstChild("Togglebtn", true)
                local indFrame = sideToggle and sideToggle:FindFirstChild("IndikatorFrame", true)

                local currentVal = tostring(defaultVal)
                local toggleState = toggleDefault
                window.Flags[name] = currentVal

                local function applyWebhookUrl(val)
                    currentVal = tostring(val or "")
                    window.Flags[name] = currentVal
                    if inputBox then
                        inputBox.Text = currentVal
                    end
                    pcall(function() callback(currentVal) end)
                end

                if inputBox then
                    inputBox.Text = currentVal
                    inputBox.PlaceholderText = placeholder

                    inputBox.FocusLost:Connect(function(enterPressed)
                        currentVal = inputBox.Text
                        window.Flags[name] = currentVal
                        pcall(function() callback(currentVal) end)
                    end)
                end

                -- Toggle Switch
                local function updateToggleVisual(anim)
                    if not indFrame then return end
                    local targetPos = toggleState and UDim2.new(0.57, 0, 0.097, 0) or UDim2.new(0.07, 0, 0.097, 0)
                    local grad = indFrame:FindFirstChildOfClass("UIGradient")
                    if anim then
                        TweenService:Create(indFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Position = targetPos
                        }):Play()
                    else
                        indFrame.Position = targetPos
                    end
                    if grad then
                        if toggleState then
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(212, 255, 0)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 8))
                            })
                        else
                            grad.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 150)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))
                            })
                        end
                    end
                end

                if sideToggle then
                    if hasToggle then
                        sideToggle.Visible = true
                        window.Flags[name .. "_Toggle"] = toggleState
                        updateToggleVisual(false)

                        sideToggle.MouseButton1Click:Connect(function()
                            toggleState = not toggleState
                            window.Flags[name .. "_Toggle"] = toggleState
                            updateToggleVisual(true)
                            pcall(function() toggleCallback(toggleState) end)
                        end)
                    else
                        sideToggle.Visible = false
                        if inputBox then
                            inputBox.Size = UDim2.new(0, 354, 0, 30)
                        end
                    end
                end

                local webhookObj = {
                    Set = function(self, val)
                        if val == nil then val = self end
                        applyWebhookUrl(val)
                    end,
                    SetValue = function(self, val)
                        if val == nil then val = self end
                        if type(val) == "table" then
                            if val.Url ~= nil then applyWebhookUrl(val.Url) end
                            if val.Enabled ~= nil and sideToggle and hasToggle then
                                toggleState = not not val.Enabled
                                window.Flags[name .. "_Toggle"] = toggleState
                                updateToggleVisual(true)
                                pcall(function() toggleCallback(toggleState) end)
                            end
                        else
                            applyWebhookUrl(val)
                        end
                    end,
                    Get = function(...)
                        return (inputBox and inputBox.Text) or currentVal
                    end,
                    SetToggle = function(self, s)
                        if s == nil then s = self end
                        if not sideToggle or not hasToggle then return end
                        toggleState = not not s
                        window.Flags[name .. "_Toggle"] = toggleState
                        updateToggleVisual(true)
                        pcall(function() toggleCallback(toggleState) end)
                    end,
                    GetToggle = function()
                        return toggleState
                    end,
                    Instance = webhookInst,
                }
                window.Elements[name] = webhookObj

                if hasToggle and sideToggle then
                    local sideToggleObj = {
                        Set = function(self, s)
                            if s == nil then s = self end
                            webhookObj.SetToggle(s)
                        end,
                        SetValue = function(self, s)
                            if s == nil then s = self end
                            webhookObj.SetToggle(s)
                        end,
                        Get = function(...)
                            return toggleState
                        end,
                    }
                    window.Elements[name .. "_Toggle"] = sideToggleObj
                end

                return webhookObj
            end

            -- Add Button
            function targetTable:AddButton(btnConfig)
                local parentBody = resolveContainer()
                btnConfig = btnConfig or {}
                local name = btnConfig.Name or "Button"
                local btnText = btnConfig.ButtonText or btnConfig.Text or "Click"
                local btnIcon = btnConfig.Icon
                local callback = btnConfig.Callback or function() end

                local btnInst = templateToggle:Clone()
                btnInst.Name = "Button_" .. name
                btnInst.Visible = true
                btnInst.Parent = parentBody

                local titleLabel = btnInst:FindFirstChild("TitleText", true)
                if titleLabel then
                    titleLabel.Text = name
                end

                local toggleBtn = btnInst:FindFirstChild("Togglebtn", true)
                if toggleBtn then toggleBtn:Destroy() end

                local keybindBox = btnInst:FindFirstChild("Keybind", true)
                if keybindBox then keybindBox:Destroy() end

                local actionBtn = nil
                if btnIcon then
                    actionBtn = templateButtonIcon:Clone()
                    actionBtn.Name = "ActionBtn"
                    actionBtn.Parent = btnInst
                    local iconImg = actionBtn:FindFirstChild("IconImage", true)
                    if iconImg then
                        iconImg.Image = tostring(btnIcon)
                    end
                else
                    actionBtn = templateButtonText:Clone()
                    actionBtn.Name = "ActionBtn"
                    actionBtn.Parent = btnInst
                    local textLbl = actionBtn:FindFirstChild("TitleText", true)
                    if textLbl then
                        textLbl.Text = tostring(btnText)
                    end
                end

                local baseSize = actionBtn.Size
                actionBtn.MouseButton1Click:Connect(function()
                    TweenService:Create(actionBtn, TweenInfo.new(0.08), { Size = UDim2.new(baseSize.X.Scale, baseSize.X.Offset - 4, baseSize.Y.Scale, baseSize.Y.Offset - 2) }):Play()
                    task.delay(0.08, function()
                        TweenService:Create(actionBtn, TweenInfo.new(0.08), { Size = baseSize }):Play()
                    end)
                    callback()
                end)

                local btnObj = {
                    SetText = function(text)
                        local textLbl = actionBtn:FindFirstChild("TitleText", true)
                        if textLbl then
                            textLbl.Text = tostring(text)
                        end
                    end,
                    SetIcon = function(icon)
                        local iconImg = actionBtn:FindFirstChild("IconImage", true)
                        if iconImg then
                            iconImg.Image = tostring(icon)
                        end
                    end,
                    SetCallback = function(fn)
                        callback = fn
                    end,
                    Instance = btnInst,
                    Button = actionBtn,
                }
                setmetatable(btnObj, {
                    __index = function(t, k)
                        local s, v = pcall(function() return btnInst[k] end)
                        if s then return v end
                        return nil
                    end,
                    __newindex = function(t, k, v)
                        local s = pcall(function() btnInst[k] = v end)
                        if not s then rawset(t, k, v) end
                    end
                })
                return btnObj
            end

        end

        function tabObj:CreateSection(secConfig)
            secConfig = secConfig or {}
            local secName = secConfig.Name or "Section"
            local targetScroll = tabScroll or mainScroll
            local secHeader = templateSectionHeader:Clone()
            secHeader.Name = "SectionHeader_" .. secName
            secHeader.Visible = true
            secHeader.Parent = targetScroll

            local secTitle = secHeader:FindFirstChild("MainTitle", true)
            if secTitle then
                secTitle.Text = secName
            end

            local arrowIcon = secHeader:FindFirstChild("ArrowIcon", true)
            local searchBox = secHeader:FindFirstChild("Searchbox", true)
            local secBody = templateSectionBody:Clone()
            secBody.Name = "SectionBody_" .. secName
            secBody.Visible = true
            secBody.Size = UDim2.new(0, 536, 0, 0)
            secBody.AutomaticSize = E_AS_Y
            secBody.Parent = targetScroll

            for _, child in ipairs(secBody:GetChildren()) do
                if child:IsA("GuiObject") and not child:IsA("UIPadding") and not child:IsA("UIListLayout") and not child:IsA("UICorner") and not child:IsA("UIStroke") then
                    child:Destroy()
                end
            end

            local isOpen = true
            if arrowIcon then
                arrowIcon.Rotation = 90
            end
            local headerBtn = secHeader:FindFirstChildOfClass("ImageButton") or secHeader
            headerBtn.MouseButton1Click:Connect(function()
                window:CloseActiveDropdown()
                isOpen = not isOpen
                secBody.Visible = isOpen
                if arrowIcon then
                    TweenService:Create(arrowIcon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Rotation = isOpen and 90 or 0
                    }):Play()
                end
            end)

            -- Searchbox
            if searchBox then
                searchBox:GetPropertyChangedSignal("Text"):Connect(function()
                    local query = string.lower(searchBox.Text)
                    for _, widget in ipairs(secBody:GetChildren()) do
                        if widget:IsA("GuiObject") and not widget:IsA("UIPadding") and not widget:IsA("UIListLayout") and not widget:IsA("UIStroke") and not widget:IsA("UICorner") then
                            if query == "" then
                                widget.Visible = true
                            else
                                local wTitle = widget:FindFirstChild("TitleText", true) or widget:FindFirstChild("Title", true)
                                local txt = wTitle and string.lower(wTitle.Text) or string.lower(widget.Name)
                                widget.Visible = string.find(txt, query, 1, true) ~= nil
                            end
                        end
                    end
                end)
            end

            local secObj = {
                Header = secHeader,
                Body = secBody,
            }

            attachWidgetMethods(secObj, secBody)

            table.insert(tabObj.Sections, secObj)
            return secObj
        end

        -- Direct container
        local function getDirectBody()
            if not tabObj._directBody then
                local directBody = templateSectionBody:Clone()
                directBody.Name = "DirectBody_" .. tabName
                directBody.Visible = true
                directBody.Size = UDim2.new(0, 536, 0, 0)
                directBody.AutomaticSize = E_AS_Y
                directBody.Parent = tabScroll or (tabName == "Settings" and settingScroll) or mainScroll

                for _, child in ipairs(directBody:GetChildren()) do
                    if child:IsA("GuiObject") and not child:IsA("UIPadding") and not child:IsA("UIListLayout") and not child:IsA("UICorner") and not child:IsA("UIStroke") then
                        child:Destroy()
                    end
                end

                tabObj._directBody = directBody
            end
            return tabObj._directBody
        end

        attachWidgetMethods(tabObj, getDirectBody)

        return tabObj
    end

    -- Initialize tab
    if not keySystem then
        window:SelectTab(defaultTab)
    end

    return window
end

return SyshubLib