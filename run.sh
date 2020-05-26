if [[ $1 = *"c"* ]] || [[ $1 = "" ]] ; then
	files=$(find ./src/ -name "*.kt")

	newsum=$(md5sum $files)

	oldsum=""
	[ -f ./sourcehash.md5 ] && oldsum=$(<sourcehash.md5)

	if  [[ $1 = *"c"* ]] || [ "$oldsum" != "$newsum" ]; then
		mkdir -p ./dist/

		printf "Compiling..\n"
		kotlinc $files -d ./dist/app.jar
		
		if [ $? -gt 0 ]; then
			printf "Compilation failed\n"
			exit 1
		else
			printf %s "$newsum" > ./sourcehash.md5
			printf "Compilation successful\n"
		fi

	else printf "Source hashes match - skipping compilation\n"
	fi
fi

if [[ $1 = *"r"* ]] || [[ $1 = "" ]] ; then
	printf "Running..\n\n"
	# assumes fun main() is in a file called app.kt, hence AppKt
	kotlin -classpath ./dist/app.jar AppKt
	exit $?
fi
