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
        - jp
theme:
  features:
    - search.suggest
    - search.highlight
```

## Preview

```shell
mkdocs serve
```

## Build

```shell
mkdocs build
```
