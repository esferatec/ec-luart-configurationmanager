# ec-luart-configurationmanager

The project is a configuration management module written in Lua. It defines a ConfigurationManager object that handles configuration of widgets in LuaRT desktop applications.

[![LuaRT 1.9.5](https://badgen.net/badge/LuaRT/1.9.5/blue)](https://github.com/samyeyo/LuaRT)

## Features

The project provides a modular and flexible way to manage configurations in desktop applications. It allows easy addition of widgets and their corresponding configuration  keys, as well as applying settings to the widgets. Several configuration  managers can be used in one application.

## Installation

1. Create a folder called "ecluart" in your application.
2. Copy the "cm.lua" file into this folder.

```text
[application]
|
|----ecluart
|   |
|   |----cm.lua
|   |----...
|
|----app.wlua
```

## Usage

The configuration manager (cm) can be loaded using the function *require()*:

```lua
local cm = require("ecluart.cm") 
```

## Constructor

```Lua
ConfigurationManager() -> object
```

This function, ConfigurationManager, initializes a new instance of the configuration manager. It takes a table parameter for the settings and returns a new instance of the ConfigurationManager object with the provided settings.

## Property - settings

```Lua
ConfigurationManager.settings (table)
```

The settings property is expected to be a table containing the setting data.

## Method - add

```Lua
ConfigurationManager:add(widget: object, property: string, key: string) -> none
```

This function adds a widget, property, and configuration key to the configuration manager. It takes an object parameter for the widget, a string parameter for the property, and another string parameter for the key. Before adding the child, it checks if the widget is a valid child using the isValidChild function. If any of the parameters are invalid, the function returns early. Otherwise, it creates a new child object with the widget, property, and key, and inserts it into the self.children table.

## Method - apply

```Lua
ConfigurationManager:apply() -> none
```

This function sets the setting value for each widget in the configuration manager. It checks if the self.settings table is empty using the next function. If it is empty, the function returns early. Otherwise, it iterates over each child in the self.children table and retrieves the setting value from the self.settings table using the child's key. If a setting value exists, it sets the widget's property to the setting value.

## Method - setting

```Lua
ConfigurationManager:setting(key: string) -> string
```

This function retrieves the setting value for a given key from the configuration manager. It takes a string parameter for the key. If the key is not a string, it returns an empty string. Otherwise, it retrieves the setting value from the self.settings table using the key. If the setting value does not exist, it returns an empty string; otherwise, it returns the setting value.

## Method - update

```Lua
ConfigurationManager:update(key: string, value: any) -> none
```

The code provided is a function called update in the ConfigurationManager class. This function is responsible for updating the value of a setting based on a given key. The method takes two parameters: key (string) and value (any data type). These parameters represent the key and the new value to be updated.

## Method - save

```Lua
ConfigurationManager:save() -> none
```

This function saves the setting value for each widget in the configuration manager. It iterates over each child in the self.children table and stores the setting value to the self.settings table using the child's property. If a setting value exists, it sets the setting's entry to the setting value.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
