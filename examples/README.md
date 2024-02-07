# Example

```Lua
local ui = require("ui") -- Importing the ui module
local cm = require("ecluart.cm") -- Importing the ecluart.cm module

local app_settings = {
  ["name_textalign"] = "center", -- Setting the default text alignment for the name field
  ["name_fgcolor"] = 0x4060A0 -- Setting the default foreground color for the name field
}

local winMain = ui.Window("RegistrationForm", "fixed", 400, 400) -- Creating a new window with the title "RegistrationForm" and fixed dimensions of 400x400 pixels
local comMain = cm.ConfigurationManager(app_settings) -- Creating a new configuration manager object with the app_settings table

local etyName = ui.Entry(winMain, "King", 100, 20, 180) -- Creating a new text entry field with the initial value "King" at position (100, 20) with a width of 180 pixels
local etyPassword = ui.Entry(winMain, "", 100, 52, 180) -- Creating a new text entry field with an empty initial value at position (100, 52) with a width of 180 pixels
local etyAge = ui.Entry(winMain, "", 100, 84, 40) -- Creating a new text entry field with an empty initial value at position (100, 84) with a width of 40 pixels
local etyEmail = ui.Entry(winMain, "", 100, 116, 180) -- Creating a new text entry field with an empty initial value at position (100, 116) with a width of 180 pixels
local cbbCountry = ui.Combobox(winMain, { "Item 1", "Item 2", "Item 3" }, 100, 148, 80) -- Creating a new combobox with the options "Item 1", "Item 2", and "Item 3" at position (100, 148) with a width of 80 pixels

local lblName = ui.Label(winMain, "Name:", 10, 25) -- Creating a new label with the text "Name:" at position (10, 25)
local lblPassword = ui.Label(winMain, "Password:", 10, 57) -- Creating a new label with the text "Password:" at position (10, 57)
local lblAge = ui.Label(winMain, "Age:", 10, 89) -- Creating a new label with the text "Age:" at position (10, 89)
local lblEmail = ui.Label(winMain, "Email:", 10, 121) -- Creating a new label with the text "Email:" at position (10, 121)
local lblCountry = ui.Label(winMain, "Country:", 10, 153) -- Creating a new label with the text "Country:" at position (10, 153)

lblName.textalign = "left" -- Setting the text alignment of the lblName label to "left"
lblPassword.textalign = "left" -- Setting the text alignment of the lblPassword label to "left"
lblAge.textalign = "left" -- Setting the text alignment of the lblAge label to "left"
lblEmail.textalign = "left" -- Setting the text alignment of the lblEmail label to "left"
lblCountry.textalign = "left" -- Setting the text alignment of the lblCountry label to "left"

local btnApply = ui.Button(winMain, "Apply Configuration", 10, 210, 380) -- Creating a new button with the label "Apply Configuration" at position (10, 210) with a width of 380 pixels

local lblTextalign = ui.Label(winMain, "Textalign setting for Name Entry:", 10, 255) -- Creating a new label with the text "Textalign setting for Name Entry:" at position (10, 255)
local cbbTextalign = ui.Combobox(winMain, { "left", "center", "right" }, 190, 250, 80) -- Creating a new combobox with the options "left", "center", and "right" at position (190, 250) with a width of 80 pixels

comMain:add(etyName, "textalign", "name_textalign") -- Adding the etyName text entry field to the configuration manager with the property "textalign" and the key "name_textalign"
comMain:add(lblName, "fgcolor", "name_fgcolor") -- Adding the lblName label to the configuration manager with the property "fgcolor" and the key "name_fgcolor"

comMain.collection = app_settings -- Assigning the app_settings table to the collection property of the configuration manager

cbbTextalign.text = comMain.collection["name_textalign"] -- Setting the text of the cbbTextalign combobox to the value of the "name_textalign" key in the app_settings table

function btnApply:onClick() -- Defining the onClick event handler for the btnApply button
  comMain:apply() -- Applying the configuration changes made through the configuration manager
end

function cbbTextalign:onSelect(item) -- Defining the onSelect event handler for the cbbTextalign combobox
  comMain.collection["name_textalign"] = item.text -- Updating the value of the "name_textalign" key in the app_settings table with the selected item's text
end

winMain:show() -- Displaying the main window

repeat
  ui.update() -- Updating the UI
until not winMain.visible -- Looping until the main window is not visible anymore
```
