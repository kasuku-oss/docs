# Other Formats

By default it is assumed that anyone using _PolyLingo_ technology, uses _FTL_ files.
It's the default format linked to _l20n_ and is therefore a reasonable default to assume.

Not everyone however will want to use a special editor, but might still want to use a plugin available for their platform. In such cases we could support a custom format, and treat it as a subset of _l20n_.
As an example, this might be because they already have a workflow that involves spreadsheet software,
which works well for them. But in general these use-cases resolve around generic file formats.

Some people that might be interested in _PolyLingo_ technology, might already use another localization text format.
The _Portable_Object_ (`.po`) file format is very popular with i18n people, and has been around since the 90's.
It is therefore reasonable to assume that supporting formats such as these could be a good idea as well.

Support could be happening in two tiers:

+ Preferable it would mean that people import their original/legacy files into an editor, and have those file automatically be converted to _FTL_ files;
+ Optionally it could also mean that people are actually able to load their files automatically via plugins/libraries, based on the file extension (e.g. `.po` would automatically be handled by a _PO_Parser_);

## Format Comparison

In order to get a better overview of the different file formats, let's look at some tables.

In the first table we compare FTL (l20n) with generic file formats often used for localization:

// TODO
// `.csv` (Spreadsheet software)
// `.xml` (Android, and other custom plugins) (e.g. android: https://developer.android.com/training/basics/supporting-devices/languages.html)

In the second table we compare FTL (l20n) with file formats also designed for localization:

// TODO
// `.resx` (Windows) (https://msdn.microsoft.com/en-us/library/ekyft91f(v=vs.80).aspx)
// `.strings` (iOS) (https://www.objc.io/issues/9-strings/string-localization/#nslocalizedstring)
// `.po` (https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html)

## Conclusion

TODO
