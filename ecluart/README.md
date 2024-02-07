# CM.LUA

The code is a Lua module for managing configurations. It defines a ConfigurationManager object that handles the settings of properties for different widgets.

## Constructor

```Lua
ConfigurationManager() -> object
```

This function, ConfigurationManager, initializes a new instance of the configuration manager. It takes a table parameter for the collection and returns a new instance of the ConfigurationManager object with the provided collection.

## Property - collection

```Lua
ConfigurationManager.collection (table)
```

The collection property is expected to be a table containing the setting data.

## Method - add

```Lua
ConfigurationManager:add(widget: object, property: string, key: string) -> none
```

This function adds a widget, property, and configuration key to the configuration manager. It takes an object parameter for the widget, a string parameter for the property, and another string parameter for the key. Before adding the child, it checks if the widget is a valid child using the isValidChild function. If any of the parameters are invalid, the function returns early. Otherwise, it creates a new child object with the widget, property, and key, and inserts it into the self.children table.

## Method - apply

```Lua
ConfigurationManager:apply() -> none
```

This function sets the setting value for each widget in the configuration manager. It checks if the self.collection table is empty using the next function. If it is empty, the function returns early. Otherwise, it iterates over each child in the self.children table and retrieves the setting value from the self.collection table using the child's key. If a setting value exists, it sets the widget's property to the setting value.

## Method - setting

```Lua
ConfigurationManager:setting(key: string) -> string
```

This function retrieves the setting value for a given key from the configuration manager. It takes a string parameter for the key. If the key is not a string, it returns an empty string. Otherwise, it retrieves the setting value from the self.collection table using the key. If the setting value does not exist, it returns an empty string; otherwise, it returns the setting value.
