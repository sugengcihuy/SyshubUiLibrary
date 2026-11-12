## Syshub Ui Library

**By Sugeng**

## Example Testing
```
loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SyshubUiLibrary/refs/heads/master/ExampleTest.lua"))()
```

## Contoh Penggunaan

```lua
-- Load
local SyshubLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SyshubUiLibrary/master/SyshubLib.lua"))()

-- Buat Window
local win = SyshubLib:CreateWindow({
    Title = "Syshub Hub",
    KeySystem = true, -- True / falsee
    Key = "syshub",  -- key yang valid 
    DefaultTab = "About", -- Tab yang pertama kali terbuka
    ToggleKey = Enum.KeyCode.Zero, -- keybind minimize

    -- Callback Boost Fps
    OnFpsBoost = function(state)
        print("FPS Boost:", state)
    end,

    -- Isi About
    About = {
        Description = "Syshub Ui Library by Sugeng",
        Discord = "discord.gg/syshub",
        TikTok = "@syshub.official",
        Website = "syshub.net",
        WhatsApp = "+62 812-3456-7890"
    }
})

-- Buat Tab1
local tab1 = win:CreateTab({
    Name = "Side 1",
    Icon = SyshubLib.Icons.Tabs.StealAnEgg
})

-- Section 1 di Side 1
local sec1 = tab1:CreateSection({
    Name = "Mode Slebew"
})

-- Toggle
local myToggle = sec1:AddToggle({
    Name = "Auto",
    Default = false,
    Callback = function(state)
        print("Auto:", state)
    end
})

-- Slider
local mySlider = sec1:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 64,
    Callback = function(val)
        print("WalkSpeed:", val)
    end
})

-- Slider + Toggle
local mySdTg = sec1:AddSliderToggle({
    Name = "Auto Jump",
    Min = 10,
    Max = 150,
    SliderDefault = 50,
    ToggleDefault = false,
    SliderCallback = function(v) print("Jump Power:", v) end,
    ToggleCallback = function(s) print("Jump Toggle:", s) end
})

-- Dropdown
local myDrop = sec1:AddDropdown({
    Name = "Option",
    Options = {"Epic", "Rare", "Legendary", "Mythic", "Common"},
    Default = "Common",
    Callback = function(selected)
        print("dipilih:", selected)
    end
})

-- TextBox with + / - button
local myBox = sec1:AddTextBox({
    Name = "Count",
    Default = "1",
    Placeholder = "Jumlah...",
    Callback = function(val)
        print("Count:", val)
    end
})

-- Button
sec1:AddButton({
    Name = "Button",
    Callback = function()
        print("Button clicked!")
    end
})

-- Section 2 di Side 1
local sec2 = tab1:CreateSection({
    Name = "Misc Player"
})

sec2:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(state)
        print("Infinite Jump:", state)
    end
})

sec2:AddSlider({
    Name = "Camera FOV",
    Min = 70,
    Max = 120,
    Default = 70,
    Callback = function(val)
        print("FOV:", val)
    end
})

-- Buat Tab 2
local tab2 = win:CreateTab({
    Name = "Side 2",
    Icon = SyshubLib.Icons.Tabs.PickAxe
})

local secSide2 = tab2:CreateSection({
    Name = "Mining Area"
})

secSide2:AddToggle({
    Name = "Fast Mine",
    Default = false
})

secSide2:AddDropdown({
    Name = "Pickaxe",
    Options = {"Wooden", "Iron", "Diamond"},
    Default = "Wooden"
})

-- Buat Tab 3: Settings
local tabSettings = win:CreateTab({
    Name = "Settings",
    Icon = SyshubLib.Icons.Tabs.Settings
})

tabSettings:AddToggle({
    Name = "Auto Reconnect",
    Default = true
})

tabSettings:AddSlider({
    Name = "Menu Transparency",
    Min = 0,
    Max = 100,
    Default = 0
})

-- Buat Tab 4: About
local tabAbout = win:CreateTab({
    Name = "About",
    Icon = SyshubLib.Icons.Tabs.About
})
```

---

## Cara Pakai Key Sendiri

```lua
--Custom Key Validation
local win = SyshubLib:CreateWindow({
    Title = "Syshub Hub",
    KeySystem = true,
    KeyValidator = function(inputKey)
        local onlineKey = game:HttpGet("https://raw.githubusercontent.com/.../keys.txt")
        return string.find(onlineKey, inputKey) ~= nil
    end
})
```