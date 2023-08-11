local ui = require("ui")
local cm = require("ecluart.cm")

local app_settings = {
  ["name_textalign"] = "center",
  ["name_fgcolor"] = 0x4060A0
}

local winMain = ui.Window("RegistrationForm", "fixed", 400, 400)
local comMain = cm.ConfigurationManager(app_settings)

local etyName = ui.Entry(winMain, "King", 100, 20, 180)
local etyPassword = ui.Entry(winMain, "", 100, 52, 180)
local etyAge = ui.Entry(winMain, "", 100, 84, 40)
local etyEmail = ui.Entry(winMain, "", 100, 116, 180)
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80)

local lblName = ui.Label(winMain, "Name:", 10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153)

local btnApply = ui.Button(winMain, "Apply Configuartion", 10, 210, 380)

local lblTextalign = ui.Label(winMain, "Textalign setting for Name Entry:", 10, 255)
local cbbTextalign = ui.Combobox(winMain, { "left", "center", "right" }, 190, 250, 80)

comMain:add(etyName, "textalign", "name_textalign")
comMain:add(lblName, "fgcolor", "name_fgcolor")

cbbTextalign.text = comMain.collection["name_textalign"]

function btnApply:onClick()
  comMain:apply()
end

function cbbTextalign:onSelect(item)
  comMain.collection["name_textalign"] = item.text
end

winMain:show()

repeat
  ui.update()
until not winMain.visible
