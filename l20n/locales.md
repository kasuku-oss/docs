# Locales and Language Tags

A locale is identified by a token, called Language Tags.
A Language Tag can have following formats:

+ `ab`
+ `ab-XY`
+ `abc-XY`
+ `abc-XY-SIL`
+ `abc-XY-dialect`

Where:

+ `ab/abc` - indicates language, from ISO 639.1/639.2
    + List: http://www.loc.gov/standards/iso639-2/ISO-639-2_utf-8.txt
    + Note that not all languages have a 2-letter code
+ `XY` - indicates region, from ISO 3166
    + List: http://data.okfn.org/data/core/country-list/r/data.csv
+ `SIL` - from the SIL list
    + List: https://www.ethnologue.com/sites/default/files/LanguageCodes.tab
+ `dialect` - following the rules from RFC 5646
    + 5 to 8 letters; or a number followed by three letters or numbers

When searching for a locale, the closest match will always be returned:

```
Is an exact match possible?
    |--> yes: Return it!
     ---> no: Can a match with more information be found?
                |--> yes: Return the first one found!
                 ---> no: No match could be found!
```

_MessageContexts_ can be created by giving the path to a valid FTL file,
the names of these files are expected to be valid language tags.
This is important as automated features (Eg. formatters (see: builtins) and auto-detecting the locale (see: next chapter)) depend on the enumerated meaning behind the parts of these language tags. Most features will simply care about the language, while some might also consider the region. Matching a locale should always be as liberal and exact as possible.

## Locale Resolve

When translating, following resolve logic is used to choose which locale to use:

```
Is a locale explicitly specified?
    |--> yes: Use it!
     ---> no: Can the locale be automatically detected?
                |--> yes: Use it!
                 ---> no: Use the default locale!
```

## references

+ Language Tags: https://wiki.mozilla.org/L10n:Locale_Codes
