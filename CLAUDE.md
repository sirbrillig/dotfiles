# Commit messages

- Keep the first line (subject) of commit messages to 70 characters or fewer.

# Finding definitions

Use `grepdef` (in ~/.cargo/bin) to find where a symbol is defined: a function, class, method, constant, etc. It's faster than rg on large trees. It supports js, php, rs, ts, py and rb.

    grepdef -n <symbol> <abs/path>          # e.g. grepdef -n get_plan_by_id /abs/path/to/project
    grepdef -n -t php <symbol> <abs/path>   # set the type when the path has mixed languages

- Always pass an explicit absolute path; don't `cd` first and don't use `.`.
- grepdef only finds definitions. Use rg / Grep for call sites, references, and text searches.
- If grepdef finds nothing, fall back to rg before concluding the symbol doesn't exist (dynamic definitions, magic methods, etc.).
- Always use the `--index` option to improve performance.
