# ec-luart-configurationmanager

The project is a configuration management module written in Lua. It defines a ConfigurationManager object that handles configuration of widgets in LuaRT desktop applications.

[![LuaRT 2.1.0](https://badgen.net/badge/LuaRT/2.1.0/blue)](https://github.com/samyeyo/LuaRT)

## Features

The project provides a modular and flexible way to manage configurations in desktop applications. It allows easy addition of widgets and their corresponding configuration keys, as well as applying settings to the widgets. Several configuration managers can be used in one application.

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

Initializes a new configuration manager instance.

## Property - settings

```Lua
ConfigurationManager.settings (table)
```

Table containing the setting data.

## Method - add

```Lua
ConfigurationManager:add(widget: object, property: string, key: string, type: function, default: any) -> none
```

Adds a widget, property, setting key, key type and default value.

## Method - load

```Lua
ConfigurationManager:load() -> none
```

Loads the setting value for each widget.

## Method - save

```Lua
ConfigurationManager:save() -> none
```

Saves the setting value for each widget.

## Method - default

```Lua
ConfigurationManager:default() -> none
```

Sets the default value for each widget.

## Method - value

```Lua
ConfigurationManager:value(key: string) -> string
```

Gets the setting value for a key.

## Method - update

```Lua
ConfigurationManager:update(key: string, value: any) -> none
```

Updates the setting value for a key.

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
