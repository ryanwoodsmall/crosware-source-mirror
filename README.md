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

## checking out default branch after clone

```
git submodule init
git submodule foreach --recursive 'git branch -l 2>&1 | tail -1 | xargs echo git -C ${PWD} checkout' | grep ^git | bash
```

### detritus

to convert a `.gitmodules` to TOML, use something like this (for consumption by `yj`, then `yq`, `jq`, ...):

```
tr -d '"' < .gitmodules \
| tr '\t' ' ' \
| tr -s ' ' \
| sed '/submodule /s,/,_,g' \
| sed 's,submodule ,,g' \
| sed '/^ /s, = , = ",g' \
| sed '/^ /s,$,",g' \
| sed 's,^ ,,g'
```
