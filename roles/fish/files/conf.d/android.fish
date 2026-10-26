set -gx ANDROID_HOME ~/Android/Sdk
set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk
fish_add_path -g $ANDROID_HOME/cmdline-tools/latest/bin $ANDROID_HOME/emulator ~/.local/share/flutter/bin
