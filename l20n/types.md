# FTL Type System

The l20n runtime system is divided into objects that either are of an FTL type,
or produce another type of such a type.

Objects that have an FTL Type:

+ contain information that describes how to format it (into a string);
+ can be formatted in a custom way if explicitly specified by the user (using a _call-expression_);
+ contain information that describes how to compare 2 objects of an FTL Type;
+ usually wrap around a primitive type exposed by the host (programming language);

## FTLNone

The _nil_/_void_/_nop_ type of the FTL type category.

## FTLNumber

The _numeric_ type of the FTL type category, with double floating point precision.

When a number is used as the expression of a variant, directly or indirectly,
it is automatically formatted using the `PLURAL` builtin.

## FTLString

The _string_ (text) type of the FTL type category, with unicode support.

## FTLDateTime

The _data+time_ type of the FTL type category.

## FTLKeyword

Contains a name (_string_) and optionally a namespace (_string_).

> TODO: Why is this used?

## FTLList

Contains zero or more FTL Type objects.

## FTLObject

Contains zero or more FTL Type objects, linked to a key (string).
