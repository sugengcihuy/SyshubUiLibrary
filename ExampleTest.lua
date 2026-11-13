-- Example Test
local SyshubLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SyshubUiLibrary/master/SyshubLib.lua"))()
-- Window Init
local win = SyshubLib:CreateWindow({
    Title = "Syshub Hub v3",
    KeySystem = true,         -- Key System
    Key = "syshub",           -- Password Auth
    DefaultTab = "About",     -- First Tab
    ToggleKey = Enum.KeyCode.Zero, -- Toggle Keybind

    -- FPS Callback
    OnFpsBoost = function(state)
        print("[Syshub] FPS Boost:", state)
    end,

    -- About Info
    About = {
        Description = "Syshub Ui Library by Sugeng",
        Discord = "discord.gg/syshub",
        TikTok = "@syshub.official",
        Website = "syshub.net",
        WhatsApp = "+62 812-3456-7890",
        Copyright = "2026 Syshub Hub by Sugeng. All rights reserved."
    }
})

-- Tab One
local tab1 = win:CreateTab({
    Name = "Steal An Egg",
    Icon = SyshubLib.Icons.Tabs.StealAnEgg
})

-- Section One
local sec1 = tab1:CreateSection({ Name = "Main Fiture", Search = true })

-- Toggle Keybind
sec1:AddToggle({
    Name = "Auto Steal",
    Default = false,
    Keybind = Enum.KeyCode.E,
    Callback = function(state)
        print("[Syshub] Auto Steal:", state)
    end
})

-- Keybind Init
sec1:AddKeybind({
    Name = "Teleport Base Key",
    Default = Enum.KeyCode.T,
    Callback = function(key)
        print("[Syshub] Teleport key:", key.Name)
    end
})

-- Slider Init
sec1:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 64,
    Callback = function(val)
        print("[Syshub] WalkSpeed:", val)
    end
})

-- Slider Toggle
sec1:AddSliderToggle({
    Name = "Auto Jump",
    Min = 10,
    Max = 150,
    SliderDefault = 50,
    ToggleDefault = false,
    SliderCallback = function(v) print("[Syshub] Jump Power:", v) end,
    ToggleCallback = function(s) print("[Syshub] Jump Toggle:", s) end
})

-- Single Dropdown
sec1:AddDropdown({
    Name = "Pilih Telur",
    Options = {"Egg Common", "Egg Rare", "Egg Legendary", "Egg Mythic"},
    Default = "Egg Common",
    Search = false,
    Callback = function(selected)
        print("[Syshub] Telur dipilih:", selected)
    end
})

-- Multi Dropdown
sec1:AddDropdown({
    Name = "Target Mobs",
    Options = {"Bandit", "Monkey", "Gorilla", "Pirate", "Boss", "Dragon"},
    Default = {"Bandit", "Boss"},
    Multi = true,
    Search = true,
    Callback = function(selected)
        print("[Syshub] Target Mobs:", table.concat(selected, ", "))
    end
})

-- Textbox Toggle
sec1:AddTextBox({
    Name = "Buy Count",
    Default = "1",
    Placeholder = "Jumlah...",
    HasToggle = true,
    ToggleDefault = false,
    Callback = function(val)
        print("[Syshub] Jumlah beli:", val)
    end,
    ToggleCallback = function(state)
        print("[Syshub] Auto Buy Toggle:", state)
    end
})

-- Textbox Normal
sec1:AddTextBox({
    Name = "Delay Seconds",
    Default = "5",
    Placeholder = "Detik...",
    HasToggle = false,
    Callback = function(val)
        print("[Syshub] Delay:", val)
    end
})

-- Action Button
sec1:AddButton({
    Name = "Claim Rewards",
    Callback = function()
        print("[Syshub] Reward Claimed!")
    end
})

-- Section Two
local sec1_misc = tab1:CreateSection({ Name = "Misc Player" })

sec1_misc:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(v)
        print("[Syshub] Infinite Jump:", v)
    end
})

