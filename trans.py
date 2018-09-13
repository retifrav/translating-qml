from PyQt5.QtGui import QGuiApplication
from PyQt5.QtCore import pyqtSlot, QObject, QTranslator, pyqtSignal

class Trans(QObject):

    languageChanged = pyqtSignal()

    def __init__(self, engine):
        super().__init__()
        self.translator = QTranslator(self)
        self.engine = engine

    @pyqtSlot(str)
    def selectLanguage(self, language):
        if language == "en":
            # Reset to default
            QGuiApplication.removeTranslator(self.translator)
        else:
            tr_file = "translating-qml_{}".format(language)
            if not self.translator.load(tr_file, "./i18n"):
                raise RuntimeError(
                    "Failed to load translation file '{}'".format(tr_file))
            QGuiApplication.installTranslator(self.translator)
        self.engine.retranslate()

        self.languageChanged.emit()
