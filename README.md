# Translating QML

Demonstration of dynamic switching between languages in QML application.

![Dynamic switching between languages in QML application](/images/demo.gif?raw=true "Dynamic switching between languages in QML application")

Note, that Qt versions before 5.10 do not yet have [QQmlEngine::retranslate()](http://doc.qt.io/qt-5/qqmlengine.html#retranslate), and then you'll have to use the *empty string* magic trick.

For more details read the following article: https://retifrav.github.io/blog/2017/01/04/translating-qml-app/

# Building/running the application

## Compile translation files

Use **Qt Translator** or the **lrelease** command line tool:

    lrelease i18n/*.ts

## C++

    mkdir build && cd build
    qmake .. && make && ./translating-qml

## Python (version >= 3.5)

    pip install PyQt  # has to be version >= 5.10
    python main.py
