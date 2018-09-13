import QtQuick 2.7
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.0
import "." // you have to have that for singleton

ApplicationWindow {
    id: root
    width: 800
    minimumWidth: 500
    height: 600
    minimumHeight: 600
    visible: true
    title: "Translating QML application"

    Column {
        width: parent.width * 0.95
        spacing: 15
        padding: 15

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                // text: "EN"
                Layout.preferredWidth: 76
                Layout.preferredHeight: 53
                Image {
                    anchors.fill: parent
                    opacity: parent.pressed ? 0.8 : 1
                    anchors.margins: 3
                    source: "./images/en.png"
                }

                background: Rectangle {
                    id: flag_en
                    color: "grey"
                    radius: 5

                    states: [
                        State {
                            name: "default"
                            PropertyChanges {
                                target: flag_en;
                                color: "grey"
                            }
                        },
                        State {
                            name: "clicked"
                            PropertyChanges {
                                target: flag_en;
                                color: Styles.selectedColor
                            }
                        }
                    ]
                }

                onClicked: {
                    onClicked: trans.selectLanguage("en");
                    highlightFlag("en");
                }
            }
            Rectangle
            {
                Layout.preferredWidth: 2
                Layout.fillHeight: true
                Layout.margins: 10
                color: "black"
            }
            Button {
                // text: "RU"
                Layout.preferredWidth: 76
                Layout.preferredHeight: 53
                Image {
                    anchors.fill: parent
                    opacity: parent.pressed ? 0.8 : 1
                    anchors.margins: 3
                    source: "./images/ru.png"
                }
                background: Rectangle {
                    id: flag_ru
                    color: "grey"
                    radius: 5

                    states: [
                        State {
                            name: "default"
                            PropertyChanges {
                                target: flag_ru;
                                color: "grey"
                            }
                        },
                        State {
                            name: "clicked"
                            PropertyChanges {
                                target: flag_ru;
                                color: Styles.selectedColor
                            }
                        }
                    ]
                }
                onClicked: {
                    onClicked: trans.selectLanguage("ru");
                    highlightFlag("ru");
                }
            }
            Rectangle
            {
                Layout.preferredWidth: 2
                Layout.fillHeight: true
                Layout.margins: 10
                color: "black"
            }
            Button {
                // text: "NO"
                Layout.preferredWidth: 76
                Layout.preferredHeight: 53
                Image {
                    anchors.fill: parent
                    opacity: parent.pressed ? 0.8 : 1
                    anchors.margins: 3
                    source: "./images/no.png"
                }
                background: Rectangle {
                    id: flag_no
                    color: "grey"
                    radius: 5

                    states: [
                        State {
                            name: "default"
                            PropertyChanges {
                                target: flag_no;
                                color: "grey"
                            }
                        },
                        State {
                            name: "clicked"
                            PropertyChanges {
                                target: flag_no;
                                color: Styles.selectedColor
                            }
                        }
                    ]
                }
                onClicked: {
                    onClicked: trans.selectLanguage("no");
                    highlightFlag("no");
                }
            }
            Rectangle
            {
                Layout.preferredWidth: 2
                Layout.fillHeight: true
                Layout.margins: 10
                color: "black"
            }
            Button {
                // text: "DE"
                Layout.preferredWidth: 76
                Layout.preferredHeight: 53
                Image {
                    anchors.fill: parent
                    opacity: parent.pressed ? 0.8 : 1
                    anchors.margins: 3
                    source: "./images/de.png"
                }
                background: Rectangle {
                    id: flag_de
                    color: "grey"
                    radius: 5

                    states: [
                        State {
                            name: "default"
                            PropertyChanges {
                                target: flag_de;
                                color: "grey"
                            }
                        },
                        State {
                            name: "clicked"
                            PropertyChanges {
                                target: flag_de;
                                color: Styles.selectedColor
                            }
                        }
                    ]
                }
                onClicked: {
                    onClicked: trans.selectLanguage("de");
                    highlightFlag("de");
                }
            }
        }

        Label {
            topPadding: 15
            font.pixelSize: Styles.primaryFontSize
            text: qsTr("When the communism will come, everything'll be fuckin A!<br/>"
                       + "It will come very soon - we just only need to wait!<br/>"
                       + "All the stuff will be for free, everything will be so cool!<br/>"
                       + "There will probably no need to even die no matter what!")
                  //+ trans.emptyString
        }

        Label {
            font.pixelSize: Styles.primaryFontSize
            text: qsTr("I woke up after midnight and realised - <b>IT DOES</b>!<br/>"
                       + "Everything goes according to the plan.")
                  //+ trans.emptyString
        }

        Label {
            font.pixelSize: Styles.primaryFontSize
            text: qsTr("<font color='blue'><i>Egor Letov</i></font>")
                  //+ trans.emptyString
        }

        Button {
            text: qsTr("Simple button") //+ trans.emptyString
            font.pixelSize: Styles.primaryFontSize
            onClicked: console.log(qsTr("Some output into console")) //+ trans.emptyString)

            ToolTip.visible: pressed
            ToolTip.text: qsTr("Some tooltip") //+ trans.emptyString
        }

        Tumbler {
            width: 150 //parent.width / 3
            background: Rectangle {
                border.color: "grey"
                border.width: 1
            }

            delegate: ItemDelegate {
                // because you cannot do scripts in model(?)
                text: qsTr(model.title) //+ trans.emptyString
                opacity: 0.4 + Math.max(0, 1 - Math.abs(Tumbler.displacement)) * 0.6
                font.pixelSize: Styles.secondaryFontSize;
            }
            model: ListModel {
                ListElement { title: qsTr("key"); }
                ListElement { title: qsTr("game"); }
                ListElement { title: qsTr("sickle"); }
                ListElement { title: qsTr("hammer"); }
                ListElement { title: qsTr("star"); }
                ListElement { title: qsTr("lantern"); }
            }
            visibleItemCount: 5
        }
    }

    Component.onCompleted: {
        flag_en.state = "clicked";
    }

    function highlightFlag(lang)
    {
        switch (lang)
        {
        case "en":
            flag_en.state = "clicked";
            flag_ru.state = flag_no.state = flag_de.state = "default";
            break;
        case "ru":
            flag_ru.state = "clicked";
            flag_en.state = flag_no.state = flag_de.state = "default";
            break;
        case "no":
            flag_no.state = "clicked";
            flag_en.state = flag_ru.state = flag_de.state = "default";
            break;
        case "de":
            flag_de.state = "clicked";
            flag_en.state = flag_ru.state = flag_no.state = "default";
            break;
        }
    }
}
