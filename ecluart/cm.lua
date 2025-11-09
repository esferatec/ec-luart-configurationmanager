-- Defines a configuration management module.
local cm = {} -- version 2025.11

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local invalidTypes = {
    ["nil"] = true,
    ["boolean"] = true,
    ["number"] = true,
    ["string"] = true,
    ["userdata"] = true,
    ["function"] = true,
    ["thread"] = true
  }

  return not invalidTypes[type(parameter)]
end

-- Checks if the parameter is a string type.
-- isStringType(parameter: any) -> boolean
local function isStringType(parameter)
  return type(parameter) == "string"
end

-- Checks if the paramter is a function type.
-- isFunctionType(parameter: any) -> boolean
local function isFunctionType(parameter)
  return type(parameter) == "function"
end

-- Checks if the parameter is a nil type.
-- isNilType(parameter: any) -> boolean
local function isNilType(parameter)
  return type(parameter) == "nil"
end

-- Defines the configuration manager object.
local ConfigurationManager = Object({})

-- Creates the configuration manager constructor.
function ConfigurationManager:constructor()
  self.setting = {}
  self.children = {}
end

-- Adds a widget, widget property, setting key, key converter and default value.
-- add(widget: object, property: string, key: string, converter: function, default: any) -> none
function ConfigurationManager:add(widget, property, key, converter, default)
  if not isValidChild(widget) then return end
  if not isStringType(property) then return end
  if not isStringType(key) then return end
  if not isNilType(converter) and not isFunctionType(converter) then return end
  if not isStringType(default) then return end
  if property == "" then return end
  if key == "" then return end

  local newChild = {
    widget = widget,
    property = property,
    key = key,
    converter = converter,
    default = default
  }

  table.insert(self.children, newChild)
end

-- Loads the setting value for each widget.
-- load() -> none
function ConfigurationManager:load()
  for _, child in ipairs(self.children) do
    local settingValue = self.setting[child.key]
    child.widget[child.property] = settingValue
  end
end

-- Saves the setting value for each widget.
-- save() -> none
function ConfigurationManager:save()
  for _, child in ipairs(self.children) do
    local widgetValue = child.widget[child.property]
    self.setting[child.key] = child.converter and child.converter(widgetValue) or widgetValue
  end
end

-- Sets the default value for each widget.
-- default() -> none
function ConfigurationManager:default()
  for _, child in ipairs(self.children) do
    child.widget[child.property] = child.default
  end
end

-- Gets the setting value for a key.
-- value(key: string) -> string
function ConfigurationManager:value(key)
  if not isStringType(key) then return end
  if key == "" then return end
  return self.setting[key] or nil
end

-- Updates the setting value for a key.
-- update(key: string, value: any) -> none
function ConfigurationManager:update(key, value)
  if not isStringType(key) then return end
  if key == "" then return end
  self.setting[key] = value
end

-- Initializes a new configuration manager instance.
-- ConfigurationManager() -> object
function cm.ConfigurationManager()
  return ConfigurationManager()
end

return cm
