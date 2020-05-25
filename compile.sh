echo "Compiling.."
kotlinc $(find ./src/ -name "*.kt") -d ./dist/app.jar
if [ $? != 0 ]
	then
		echo ""
		echo "Compilation failed"
		exit
fi
echo "Running.."
echo ""
kotlin -classpath ./dist/app.jar AppKt
