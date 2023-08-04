-- Defines a configuration management module.
local cm = {}

cm.customtypes = {}

-- Checks if the parameter is a valid child widget.
-- isValidChild(parameter: any) -> boolean
local function isValidChild(parameter)
  local childType = type(parameter)
  local validTypes = {
    "Label",
    "Button",
    "Checkbox",
    "Radiobutton",
    "Groupbox",
    "Entry",
    "Edit",
    "Combobox",
    "List",
    "Tab",
    "Progressbar",
    "Menu",
    "Tree",
    "Calendar",
    "Picture",
    "Window" }

  if type(cm.customtypes) == "table" then
    for _, value in ipairs(cm.customtypes) do
      table.insert(validTypes, tostring(value))
    end
  end

  for _, validType in ipairs(validTypes) do
    if string.find(childType, validType) then return true end
  end

  return false
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
      _collection = next(_collection) == nil and {} or _collection
      return
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

-- Initializes a new configuration manager instance.
-- ConfigurationManager(collection: table) -> object
function cm.ConfigurationManager(collection)
  return ConfigurationManager(collection)
end

return cm
