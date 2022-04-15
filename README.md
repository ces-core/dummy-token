# Dapp Template

Template for Smart Contract applications compatible with dapp.tools or foundry.

## Usage

### Install dependencies

```bash
# Install tools from the nodejs ecosystem: prettier, solhint, husky and lint-staged
make nodejs-deps
# Install smart contract dependencies through `dapp update`
make update
```

### Create a local `.env` file and change the placeholder values

```bash
cp .env.examples .env
```

### Build

```bash
make build
```

### Test

```bash
make test-local # using a local node listening on http://localhost:8545
make test-remote # using a remote node (alchemy). Requires ALCHEMY_API_KEY env var.
```

### Deploy

```bash
make deploy
```

By default these are the parameters passed to the `DummyToken` constructor:
- `name`: `"Dummy Token"`
- `symbol`: `"DUMMY"`
- `decimals`: `18`

If you want to change any of those, you can use Makefile params:

```bash
make deploy TOKEN_NAME=\"My Token\" TOKEN_SYMBOL=\"MTK\" TOKEN_DECIMALS=2
```

**⚠️ ATTENTION**: both `TOKEN_NAME` and `TOKEN_SYMBOL` **MUST** be surrounded by double quotes, otherwise it will fail. When using `bash`, `zsh` or other commonly used shells, you need to escape the `"` character as in the example above.

Another way is to put single quotes around string params:

```bash
make deploy 'TOKEN_NAME="My Token"' 'TOKEN_SYMBOL="MTK"' TOKEN_DECIMALS=2
```
