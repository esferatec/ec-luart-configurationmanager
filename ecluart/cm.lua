-- Defines a configuration management module.
local cm = {}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local childType = type(parameter)
  local invalidTypes = {
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread" }

  for _, invalidType in ipairs(invalidTypes) do
      if string.find(childType, invalidType) then return false end
  end

  return true
end

-- Checks if the parameter is a table type.
-- isTable(parameter: any) -> boolean
local function isTable(parameter)
  return type(parameter) == "table"
end

-- Checks if the parameter is a string type.
-- isString(parameter: any) -> boolean
local function isString(parameter)
  return type(parameter) == "string"
end

-- Defines the configuration manager object.
local ConfigurationManager = Object({})

-- Creates the configuration manager constructor.
function ConfigurationManager:constructor(collection)
  local _collection = {}

  function self:set_collection(value)
    if not isTable(value) then
      value = {}
    end

    _collection = value
  end

  function self:get_collection()
    return _collection
  end

  self.collection = collection
  self.children = {}
end

-- Adds a widget, property and configration key.
-- add(widget: object, property: string, key: string) -> none
function ConfigurationManager:add(widget, property, key)
  if not isValidChild(widget) then return end
  if not isString(property) then return end
  if not isString(key) then return end

  local newChild = {}
  newChild.widget = widget
  newChild.property = property
  newChild.key = key

  table.insert(self.children, newChild)
end

-- Sets the setting value for each widget.
-- apply() -> none
function ConfigurationManager:apply()
  if next(self.collection) == nil then return end

  for _, child in ipairs(self.children) do
    local settingValue = self.collection[child.key]
    if settingValue then child.widget[child.property] = settingValue end
  end
end

-- Gets the setting value for a key.
-- setting(key: string) -> string
function ConfigurationManager:setting(key)
  if not isString(key) then return "" end

  local settingValue = self.collection[key]
  if not settingValue then return "" end

  return settingValue
end

-- Initializes a new configuration manager instance.
-- ConfigurationManager(collection: table) -> object
function cm.ConfigurationManager(collection)
  return ConfigurationManager(collection)
end

return cm
