# panama-polyglot - Python
Demos of using Java Project Panama's Foreign Function &amp; Memory Access APIs to talk to Python.

## Verify Python evironment
Before getting started let's find out what version of the Python interpreter that is installed locally. Go to your command line terminal and type the following:
```shell
python3 --version
```

```shell
Python 3.10.2
```

## Install Python libraries
```shell
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade tensorflow
sudo pip3 install --upgrade tensorflow-gpu
Pip3 install pyplot
pip3 install matplotlib
```

## Generating Panama binding (Java) classes

Before we can call Python code you will need to generate Java Panama classes using jextract. These generated class files will be used on the classpath e.g. `-cp` classes when running the java application. Do the following to generate Java classes.

```shell
jextract  -l python3.10  \
  -d classes \
  -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include  \
  -I /Library/Frameworks/Python.framework/Versions/3.10/include/python3.10/  \
  -t org.python \
  /Library/Frameworks/Python.framework/Versions/3.10/include/python3.10/Python.h
```

## Generating Panama binding (Java) source code

Enter the following to generate source code for Python.h:
```shell
jextract  -l python3.10  \
  --source \
  -d generated/src \
  -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include  \
  -I /Library/Frameworks/Python.framework/Versions/3.10/include/python3.10/  \
  -t org.python \
  /Library/Frameworks/Python.framework/Versions/3.10/include/python3.10/Python.h
```
## Create a Java Application (Python Script Runner)

After generating classes and sources you will create a single Java application file PythonMain.java to be run. Please cut and past the following into the PythonMain.java to be executed. File should reside in the panama-polyglot/python/src directory.

```java
import jdk.incubator.foreign.ResourceScope;
import jdk.incubator.foreign.SegmentAllocator;
import static jdk.incubator.foreign.MemoryAddress.NULL;
// import jextracted python 'header' class
import static org.python.Python_h.*;
import org.python.*;

public class PythonMain {
    public static void main(String[] args) {

        var script = "print(\"Hello World!!!\") ";
        Py_Initialize();
        try (var scope = ResourceScope.newConfinedScope()) {
            var allocator = SegmentAllocator.nativeAllocator(scope);
            var str = allocator.allocateUtf8String(script);
            PyRun_SimpleStringFlags(str, NULL);
            Py_Finalize();
            Py_Exit(0);
        }
    }
}
```

## Execute Java Python Script Runner App

Assuming you are in the panama-polyglot/python directory let's run the PythonMain.java application. To run the above code enter the following:

```shell
java -cp classes \
  --enable-native-access=ALL-UNNAMED \
  --add-modules jdk.incubator.foreign  \
  -Djava.library.path=/Library/Frameworks/Python.framework/Versions/3.10/lib \
  src/PythonMain.java
```

The output shows the following:
```text
Hello World!!!
```
