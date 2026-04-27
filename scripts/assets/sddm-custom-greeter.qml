import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height

    // Background Image (Matched to Lockscreen)
    Image {
        id: background
        anchors.fill: parent
        source: "file:///home/init0/.config/backgrounds/032.jpg"
        fillMode: Image.PreserveAspectCrop
    }

    // Overlay (Subtle indigo tint)
    Rectangle {
        anchors.fill: parent
        color: "#0d0f18"
        opacity: 0.15
    }

    // Clock - Shadow/Depth Layer
    Text {
        id: timeShadow
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -116
        anchors.horizontalCenterOffset: 4
        text: Qt.formatTime(new Date(), "HH:mm")
        color: "#cc0d0f18"
        font.pixelSize: 140
        font.bold: true
        font.family: "Hack Nerd Font"
    }

    // Clock - Main Layer
    Text {
        id: timeLabel
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -120
        text: Qt.formatTime(new Date(), "HH:mm")
        color: "#c0caf5"
        font.pixelSize: 140
        font.bold: true
        font.family: "Hack Nerd Font"
    }

    // Date
    Text {
        id: dateLabel
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -15
        text: Qt.formatDate(new Date(), "dddd, dd MMMM")
        color: "#bb9af7"
        font.pixelSize: 22
        font.family: "Hack Nerd Font"
    }

    // Greeting
    Text {
        id: greeting
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 80
        text: "Welcome back, Mercyyy"
        color: "#c0caf5"
        font.pixelSize: 20
        font.family: "Hack Nerd Font"
    }

    // Input Field
    Item {
        id: passwordBox
        width: 280
        height: 50
        anchors.centerIn: parent
        anchors.verticalCenterOffset: 140

        TextInput {
            id: passwordInput
            width: 0; height: 0
            echoMode: TextInput.Password
            focus: true
            visible: false
            Keys.onEnterPressed: submitLogin()
            Keys.onReturnPressed: submitLogin()
        }

        Rectangle {
            anchors.fill: parent
            color: "#990d0f18"
            radius: 20
            border.color: passwordInput.activeFocus ? "#7dcfff" : "#3b4261"
            border.width: 2

            Text {
                anchors.centerIn: parent
                text: "<i>Welcome back, Mercyyy</i>"
                color: "#7dcfff"
                font.pixelSize: 16
                font.family: "Hack Nerd Font"
                opacity: passwordInput.text.length === 0 ? 0.7 : 0.0
                Behavior on opacity { NumberAnimation { duration: 200 } }
            }

            Row {
                anchors.centerIn: parent
                spacing: 10
                visible: passwordInput.text.length > 0
                Repeater {
                    model: passwordInput.text.length
                    delegate: Rectangle {
                        width: 10; height: 10; radius: 5
                        color: "#c0caf5"
                        scale: 0.3
                        Component.onCompleted: PropertyAnimation { target: parent; property: "scale"; to: 1.0; duration: 200; easing.type: Easing.OutBack }
                    }
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: passwordInput.forceActiveFocus()
        }
    }

    Text {
        id: errorMessage
        anchors.top: passwordBox.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#f7768e"
        font.pixelSize: 14
        text: ""
    }

    function submitLogin() {
        if (passwordInput.text !== "") {
            var sessionIndex = sddm.lastSessionIndex > -1 ? sddm.lastSessionIndex : 1; // Default to sway-nvidia (index 1) if no last session
            sddm.login("init0", passwordInput.text, sessionIndex)
        }
    }

    Connections {
        target: sddm
        function onLoginFailed() {
            errorMessage.text = "Login failed <b>(1)</b>"
            passwordInput.text = ""
            passwordInput.focus = true
        }
    }

    Timer {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            timeLabel.text = Qt.formatTime(new Date(), "HH:mm")
            timeShadow.text = timeLabel.text
            dateLabel.text = Qt.formatDate(new Date(), "dddd, dd MMMM")
        }
    }
}
