# Other Formats

By default it is assumed that anyone using _PolyLingo_ technology, uses _FTL_ files.
It's the default format linked to _L20n_ and is therefore a reasonable default to assume.
This default is only assumed as it is the most powerful format available,
for most people, exporting to other (more complex) formats shouldn't be any problem at all.

Not everyone however will want to use a special editor, but might still want to use a plugin available for their platform.
In such cases we could support a custom format, and treat it as a subset of _L20n_.
As an example, this might be because they already have a workflow that involves spreadsheet software,
which works well for them. But in general these use-cases resolve around generic file formats.

Some people that might be interested in _PolyLingo_ technology, might already use another localization text format.
The _Portable_Object_ (`.po`) file format is very popular with i18n people, and has been around since the 90's.
It is therefore reasonable to assume that supporting formats such as these could be a good idea as well.

Support could be happening in two tiers:

+ Preferable it would mean that people import their original/legacy files into an editor, and have those file automatically be converted to _FTL_ files (Exporting to the original format should still be possible though);
+ Optionally it could also mean that people are actually able to load their files automatically via plugins/libraries, based on the file extension (e.g. `.po` would automatically be handled by a _PO_Parser_);

## Format Comparison

In order to get a better overview of the different file formats, let's compare them in following table:

|  | [l20n (FTL)][l20n] | [Portable Object][po] | [Strings iOS][strings-ios] | [Windows RESX][resx] | XML/JSON/CSV |
|:-----------------:|:----:|:---------------:|:-------------:|:------------:|:----:|
| extension | `.ftl` | `.po` | `.strings` | `.resx` | `.xml`/`.json`/`.csv` |
|  |  |  |  |  |  |
| multi-platform | X | X | - | - | X |
|  |  |  |  |  |  |
| text | X | X | X | X | X |
| multi-line text | X | X | - | - | - |
|  |  |  |  |  |  |
| comment | X | X | X | - | - |
| reference | X | - | - | - | - |
| variable | X | ~ | ~ | - | - |
| variant | X | ~ | ~ | - | - |
| formatter | X | ~ | ~ | - | - |
| non-text resource | ~ | - | - | X | - |

In the table `X` means fully supported, `~`, means partly supported, and `-` means not supported.

As can be seen, all formats allow for the simple key/value pair (**text**) translations, where each pair is often called an entry, multi-line values are however more rare among the listed formats.

**Variables** are given by the callee of the translation function and are thus external.
This allows the runtime user to plugin variables, which make translations more dynamic, but also more complex.
It is true that a simple syntax could be invented for each format to plugin such variables, but this wouldn't work,
as variables also need metadata attached to them, as they often influence the sentence, Eg: plurals, gender, ...;

**References** are similar to **variables** with the difference that they refer to other entries within the same or linked files.

**Comments** allow translators (or Developers) to attach extra information that can help with providing good translations.
Comments get ignored when used in Apps/Games/Websites, but are read-writeable in tools.

**Variants** allow the translators to define different forms of the same sentence. In L20n (_FTL_) all variants are generic,
and can be used for any purpose including attaching metadata (Eg. gender) to an entry. In the _PO_ format,
variants are only available for plural purposes.

**Formatters** transforms data for intermediate as well as final usage. All data types have default formatters in L20n (_FTL_),
but those can be overridden and formatters for custom data types can be provided as well. Note that this happens in the
actual Game/App Code, extending the PolyLingo/L20n Plugins/Libraries.

Finally there is the capability of linking **resources**, which aren't text (Eg. images, textures, objects, sounds, models) to locales. This isn't supported in the PolyLingo tools, but some Plugins (Eg. PolyLingo Unity) do allow such resources to be linked to a locale.
See documentation of these plugins for more information.

## All the formats in the world

The chapter above is not the full list of formats available though. _AngularJS_ for example also has a specific format.
And I doubt that I can ever get a 100% complete picture, but here is a more complete list of available localization formats:

+ GNU GetText (`.po`, `.pot`, `.mo`);
+ Microsoft Excel (`.xls`);
+ Any spreadsheet software (`.csv`);
+ Microsoft (`.resw`, `.resx`);
+ Android (`.xml`);
+ iOS (`.strings`, `.xliff`, `.stringsdict`);
+ Java (`.properties`);
+ Json (`.json`);
+ Angular 2 (`.xmb`, `.xtb`);

## Conclusion

A lot of the formats out there, were already pretty good, but often not sufficient.
As our world gets both more Global and Social, so does the localization workload increase.

A social world means that we want to make our dialogues and thus translations also more social, increasing their complexity.

A global world means that we have to localize our games for languages and regions we might not know anything about.
The problem is that different languages have very different structure and rules. Sooner or later this breaks down the more basic solutions,
forcing you to add more duck-tape, or to keep your dialogues as simple as you can handle.

_strings (iOS)_ is pretty complete, but only works for iOS, so not really an optional for any other platform.

_Portable Object_ files were already pretty amazing. As it has been around since the 90s, it has support in most platforms.
L20n (FTL) reinvents this concepts, making it not just more modern, but also more powerful.

Supporting many, if not all, of these formats in some kind of editor, does make sense.
This might become a problem if translations have to be exported though, as sub-formats might not be able to support all used capabilities.

[l20n]: http://l20n.org
[po]: https://www.gnu.org/software/gettext/manual/html_node/PO-Files.html
[resx]: https://msdn.microsoft.com/en-us/library/ekyft91f(v=vs.80).aspx
[strings-ios]: https://www.objc.io/issues/9-strings/string-localization/#nslocalizedstring
