PROJECT=antiscroll

all: node_modules check build

check: lint

lint:
	node_modules/.bin/jshint antiscroll.js

build: clean build/antiscroll.js build/antiscroll.css

build/antiscroll.js: antiscroll.js
	mkdir -p build
	node_modules/.bin/browserify \
		./antiscroll.js \
		--no-bundle-external \
		--transform stringify \
		--outfile $@

build/antiscroll.css: antiscroll.css
	cp $< $@

node_modules: package.json
	npm install

clean:
	rm -rf build
