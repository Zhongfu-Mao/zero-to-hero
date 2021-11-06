# Concepts

## conda package

> A conda package is a compressed *tarball* file (.tar.bz2) or *.conda* file

It contains:

- system-level libraries.
- Python or other modules.
- executable programs and other components.
- metadata under the `info/` directory.
- a collection of files that are installed directly into an `install` prefix.



## conda channels

> Conda channels are the **locations** where packages are stored. 

They serve as the base for hosting and managing packages. 



## conda environments

> A conda environment is a **directory** that contains a specific collection of conda packages that you have installed. 



# Commands

## Package

### Search

```bash
$ conda search <package_name>  [--info]

$ conda search python

$ conda search --full-name python

$ conda search --override-channels --channel defaults scipy
```

### Install

```bash
$ conda install --name <env_name> <package_name>

$ conda install <package_name> # current environment

$ conda install [--channel <channel_name>] <package_name>

$ conda install -c <package_name> # from Anaconda.org

$ conda install "PKGNAME[version='3.1.2|3.1.4']"

$ conda install "PKGNAME>2.5,<3.2"
```

### List

```bash
$ conda list

$ conda list --name <env_name>

$ conda list --revisions
```

### Info

```bash
$ conda info <package_name>
```

### Update

```bash
$ conda update <package_name | python | conda >

$ conda update --all --name <env_name>
```

### 

```bash
$ conda uninstall -n <env_name> <package_name> [...<package_name>]
```

### Clean

```bash
$ conda clean --all
```





## Channel

### Add

```bash
$ conda config --add channels <new_channel>
```



## Environment

### Create

```bash
$ conda create --name <env_name>

$ conda create -n <env_name> python=3.9

$ conda create -n <env_name> pandas=1.3

$ conda create -n <env_name> python=3.9 scipy=0.15.0 astroid babel

$ conda create --no-default-packages -n <env_name> python

$ conda create --prefix ./envs jupyterlab=0.35 matplotlib=3.1 numpy=1.16
```

### Activate & Deactivate

```bash
$ conda activate <env_name>

$ conda activate ./envs

$ conda deactivate
```

### Info

```bash
$ conda info --envs

$ conda env list
```

### File

```bash
$ conda env create -f environment.yml
```

### Update

```bash
$ conda env update --prefix ./env --file environment.yml  --prune
```

### Cloning

```bash
$ conda create --name <env_name> --clone <new_env_name>
```



## Configuration

[Conda configuration](https://docs.conda.io/projects/conda/en/latest/configuration.html)

```bash
$ conda config --add channels <channel_name>

$ conda config --describe <key>

$ conda config --set <key> <value>
$ conda config --set ssl_verify false

$ conda config --show

$ conda config --show-sources
```



## Conda

```bash
$ conda info

$ conda --version

$ conda update -n base conda

$ conda --help
```

