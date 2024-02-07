# ec-luart-configurationmanager

The project is a configuration management module written in Lua. It defines a ConfigurationManager object that handles configuration of widgets in LuaRT desktop applications.

![example](/readme.png)

[![Lua 5.4.6](https://badgen.net/badge/Lua/5.4.6/yellow)](https://github.com/lua/lua)
[![LuaRT 1.7.0](https://badgen.net/badge/LuaRT/1.7.0/blue)](https://github.com/samyeyo/LuaRT)
[![LuaCheck 1.1.1](https://badgen.net/badge/LuaCheck/1.1.1/green)](https://github.com/lunarmodules/luacheck)

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

## License

Copyright (c) 2023 by esferatec.
It is open source, released under the MIT License.
See full copyright notice in the LICENSE.md file.
