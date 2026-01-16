# FASTA Sequence Highlighter for VS Code

Syntax highlighting for FASTA sequence files with per-nucleotide coloring.

## Features

- **Per-nucleotide coloring**: Each nucleotide (A, C, G, T/U) gets a distinct color for easy visual parsing
- **Header support**: Sequence headers (lines starting with `>`) use default text color
- **Comment support**: Lines starting with `;` are recognized as comments
- **Ambiguous base support**: IUPAC ambiguity codes (N, R, Y, K, M, S, W, B, D, H, V) highlighted in gray
- **Gap visualization**: Alignment gaps (`-` and `.`) shown in muted gray
- **Alignment-friendly**: Word wrap disabled and minimap hidden by default

## Supported File Extensions

`.fasta`, `.fas`, `.fa`, `.fna`, `.ffn`, `.faa`, `.frn`

## Default Colors (Soft)

Soft palette optimized for dark backgrounds. Headers are bold.

| Element | Scope | Color |
|---------|-------|-------|
| Header text | `entity.name.sequence.fasta` | #D4D4D4 (bold) |
| Header `>` | `punctuation.definition.header.fasta` | #808080 |
| Adenine (A) | `nucleotide.adenine.fasta` | #FF4466 (pink) |
| Cytosine (C) | `nucleotide.cytosine.fasta` | #44AAFF (sky blue) |
| Guanine (G) | `nucleotide.guanine.fasta` | #FFDD44 (yellow) |
| Thymine (T) | `nucleotide.thymine.fasta` | #44DD44 (green) |
| Uracil (U) | `nucleotide.uracil.fasta` | #44DD44 (green) |
| Ambiguous | `nucleotide.ambiguous.fasta` | #888888 (gray) |
| Gaps (-.) | `punctuation.gap.fasta` | #808080 (gray) |

## Customization

Add to your `.vscode/settings.json` or user settings:

```json
{
  "editor.tokenColorCustomizations": {
    "textMateRules": [
      { "scope": "entity.name.sequence.fasta", "settings": { "foreground": "#D4D4D4", "fontStyle": "bold" } },
      { "scope": "punctuation.definition.header.fasta", "settings": { "foreground": "#808080" } },
      { "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF4466" } },
      { "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#44AAFF" } },
      { "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFDD44" } },
      { "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#44DD44" } },
      { "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#44DD44" } },
      { "scope": "nucleotide.ambiguous.fasta", "settings": { "foreground": "#888888" } },
      { "scope": "punctuation.gap.fasta", "settings": { "foreground": "#808080" } }
    ]
  }
}
```

## Tips

### Bold nucleotides

Add `"fontStyle": "bold"` to make sequences easier to read.

### Invisible gaps

To hide alignment gaps, set them to your background color:

```json
{ "scope": "punctuation.gap.fasta", "settings": { "foreground": "#1E1E1E" } }
```

### Light theme

For light themes, adjust header colors:

```json
{ "scope": "entity.name.sequence.fasta", "settings": { "foreground": "#333333" } },
{ "scope": "punctuation.definition.header.fasta", "settings": { "foreground": "#808080" } }
```

## Alternative Palettes

### Classic
Red A, blue C, yellow G, green T.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF4444" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#4488FF" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFDD44" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#44DD44" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#44DD44" } }
```

### Vivid
Polychrome-optimized for max distinguishability (min distance 243). Magenta A, cyan C, orange G, green T.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FB16FE" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#00D2FB" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FE8A0D" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#22F50D" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#22F50D" } }
```

### Muted
Soft colors for extended viewing.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#D47070" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#7088B8" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#C4A040" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#70A870" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#70A870" } }
```

### Primary
Pure red, blue, yellow, green.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF0000" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#0000FF" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFFF00" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#00FF00" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#00FF00" } }
```

### Accessible
Colorblind-friendly (no green - uses orange for T).

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#DC267F" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#648FFF" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFB000" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#FE6100" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#FE6100" } }
```

### Balanced
Polychrome L50-85. Red A, cyan C, yellow G, green T.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#F60D16" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#0DEAEB" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#DADB1C" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#00EF00" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#00EF00" } }
```

## Installation

Search "FASTA Sequence Highlighter" in VS Code Extensions, or install from the [Marketplace](https://marketplace.visualstudio.com/items?itemName=roberthadfield.fasta-syntax).

## Authors

- Robert Hadfield (https://github.com/radrob2)
- Claude (Anthropic AI) - pair programming

## License

MIT
