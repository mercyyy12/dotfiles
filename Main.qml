import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import SddmComponents 2.0

Rectangle {
    id: root
    width: 1920
    height: 1080

    // Background Image
    Image {
        id: background
        anchors.fill: parent
        source: config.background ? Qt.resolvedUrl(config.background) : ""
        fillMode: Image.PreserveAspectCrop
    }

    // Tokyo Night Dark/Blur Overlay
    Rectangle {
        anchors.fill: parent
        color: "#1a1b26"
        opacity: 0.6
    }

    // Live Clock Timer
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            var d = new Date()
            var hours = d.getHours().toString().padStart(2, '0')
            var minutes = d.getMinutes().toString().padStart(2, '0')
            timeLabel.text = hours + ":" + minutes
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 25

        Text {
            id: timeLabel
            anchors.horizontalCenter: parent.horizontalCenter
            text: Qt.formatTime(new Date(), "HH:mm")
            color: "#c0caf5"
            font.pixelSize: 120
            font.bold: true
            // Fallback font just in case Hack Nerd Font isn't loaded by SDDM yet
            font.family: "monospace" 
        }

        Text {
            id: greeting
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Hi there, NoMercyyy!"
            color: "#c0caf5"
            font.pixelSize: 20
            font.family: "monospace"
        }

        Item {
            width: 300
            height: 50
            anchors.horizontalCenter: parent.horizontalCenter

            // Password container (Glassmorphism look)
            Rectangle {
                anchors.fill: parent
                color: "#3b4261"
                radius: 25
                border.color: passwordInput.activeFocus ? "#7aa2f7" : "#414868"
                border.width: 2
            }

            TextInput {
                id: passwordInput
                anchors.fill: parent
                anchors.margins: 15
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                color: "#c0caf5"
                font.pixelSize: 18
                echoMode: TextInput.Password
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
                clip: true
                focus: true
                passwordCharacter: "•"
                
                Text {
                    anchors.centerIn: parent
                    text: "Password..."
                    color: "#565f89"
                    font.pixelSize: 18
                    font.italic: true
                    visible: !passwordInput.text && !passwordInput.activeFocus
                }

                Keys.onEnterPressed: submitLogin()
                Keys.onReturnPressed: submitLogin()
            }
        }
        
        Text {
            id: errorMessage
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#f7768e"
            font.pixelSize: 14
            text: ""
            visible: text !== ""
        }
    }

    function submitLogin() {
        if (passwordInput.text !== "") {
            // Logs in user 'init0' automatically
            sddm.login("init0", passwordInput.text, sessionModel.lastIndex)
        }
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {
            errorMessage.text = ""
        }
        function onLoginFailed() {
            errorMessage.text = "Login failed <b>(1)</b>"
            passwordInput.text = ""
            passwordInput.focus = true
        }
    }

    Component.onCompleted: {
        passwordInput.focus = true
    }
}
