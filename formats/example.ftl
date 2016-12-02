# comments start with a hash

# and can also linked to an entry, by putting it above one
hello = Hello, World!

hello = "Hello, world!"

hello =
    | Hello,
    | World!

kernel = Linux

# an example of an entry using a reference
kernel_statement = { kernel } is a great kernel.

# an example of an entry using a variable
hello_user = Hello, { $name }!

# a plural variant example
# this also shows an example of a formatter (PLURALS),
# which transforms `$USERS` into zero, one, ...
users_online = { PLURALS($users) ->
    [zero]      Aucun utilisateur
    [one]       Un seul utilisateur
    *[other]    Il y a { $users } utilisateurs
} en ligne.

# generic variant example
brandName =
 *[nominative] Aurora
  [genitive] Aurore
  [dative] Aurori
  [accusative] Auroro
  [locative] Aurori
  [instrumental] Auroro
about = O { brandName[locative] }
