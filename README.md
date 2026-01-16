# FASTA Syntax Highlighting for VS Code

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

Add `"fontStyle": "bold"` to make sequences easier to read:

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF5555", "fontStyle": "bold" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#55CCCC", "fontStyle": "bold" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFCC33", "fontStyle": "bold" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#55DD55", "fontStyle": "bold" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#55DD55", "fontStyle": "bold" } }
```

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

### Clustal
Traditional Clustal-style colors - red A, blue C, orange G, green T/U.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF4444" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#4488FF" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFAA00" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#44DD44" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#44DD44" } }
```

### NCBI
NCBI MSA Viewer style - red A, yellow C, blue G, green T/U.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF4444" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#FFDD44" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#4488FF" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#44DD44" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#44DD44" } }
```

### DRuMS
DRuMS mnemonic colors - azure A, carmine C, green G, yellow T/U.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#44AAFF" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#FF4466" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#44DD44" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#FFDD44" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#FFDD44" } }
```

### Colorblind-Friendly
Optimized for deuteranopia/protanopia using distinct hues.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#648FFF" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#DC267F" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFB000" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#FE6100" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#FE6100" } }
```

### Polychrome (Default)
Maximally distinguishable colors generated with R Polychrome package (single green seed, lightness 50-85, min distance 243).

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FE8A0D" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#00D2FB" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FB16FE" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#22F50D" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#22F50D" } }
```

### Pure RGB
Unmodified pure primary/secondary colors.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#FF0000" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#0000FF" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFFF00" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#00FF00" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#00FF00" } }
```

### Material
Material Design inspired - magenta A, blue C, amber G, teal T/U.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#D81B60" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#1E88E5" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#FFC107" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#004D40" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#004D40" } }
```

### Muted
Soft colors for long sessions.

```json
{ "scope": "nucleotide.adenine.fasta", "settings": { "foreground": "#D47070" } },
{ "scope": "nucleotide.cytosine.fasta", "settings": { "foreground": "#7088B8" } },
{ "scope": "nucleotide.guanine.fasta", "settings": { "foreground": "#C4A040" } },
{ "scope": "nucleotide.thymine.fasta", "settings": { "foreground": "#70A870" } },
{ "scope": "nucleotide.uracil.fasta", "settings": { "foreground": "#70A870" } }
```

## Installation

### From VSIX file

1. Download `fasta-syntax-0.2.0.vsix`
2. In VS Code: Extensions sidebar > `...` menu > `Install from VSIX...`
3. Select the downloaded file

### From source

1. Copy the extension folder to `~/.vscode/extensions/`
2. Reload VS Code

## Authors

- Robert Hadfield (https://github.com/radrob)
- Claude (Anthropic AI) - pair programming

## License

MIT
