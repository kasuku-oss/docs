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
     ---> no: Is this a non-generic version (provides more then a language code)
              and is a generic version available?
                |--> yes: Return it!
                 ---> no: Is a version available at the same (`en-GB` insead of `en-US`)
                          or deeper (`en-GB-pirate` instead of `en-US`) match level?
                            |--> yes: Return the closest and first one found!
                             ---> no: No match could be found!
```

Keep your locales as generic as possible, only specify a region from the second version of the same language on. Same goes for dialects/SILs. If you provide 2 regions for 1 language, keep 1 of them generic as its default (Eg. if you provide `en-US` and `en-GB`, keep `en-US` as `en`, if this is a reasonable default for you). When no generic version is specified of a language, it is undefined which language you get when looking for a version (Eg. `en-AU`) which is not provided).

## Why are Language Tags used?

_MessageContexts_ can be created by giving the path to a valid FTL file,
the names of these files are expected to be valid language tags.
This is important as automated features (Eg. formatters (see: builtins) and auto-detecting the locale (see: next chapter)) depend on the enumerated meaning behind the parts of these language tags. Most features will simply care about the language, while some might also consider the region. Matching a locale should always be as liberal and exact as possible.

## LanguageTag Parsing for Libraries and Plugins

Libraries and plugins will only validate the language tag as much as is needed for splitting the tag into the different parts (language, region and SIL/dialect). Meaning that it will only check if a hyphen is used and wether or not any non Alphanumeric values are defined. Custom languages/regions/sil/dialects are allowed, as the specific parts are not validated or checked, beyond the alphanumeric-only character check.

Filenames don't have to be exact matches. The same Language-Tag matching algorithm defined earlier in this file is used to match a locale file based on a requested (import) locale.

## Locale Resolve

When translating, following resolve logic is used to choose which locale to use:

```
Is a locale explicitly specified?
    |--> yes: Try to find a match!
     ---> no: Can the locale be automatically detected?
                |--> yes: Try to find a match!
                 ---> no: Try to find a match for the default locale!
```

## References

+ Language Tags: https://wiki.mozilla.org/L10n:Locale_Codes
