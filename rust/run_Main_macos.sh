#!/bin/bash

java --add-modules jdk.incubator.foreign \
   --enable-native-access=ALL-UNNAMED \
   -Djava.library.path=./target/debug \
   -cp classes \
   Main.java
