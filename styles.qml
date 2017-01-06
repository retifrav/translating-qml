pragma Singleton
import QtQuick 2.7
import QtQuick.Window 2.0

Item {
    // primary font size for texts and tabs
    property int primaryFontSize: 60 / Screen.pixelDensity * Screen.devicePixelRatio
    // secondary font size for buttons and inputs
    property int secondaryFontSize: 40 / Screen.pixelDensity * Screen.devicePixelRatio
    // selected color
    property string selectedColor: "#60BD51"
}
