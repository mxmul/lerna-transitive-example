.PHONY: repro
repro: monorepo/node_modules
	sed -i.bak s/1.0.0/2.0.0/  monorepo/packages/pkg-c/package.json
	cd monorepo && ./node_modules/.bin/lerna exec --include-dependencies --since v1.0.0 -- 'echo $$PWD'

monorepo/node_modules:
	cd monorepo && yarn

.PHONY: clean
clean:
	git clean -fdX
