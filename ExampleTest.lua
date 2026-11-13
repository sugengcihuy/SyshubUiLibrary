-- Example Test
local SyshubLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SyshubUiLibrary/master/SyshubLib.lua"))()
-- Buat Window
local win = SyshubLib:CreateWindow({
    Title = "Syshub Hub v3",
    KeySystem = true,         -- Login Key System
    Key = "syshub",           -- Password masuk
    DefaultTab = "About",     -- Tab pertama aktif
    ToggleKey = Enum.KeyCode.Zero, -- Keybind buka tutup UI

    -- Callback FpsBoost
    OnFpsBoost = function(state)
        print("[Syshub] FPS Boost:", state)
    end,

    -- About
    About = {
        Description = "Syshub Ui Library by Sugeng",
        Discord = "discord.gg/syshub",
        TikTok = "@syshub.official",
        Website = "syshub.net",
        WhatsApp = "+62 812-3456-7890",
        Copyright = "2026 Syshub Hub by Sugeng. All rights reserved."
    }
})

-- Buat Tab 1
local tab1 = win:CreateTab({
    Name = "Steal An Egg",
    Icon = SyshubLib.Icons.Tabs.StealAnEgg
})

-- Section 1 di Tab 1
local sec1 = tab1:CreateSection({ Name = "Main Fiture" })

-- Toggle + Keybind
sec1:AddToggle({
    Name = "Auto Steal",
    Default = false,
    Keybind = Enum.KeyCode.E,
    Callback = function(state)
        print("[Syshub] Auto Steal:", state)
    end
})

-- Keybind 
sec1:AddKeybind({
    Name = "Teleport Base Key",
    Default = Enum.KeyCode.T,
    Callback = function(key)
        print("[Syshub] Teleport key:", key.Name)
    end
})

-- Slider
sec1:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 64,
    Callback = function(val)
        print("[Syshub] WalkSpeed:", val)
    end
})

-- Slider + Toggle
sec1:AddSliderToggle({
    Name = "Auto Jump",
    Min = 10,
    Max = 150,
    SliderDefault = 50,
    ToggleDefault = false,
    SliderCallback = function(v) print("[Syshub] Jump Power:", v) end,
    ToggleCallback = function(s) print("[Syshub] Jump Toggle:", s) end
})

-- Dropdown
sec1:AddDropdown({
    Name = "Pilih Telur",
    Options = {"Egg Common", "Egg Rare", "Egg Legendary", "Egg Mythic"},
    Default = "Egg Common",
    Callback = function(selected)
        print("[Syshub] Telur dipilih:", selected)
    end
})

-- TextBox
sec1:AddTextBox({
    Name = "Buy Count",
    Default = "1",
    Placeholder = "Jumlah...",
    Callback = function(val)
        print("[Syshub] Jumlah beli:", val)
    end
})

-- Button
sec1:AddButton({
    Name = "Claim Rewards",
    Callback = function()
        print("[Syshub] Reward Claimed!")
    end
})

-- Section 2 di Tab 1
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

-- Buat Tab 2
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

-- Buat Tab 3
local tab3 = win:CreateTab({
    Name = "Batu",
    Icon = SyshubLib.Icons.Tabs.Batu
})

local sec3 = tab3:CreateSection({ Name = "Ore Crushing" })
sec3:AddToggle({ Name = "Auto Break Rocks", Default = false })
sec3:AddButton({ Name = "Sell All Ores", Callback = function() print("[Syshub] Ores sold!") end })

-- Settings
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
    Callback = function(url)
        print("[Syshub] Webhook set:", url)
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

-- Buat Tab About
local tabAbout = win:CreateTab({
    Name = "About",
    Icon = SyshubLib.Icons.Tabs.About
})

print("[Syshub] UI Library loaded")