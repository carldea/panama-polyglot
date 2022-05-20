export C_INCLUDE_PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include

jextract -d classes \
   -t org.rust \
   -l myrustlibrary \
   -- lib.h
