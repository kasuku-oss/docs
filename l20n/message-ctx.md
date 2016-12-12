# Message Context

Message contexts are single-language stores of translations. They are responsible for parsing translation resources in the FTL syntax and can format translation units (entities) to strings.

All Message contexts also reference the default Message Context,
used to resolve references which aren't found in the Message Context itself.
The exception to this rule is the default Message Context itself.
