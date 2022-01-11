# Material for MkDocs

## Installations

```shell
pip install mkdocs-material
```

## Create a new site

```shell
$ mkdocs new my-site
$ tree
tree
.
└── my-site
    ├── docs
    │   └── index.md
    └── mkdocs.yml

2 directories, 2 files
```

## Configurations

### Minimal Configuration

```yaml
theme:
  name: material
```

### Change the Colors

```yaml
theme:
  name: material
  palette:
  - scheme: default
    primary: teal
    accent: amber
    toggle:
      icon: material/lightbulb
      name: Switch to light mode
  - scheme: slate
    primary: teal
    accent: amber
    toggle:
      icon: material/lightbulb-outline
      name: Switch to dark mode
```

### Navigation

```yaml
theme:
  features:
    - navigation.tabs
    # - navigation.tabs.sticky
    - navigation.sections
    - navigation.expand
    - navigation.indexes # Requires `index.md` at the beginning of a section
    - navigation.top # Back to top button
nav:
  - Section:
    - section/index.md
    - Page 1: section/page-1.md
    ...
    - Page n: section/page-n.md
```

### Search

```yaml
plugins:
  - search:
      lang: 
        - en
        - ja
theme:
  features:
    - search.suggest
    - search.highlight
```

### Abbreviation

```yaml
markdown_extensions:
  - abbr
  - pymdownx.snippets
```

exp:

```markdown
The HTML specification is maintained by the W3C.

*[HTML]: Hyper Text Markup Language
*[W3C]: World Wide Web Consortium
```

### Admonitions

#### Config

```yaml
markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences
```

#### Basic Usage

```markdown
!!! note
    Note
```

[Supported Types](https://squidfunk.github.io/mkdocs-material/reference/admonitions/#supported-types)

#### Change the Title

```markdown
!!! note "title"

    Customized title
```

#### Remove the Title

```markdown
!!! note ""

    No title
```

#### Collapsible blocks

```markdown
??? note

    Collapsed block

???+ note

    Rendered open block
```

### Buttons

```yaml
markdown_extensions:
  - attr_list
```

```markdown
[Text](#<link>){ .md-button }
[Text](#<link>){ .md-button .md-button--primary }
```

### Code Blocks

```yaml
markdown_extensions:
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
```

#### Highlight

``` py hl_lines="2 3"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```

* Line numbers: `hl_lines="2 3"`
* Line number range: `hl_lines="2-3"`
* Inline code blocks: `#!python range()`

### Content tab

```yaml
markdown_extensions:
  - pymdownx.superfences
  - pymdownx.tabbed:
      alternate_style: true 
```

[Usage](https://squidfunk.github.io/mkdocs-material/reference/content-tabs/#usage)

### Data Table

```yaml
markdown_extensions:
  - tables
```

[sortable table](https://squidfunk.github.io/mkdocs-material/reference/data-tables/#sortable-tables)

### mermaid

```shell
pip install mkdocs-mermaid2-plugin
```

```yaml
plugins:
    - search
    - mermaid2
```

### Footnotes

[footnotes](https://squidfunk.github.io/mkdocs-material/reference/footnotes/)

### Formatting

[formatting](https://squidfunk.github.io/mkdocs-material/reference/formatting/)
[keyboard keys](https://squidfunk.github.io/mkdocs-material/reference/formatting/#adding-keyboard-keys)

### Icons and Emojis

[search](https://squidfunk.github.io/mkdocs-material/reference/icons-emojis/#search)

### Images

[images](https://squidfunk.github.io/mkdocs-material/reference/images/)

### List

[lists](https://squidfunk.github.io/mkdocs-material/reference/lists/)

## Preview

```shell
mkdocs serve
```

## Build

```shell
mkdocs build
```
