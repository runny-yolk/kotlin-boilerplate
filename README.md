# kotlin-boilerplate
Simple Kotlin hello world, and compile script that uses the command-line compiler.

Run `./run.sh` will search `./src` recursively for Kotlin files, compile them for the JVM, and then run the resulting `.jar` on the Kotlin runtime. Written and tested on git bash on Windows, so you may have to do `chmod +x ./run.sh` in a *nix bash environment. Or maybe it just won't work. Who knows? Not me!

Useful for when you're working on a small project that has no dependencies (aside from the stdlib), and want a lighter pipeline. For anything more complicated, you probably want to look at using a build tool like Gradle, though.

Requires that you have the command-line kotlin compiler and runtime installed (and on the PATH, if you're on Windows)


## `./run.sh` compilation
Compiled `.jar` will be `./dist/app.jar`.

You can call `./run.sh` with just `c` as an argument like so `./run.sh c`, if you want to skip the running step, and just compile the code.

By default, `./run.sh` will create a hash of all your source files before compiling them, and will check the current hash against the previous hash, and if they match, then compilation will be skipped. Calling with `c` will also force compilation, skipping the check of the previous hash. The current hash is always written to disk on successful compilation.

If you want to force compilation and still run the code, you can call `./run.sh` with `cr`, like so `./run.sh cr`.

## `./run.sh` running the .jar
It's assumed that the main function will be in `./src/app.kt`, for setting the -classpath argument as `AppKt` on the runtime. Feel free to change this as per your needs, though.

You can call `./run.sh` with just `r` as an argument like so `./run.sh r`, if you want to skip the compilation step completely and just run whatever's been compiled.
