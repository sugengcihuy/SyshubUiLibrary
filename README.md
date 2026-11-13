## Syshub Ui Library

**By Sugeng**

## Example Testing
```
loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SyshubUiLibrary/refs/heads/master/ExampleTest.lua"))()
```

## Fitur Unggulan
- **Performance Monitor:** Built-in FPS & Ping HUD interaktif di tengah atas layar dengan dynamic coloring (hijau, kuning, merah) dan toggle keybind.
- **Multi-Select Dropdown:** Mendukung pemilihan banyak opsi sekaligus (`Multi = true`) dengan dot indikator hijau/putih dan elipsis rapi (`TextTruncate`).
- **Dropdown Searchbox:** Pencarian opsi dropdown secara real-time (`Search = true`).
- **Section Searchbox:** Filter widget interaktif langsung pada header section (`Search = true`).
- **Smart Config System:** Auto-save dan auto-load seluruh konfigurasi toggle, slider, dropdown (single & multi), textbox, webhook, dan keybind.
- **Side Toggle Support:** TextBox dan Webhook mendukung switch toggle samping (`HasToggle = true`).

---

## Contoh Penggunaan

```lua
-- Load Library
local SyshubLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/sugengcihuy/SyshubUiLibrary/master/SyshubLib.lua"))()

-- Window Init
local win = SyshubLib:CreateWindow({
    Title = "Syshub Hub v3",
    KeySystem = true,
    Key = "syshub",
    DefaultTab = "About",
    ToggleKey = Enum.KeyCode.Zero,

    -- FPS Callback
    OnFpsBoost = function(state)
        print("FPS Boost:", state)
    end,

    -- About Info
    About = {
        Description = "Syshub Ui Library by Sugeng",
        Discord = "discord.gg/syshub",
        TikTok = "@syshub.official",
        Website = "syshub.net",
        WhatsApp = "+62 812-3456-7890"
    }
})

-- Tab One
local tab1 = win:CreateTab({
    Name = "Farming",
    Icon = SyshubLib.Icons.Tabs.StealAnEgg
})

-- Section Search
local sec1 = tab1:CreateSection({
    Name = "Automation",
    Search = true
})

-- Toggle Keybind
local myToggle = sec1:AddToggle({
    Name = "Auto Farm",
    Default = false,
    Keybind = Enum.KeyCode.E,
    Callback = function(state)
        print("Auto Farm:", state)
    end
})

-- Keybind Init
sec1:AddKeybind({
    Name = "Teleport Base",
    Default = Enum.KeyCode.T,
    Callback = function(key)
        print("Key pressed:", key.Name)
    end
})

-- Slider Init
local mySlider = sec1:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 200,
    Default = 64,
    Callback = function(val)
        print("WalkSpeed:", val)
    end
})

-- Slider Toggle
local mySdTg = sec1:AddSliderToggle({
    Name = "Auto Jump",
    Min = 10,
    Max = 150,
    SliderDefault = 50,
    ToggleDefault = false,
    SliderCallback = function(v) print("Jump Power:", v) end,
    ToggleCallback = function(s) print("Jump Toggle:", s) end
})

-- Single Dropdown
local myDrop = sec1:AddDropdown({
    Name = "Target Island",
    Options = {"Skypiea", "Marineford", "Dressrosa", "Wano"},
    Default = "Skypiea",
    Search = false,
    Callback = function(selected)
        print("Island:", selected)
    end
})

-- Multi Dropdown
local multiDrop = sec1:AddDropdown({
    Name = "Target Mobs",
    Options = {"Bandit", "Monkey", "Gorilla", "Pirate", "Boss"},
    Default = {"Bandit", "Boss"},
    Multi = true,
    Search = true,
    Callback = function(selectedList)
        print("Mobs selected:", table.concat(selectedList, ", "))
    end
})

-- Textbox Toggle
local myBox = sec1:AddTextBox({
    Name = "Buy Count",
    Default = "1",
    Placeholder = "Jumlah...",
    HasToggle = true,
    ToggleDefault = false,
    Callback = function(val)
        print("Count:", val)
    end,
    ToggleCallback = function(state)
        print("Auto Buy:", state)
    end
})

-- Webhook Toggle
local myWebhook = sec1:AddWebhook({
    Name = "Discord Webhook",
    Default = "",
    Placeholder = "https://discord.com/api/webhooks/...",
    HasToggle = true,
    ToggleDefault = false,
    Callback = function(url)
        print("Webhook URL:", url)
    end,
    ToggleCallback = function(state)
        print("Webhook Active:", state)
    end
})

-- Action Button
sec1:AddButton({
    Name = "Execute Script",
    ButtonText = "Run",
    Callback = function()
        print("Script executed!")
    end
})

-- Icon Button
sec1:AddButton({
    Name = "Send Alert",
    Icon = SyshubLib.Icons.Assets.PaperPlane,
    Callback = function()
        print("Alert sent via Webhook:", myWebhook:Get())
    end
})

-- Tab Two
local tab2 = win:CreateTab({
    Name = "Mining",
    Icon = SyshubLib.Icons.Tabs.PickAxe
})

-- Section Two
local sec2 = tab2:CreateSection({
    Name = "Ores Area",
    Search = false
})

sec2:AddToggle({
    Name = "Fast Mine",
    Default = false
})

sec2:AddDropdown({
    Name = "Pickaxe Type",
    Options = {"Wooden", "Iron", "Diamond", "Netherite"},
    Default = "Wooden"
})

-- Settings Tab
local tabSettings = win:CreateTab({
    Name = "Settings",
    Icon = SyshubLib.Icons.Tabs.Settings
})

tabSettings:AddToggle({
    Name = "Auto Reconnect",
    Default = true
})

-- About Tab
local tabAbout = win:CreateTab({
    Name = "About",
    Icon = SyshubLib.Icons.Tabs.About
})
```

---

## Fitur Default Settings
Setiap jendela GUI secara otomatis memiliki fitur internal berikut tanpa perlu instalasi tambahan:
- **Performance Monitor:** Toggle HUD Ping & FPS di layar dengan shortcut keybind.
- **FPS Boost:** Memangkas partikel dan grafis berat Roblox agar game lancar.
- **Save & Load Config:** Simpan dan muat seluruh profil konfigurasi UI ke disk executor.
- **Menu Keybind:** Shortcut keyboard untuk menyembunyikan dan menampilkan jendela UI (default: `RightControl`).
- **Unload UI:** Membersihkan seluruh instance dan thread library secara aman.

---

## Validasi Key Kustom

```lua
local win = SyshubLib:CreateWindow({
    Title = "Syshub Hub v3",
    KeySystem = true,
    KeyValidator = function(inputKey)
        local onlineKey = game:HttpGet("https://raw.githubusercontent.com/.../keys.txt")
        return string.find(onlineKey, inputKey) ~= nil
    end
})
```
