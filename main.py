import sys

from PyQt5.QtGui import QGuiApplication, QFont, QFontDatabase
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, QTranslator, QUrl

from trans import Trans

if __name__ == "__main__":
    app = QGuiApplication([])

    font_id = QFontDatabase.addApplicationFont("fonts/TitilliumWeb-Regular.ttf")
    app.setFont(QFont(QFontDatabase.applicationFontFamilies(font_id)[0]))

    engine = QQmlApplicationEngine()
    trans = Trans(engine)
    engine.rootContext().setContextProperty("trans", trans)
    engine.load("main.qml")

    sys.exit(app.exec_())
