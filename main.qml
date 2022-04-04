import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

/*****************************************/
import mt.examples.BackEndClass 1.0
/*****************************************/

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")


    /*****************************************/
    BackEndClass{
        id: myBackEndClass
    }
    /*****************************************/


    ColumnLayout{
        height: 300
        spacing: 2
            anchors.fill: parent
            Rectangle {
                color: "green"
                Layout.fillWidth: true
                height: 40
                Text {
                    text: "QML/C++ Integration Example"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    width:parent.width
                    height:parent.height
                    font.family: "Helvetica"
                    font.pointSize: 12
                    color: "white"
                }
            }
            // Mesaj satirir
            RowLayout{
                Layout.fillWidth: true
                Rectangle {
                    color: "red"
                    width: 200
                    height: 40
                    Text {
                        text: "Message: "
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width:parent.width
                        height:parent.height
                        font.family: "Helvetica"
                        font.pointSize: 12
                        color: "white"
                    }
                }
                Rectangle {
                    color: "brown"
                    Layout.fillWidth: true
                    height: 40
                    Text {
                        id: getMessageText
                        text: myBackEndClass.Message
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width:parent.width
                        height:parent.height
                        font.family: "Helvetica"
                        font.pointSize: 12
                        color: "white"
                    }

                    Text {
                        id: sendMessageText
                        x: -142
                        y: 253
                        width: parent.width
                        height: parent.height
                        color: "#ffffff"
                        text: "#myBackEndClass.Message#"
                        z: 2
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        font.family: "Helvetica"
                        font.pointSize: 12

                        Button {
                            id: button
                            x: 396
                            y: 84
                            text: qsTr("SEND MESSAGE")
                            onClicked: {
                                myBackEndClass.Message = textInput.text

                                getMessageText.text = myBackEndClass.Message
                            }
                        }

                    }
                }
            }
            // Sayac satiri
            RowLayout{
                Layout.fillWidth: true
                Rectangle {
                    color: "red"
                    width: 200
                    height: 40
                    Text {
                        text: "Counter: "
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width:parent.width
                        height:parent.height
                        font.family: "Helvetica"
                        font.pointSize: 12
                        color: "white"
                    }
                }
                Rectangle {
                    color: "brown"
                    Layout.fillWidth: true
                    height: 40
                    Text {
                        id:counterText
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        width:parent.width
                        height:parent.height
                        font.family: "Helvetica"
                        font.pointSize: 12
                        color: "white"
                    }
                }
                Button{
                    text:"Update Counter"
                    onClicked:{
                        counterText.text = String(myBackEndClass.incrementCounter())
                    }
                }
                Button{
                    text:"Reset Counter"
                    onClicked:{
                        myBackEndClass.resetCounter()
                        counterText.text = String(myBackEndClass.incrementCounter())
                    }
                }
            }
            Rectangle{
                width: 639
                height: 108
                color:"blue"
                z: -1
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            TextInput {
                id: textInput
                width: 80
                height: 20
                text: qsTr("Text Input")
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 12

            }
    }

        Connections {
            target: textInput
            onEditingFinished:{
                myBackEndClass.Message = textInput.text

                getMessageText.text = myBackEndClass.Message
            }
        }
}
