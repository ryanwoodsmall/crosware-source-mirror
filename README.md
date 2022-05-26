# crosware-source-mirror

mirror of source and binary archives for [crosware](https://github.com/ryanwoodsmall/crosware)

## adding submodules

```
mkdir -p project
cd project
git submodule add -b master https://git.server/upstream/project/repo.git git
```

## updating submodules

```
git submodule foreach --recursive 'git pull'
```
