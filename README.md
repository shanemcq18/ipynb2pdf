# ipynb2pdf

Convert a Jupyter notebook to a PDF with nice syntax highlighting and formatting.

## Installation

1. [Install `uv`](https://docs.astral.sh/uv/getting-started/installation/).
2. Run `uv sync`

## Set up

Place the `.ipynb` file to convert in this folder.
Then, if the name is `MyNotebook.ipynb`, change the following line in the [Makefile](./Makefile) from

```Makefile
FILENAME := Notes
```

to

```Makefile
FILENAME := MyNotebook
```

## Compilation

Run `make`.