sec1_misc:AddSlider({
    Name = "Camera FOV",
    Min = 70,
    Max = 120,
    Default = 70,
    Callback = function(v)
        print("[Syshub] FOV:", v)
    end
})

sec1_misc:AddButton({
    Name = "Respawn Character",
    Callback = function()
        print("[Syshub] Respawn clicked")
    end
})

-- Tab Two
local tab2 = win:CreateTab({
    Name = "PickAxe",
    Icon = SyshubLib.Icons.Tabs.PickAxe
})

local sec2 = tab2:CreateSection({ Name = "Mining Automation" })
sec2:AddToggle({
    Name = "Fast Mine",
    Default = false,
    Keybind = Enum.KeyCode.F,
    Callback = function(v) print("[Syshub] Fast Mine:", v) end
})
sec2:AddSlider({
    Name = "Mining Distance",
    Min = 5,
    Max = 50,
    Default = 20,
    Callback = function(v) print("[Syshub] Mining Distance:", v) end
})
sec2:AddDropdown({
    Name = "PickAxe Type",
    Options = {"Wooden", "Iron", "Diamond", "Netherite"},
    Default = "Wooden",
    Callback = function(p) print("[Syshub] Pickaxe dipilih:", p) end
})

-- Tab Three
local tab3 = win:CreateTab({
    Name = "Batu",
    Icon = SyshubLib.Icons.Tabs.Batu
})

local sec3 = tab3:CreateSection({ Name = "Ore Crushing" })
sec3:AddToggle({ Name = "Auto Break Rocks", Default = false })
sec3:AddButton({ Name = "Sell All Ores", Callback = function() print("[Syshub] Ores sold!") end })

-- Settings Tab
local tabSettings = win:CreateTab({
    Name = "Settings",
    Icon = SyshubLib.Icons.Tabs.Settings
})

tabSettings:AddToggle({
    Name = "Auto Reconnect",
    Default = true,
    Callback = function(state)
        print("[Syshub] Auto Reconnect:", state)
    end
})

tabSettings:AddToggle({
    Name = "Disable Shadows",
    Default = false,
    Callback = function(state)
        print("[Syshub] Shadows:", state)
    end
})

tabSettings:AddSlider({
    Name = "Menu Transparency",
    Min = 0,
    Max = 100,
    Default = 0,
    Callback = function(val)
        print("[Syshub] Transparency:", val)
    end
})

tabSettings:AddDropdown({
    Name = "Server Region",
    Options = {"Singapore", "Tokyo", "Frankfurt", "United States"},
    Default = "Singapore",
    Callback = function(region)
        print("[Syshub] Region selected:", region)
    end
})

tabSettings:AddKeybind({
    Name = "Panic Key",
    Default = Enum.KeyCode.P,
    Callback = function(key)
        print("[Syshub] Panic key pressed:", key.Name)
    end
})

local webhookWidget = tabSettings:AddWebhook({
    Name = "Discord Webhook",
    Default = "",
    Placeholder = "https://discord.com/api/webhooks/...",
    HasToggle = true,
    ToggleDefault = false,
    Callback = function(url)
        print("[Syshub] Webhook set:", url)
    end,
    ToggleCallback = function(state)
        print("[Syshub] Webhook active:", state)
    end
})

tabSettings:AddButton({
    Name = "Send Test Alert",
    ButtonText = "Send",
    Callback = function()
        print("[Syshub] Test alert sent to:", webhookWidget:Get())
    end
})

tabSettings:AddButton({
    Name = "Dispatch Report",
    Icon = SyshubLib.Icons.Assets.PaperPlane,
    Callback = function()
        print("[Syshub] Dispatching report via PaperPlane icon button!")
    end
})

tabSettings:AddButton({
    Name = "Unload UI",
    ButtonText = "Unload",
    Callback = function()
        if win.Root then
            win.Root:Destroy()
            print("[Syshub] UI destroyed successfully")
        end
    end
})

-- About Tab
local tabAbout = win:CreateTab({
    Name = "About",
    Icon = SyshubLib.Icons.Tabs.About
})

print("[Syshub] UI Library loaded")