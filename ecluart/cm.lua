-- Defines a configuration management module.
local cm = {} -- version 2025.04

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local invalidTypes = {
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread" }

  return not table.concat(invalidTypes, ","):find(type(parameter))
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
local function isString(parameter)
  return type(parameter) == "string"
end

-- Checks if the parameter is a nil type.
-- isNil(parameter: any) -> boolean
local function isNil(parameter)
  return type(parameter) == "nil"
end

-- Checks if the parameter is a table type.
-- isTable(parameter: any) -> boolean
local function isTable(parameter)
  return type(parameter) == "table"
end

-- Defines the configuration manager object.
local ConfigurationManager = Object({})

-- Creates the configuration manager constructor.
function ConfigurationManager:constructor()
  local _settings = {}

  function self:set_settings(value)
    if not isTable(value) then
      value = {}
    end

    _settings = value
  end

  function self:get_settings()
    return _settings
  end

  self.children = {}
end

-- Adds a widget, property and configration key.
-- add(widget: object, property: string, key: string) -> none
function ConfigurationManager:add(widget, property, key)
  if not isValidChild(widget) then return end
  if not isString(property) then return end
  if not isString(key) then return end

  local newChild = {
    widget = widget,
    property = property,
    key = key
  }

  table.insert(self.children, newChild)
end

-- Sets the setting value for each widget.
-- apply() -> none
function ConfigurationManager:apply()
  for _, child in ipairs(self.children) do
    local settingValue = self.settings[child.key]

    if not isNil(settingValue) then
      child.widget[child.property] = settingValue
    end
  end
end

-- Gets the setting value for a key.
-- setting(key: string) -> string
function ConfigurationManager:setting(key)
  if not isString(key) then return "" end
  return self.settings[key] or ""
end

-- Updates the setting value for a key.
-- update(key: string, value: any) -> none
function ConfigurationManager:update(key, value)
  if not isString(key) then return end

  if not isNil(self.settings[key]) then
    self.settings[key] = value
  end
end

-- Saves the setting value for each widget.
-- save() -> none
function ConfigurationManager:save()
  for _, child in ipairs(self.children) do
    local settingValue = child.widget[child.property]

    if not isNil(settingValue) then
      self.settings[child.key] = settingValue
    end
  end
end

-- Initializes a new configuration manager instance.
-- ConfigurationManager() -> object
function cm.ConfigurationManager()
  return ConfigurationManager()
end

return cm
