# Translating QML

Demonstration of dynamic switching between languages in QML application.

![Dynamic switching between languages in QML application](/images/demo.gif?raw=true "Dynamic switching between languages in QML application")

Created with Qt 5.7.

Beside buiding the app, you also need to compile translation files `.ts` into `.qm` wtih **Qt Translator** or **lrelease** tool and then place them into `i18n` folder within the build directory.

For more details read this article: https://retifrav.github.io/blog/2017/01/04/translating-qml-app/