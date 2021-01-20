# Conda Environment

Python dev environment including

- IntelPython3
- pytorch
- jupyterlab
- ...

## Miniconda

Install miniconda from official site.

- Installation: <https://docs.conda.io/en/latest/miniconda.html>

## Manage conda environment

Manage conda environment via `environment.yml`.

Install dependencies as follows.

```bash
# create
conda create -n code1234 -f environment.yml

# update
conda update -n code1234 -f environment.yml
```

