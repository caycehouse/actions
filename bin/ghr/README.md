# ghr

## Usage

```workflow
action "github release" {
  uses = "caycehouse/actions/bin/ghr@master"
  env = {
    RELEASE_PATH = "_build/prod/rel"
    APPLICATION = "rt"
  }
  secrets = ["ACTIONS_TOKEN"]
}
```
