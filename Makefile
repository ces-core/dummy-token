# include .env file and export its env vars
# (-include to ignore error if it does not exist)-include .env
-include .env

# install solc version
# example to install other versions: `make solc 0_8_14`
SOLC_VERSION := 0_8_14
# solc:; nix-env -f https://github.com/dapphub/dapptools/archive/master.tar.gz -iA solc-static-versions.solc_${SOLC_VERSION}

clean:; forge clean
update:; forge update
# Build & test
build:; forge build
test:; forge test # --ffi # enable if you need the `ffi` cheat code on HEVM

# deploy
flatten:; forge flatten --source-file ${file} --json-file out/forge.sol.json

TOKEN_NAME ?= "Dummy Token"
TOKEN_SYMBOL ?= "DUMMY"
deploy:
	./scripts/deploy.sh src/DummyToken.sol:DummyToken --verify --constructor-args ${TOKEN_NAME} ${TOKEN_SYMBOL}

nodejs-deps:; yarn install
lint:; yarn run lint
