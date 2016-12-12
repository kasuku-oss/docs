## Builtins

The builtins are (heavily) based on the Intl (js) Object, the namespace for the ECMAScript Internationalization API.
More information about this API can be found at: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl

Builtins are functions provided by the L20n library or as a custom extension (defined by the user of an l20n library/plugin).
They take 1 or multiple arguments. Each argument is either an FTL Type, or an expression which produces a local object of such type. Builtins are locale-aware, and may define specific or an entirely new set of rules, for a specific locale.

All objects of an FTL Type have their default formatters for the different scenarios they may be used within an FTL File. Such formatters will be implicitly triggered using a standard builtin, if no builtin is explicitly defined as a call-expression by the localizer. In most situations this should be fine.

More information can be found at: https://github.com/l20n/l20n.js/blob/master/docs/builtins.rst

### PolyLingo Builtins

The PolyLingo eco-system provides following builtins on top of the default L20n builtins:

+ `PLATFORM`: `PLATFORM()`
    + Returns an `FTLString` indicating the host platform;
+ `SCREEN`: `SCREEN(type...)`
    + Returns a `FTLList` with the requested information;
    + Eg. `SCREEN(width, height)` returns a `FTLLIST[FTLNumber(<width>), FTLNumber(<height>))`;
    + Eg. `SCREEN(mode)` returns a singleton list, with a `FTLString`, equal to `Landscape`, `Portrait` or `Other`;
