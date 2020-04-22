.PHONY : build windows

all: | clean build windows

clean:
	rm -rf dist
	rm -rf bornholm.love

build:
	zip -qq -9 -r bornholm.love .

windows:
	mkdir dist

	wget -O love.zip https://github.com/love2d/love/releases/download/11.3/love-11.3-win64.zip
	unzip love.zip
	mv love-*-win64 win64
	cat win64/love.exe bornholm.love > dist/bornholm.exe

	# copy distributing files
	cp win64/SDL2.dll dist/SDL2.dll
	cp win64/OpenAL32.dll dist/OpenAL32.dll
	cp win64/license.txt dist/license.txt
	cp win64/love.dll dist/love.dll
	cp win64/lua51.dll dist/lua51.dll
	cp win64/mpg123.dll dist/mpg123.dll
	cp win64/msvcp120.dll dist/msvcp120.dll
	cp win64/msvcr120.dll dist/msvcr120.dll

	cd dist && zip -r bornholm_windows.zip . && cd ..

	rm -rf love.zip
	rm -rf win64
