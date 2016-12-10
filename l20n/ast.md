# FTL Abstract Syntax Tree

FTL files gets parsed by a parser into an Abstract Syntax Tree, or AST in short.
This step could be skipped, and one could choose to generate runtime objects directly,
but this isn't recommended:

+ By parsing your content to an AST you get a separation of concerns. Where the design of your file format does not have to influence your runtime architecture;
+ It also means that you can have multiple parsers targeting the same AST, making most of the codebase shared;

## AST Elements

Each FTL file gets eventually parsed into 1 root object, the _body_ AST Element, which contains all other AST elements, starting from entry elements and going down from there. In this chapter you can find the complete list of expected AST elements.

No optimization takes place in the AST, as this would only be effective when runtime logic gets mixed with AST logic, which is not desired.
Instead the optimization takes lazily place on runtime.

### Body

The root element, containing all _entries_.

### Entries

A _section_ and _comment_ can't be optimized and is only stored in the AST for tooling.

An _entity_ (AKA _message_/_term_) is the most common entry,
and links a term (_pattern_/_member-list_/_pattern_ and _member-list_) with a key (_identifier_).

### String Primitives

A _keyword_, _builtin_, _unquoted-text_ and _identifier_
are all stored as a _string-primitive_, as they simply store a string.

**Note** that an exception is when a _string-primitive_ is used as a _reference_,
in which case the element is a _reference_ instead.

It should be clear from where its used, which element it refers to
(Eg. a _section_ contains a _keyword_, so we know that the _string-primitive_ is in this case a keyword).
The Actual difference between them is only important for the parser, and doesn't influence later phases.

### Quoted-Text

Contains a string.

### Block-Text

Contains a list of strings.

### Reference

Contains a string.

### Variable

Contains a string.

### Number

Contains a double.

### Attribute

Contains an _identifier_ and _keyword_.

### Argument-List

Contains a list of AST elements.

### Call-Expression

Contains a _builtin_ (name of formatter) and _argument-list_.

### Keyword-Argument

Contains an _identifier_ and _quoted-pattern_.

Used as an _argument_ as part of an _argument-list_, where a default value is wanted.

### Member-Expression

Contains an _identifier_ and _keyword_.

### Member

Contains a key (AST element), _pattern_ (value) and a boolean indicating it's the default member.

### Member-List

Contains a list of _members_.

### Select-Expression

Contains an expression (AST elements) and _member-list_.

### Placeable

Contains a list of expressions (AST elements).

### Pattern

Contains a list of expressions (AST elements).
