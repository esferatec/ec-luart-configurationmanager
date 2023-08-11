# Example

```Lua
local ui = require("ui") -- Import the "ui" module
local cm = require("ecluart.cm") -- Import the "ecluart.cm" module

local app_settings = {
  ["name_textalign"] = "center", -- Set the default text alignment for the name field to "center"
  ["name_fgcolor"] = 0x4060A0 -- Set the default foreground color for the name field to a hexadecimal value
}

local winMain = ui.Window("RegistrationForm", "fixed", 400, 400) -- Create a new window with the title "RegistrationForm" and fixed dimensions of 400x400 pixels
local comMain = cm.ConfigurationManager(app_settings) -- Create a new instance of the ConfigurationManager class with the app_settings table

local etyName = ui.Entry(winMain, "King", 100, 20, 180) -- Create a new text entry field with the initial value "King" at position (100, 20) and width 180
local etyPassword = ui.Entry(winMain, "", 100, 52, 180) -- Create a new text entry field with an empty initial value at position (100, 52) and width 180
local etyAge = ui.Entry(winMain, "", 100, 84, 40) -- Create a new text entry field with an empty initial value at position (100, 84) and width 40
local etyEmail = ui.Entry(winMain, "", 100, 116, 180) -- Create a new text entry field with an empty initial value at position (100, 116) and width 180
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80) -- Create a new combobox with the options "Item 1", "Item 2", and "Item 3" at position (100, 148) and width 80

local lblName = ui.Label(winMain, "Name:", 10, 25) -- Create a new label with the text "Name:" at position (10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57) -- Create a new label with the text "Password:" at position (10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89) -- Create a new label with the text "Age:" at position (10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121) -- Create a new label with the text "Email:" at position (10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153) -- Create a new label with the text "Country:" at position (10, 153)

local btnApply = ui.Button(winMain, "Apply Configuration", 10, 210, 380) -- Create a new button with the text "Apply Configuration" at position (10, 210) and width 380

local lblTextalign = ui.Label(winMain, "Textalign setting for Name Entry:", 10, 255) -- Create a new label with the text "Textalign setting for Name Entry:" at position (10, 255)
local cbbTextalign = ui.Combobox(winMain, { "left", "center", "right" }, 190, 250, 80) -- Create a new combobox with the options "left", "center", and "right" at position (190, 250) and width 80

comMain:add(etyName, "textalign", "name_textalign") -- Add the etyName text entry field to the ConfigurationManager with the property "textalign" and key "name_textalign"
comMain:add(lblName, "fgcolor", "name_fgcolor") -- Add the lblName label to the ConfigurationManager with the property "fgcolor" and key "name_fgcolor"

cbbTextalign.text = comMain.collection["name_textalign"] -- Set the text of the cbbTextalign combobox to the value of the "name_textalign" key in the ConfigurationManager's collection

function btnApply:onClick() -- Define a function to be called when the btnApply button is clicked
  comMain:apply() -- Call the apply method of the ConfigurationManager to apply the configuration changes
end

function cbbTextalign:onSelect(item) -- Define a function to be called when an item in the cbbTextalign combobox is selected
  comMain.collection["name_textalign"] = item.text -- Update the value of the "name_textalign" key in the ConfigurationManager's collection with the selected item's text
end

winMain:show() -- Show the main window

repeat
  ui.update() -- Update the UI
until not winMain.visible -- Repeat until the main window is no longer visible
```
