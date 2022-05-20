# Java Panama Polyglot (Rust) Part 4
This is an example of using Project Panama to talk to a Rust based native library.


Check out the tutorial here: 
https://foojay.io/today/java-panama-polyglot-part-4/

# Setup Java 19 with Project Panama
Go to https://jdk.java.net/panama/ Build 19-panama+1-13 (2022/1/18)
After untarring into a directory do the following:

```bash
export JAVA_HOME=<untarred_dir>/jdk-19/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
```

# Installing Rust
To install Rust run the following for (MacOS/Linux):

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

Assuming you've installed Rust you'll want to add its binaries on the PATH as followings:

```bash
source $HOME/.cargo/env
```

# Clean, Build, & Run Example
The following are the steps to clean, build library, generate `lib.h`, jextract generated Panama Code, and execute Main.java.
 
```bash
bash clean.sh
cargo build
bash jextract_lib_macos.sh
bash run_Main_macos.sh
```

# Output

```
WARNING: Using incubator modules: jdk.incubator.foreign
warning: using incubating module(s): jdk.incubator.foreign
1 warning
Rust getting process id = 36396
```

