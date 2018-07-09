import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2 as QQC2
import QtQuick.Controls 1.4 as QQC1
import QtQuick.Controls.Styles 1.4


Window {
    id: window
    visible: true
    width: 640
    height: 480
    color: "#eee"
    title: qsTr("Add contact")

    Column {
        id: column
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        spacing: 10

        Repeater{
            id:repeater
            model: ["Name", "Surname", "Company", "Phone"]

            Row{
                id: row
                spacing: 10

                Text{
                    id:label
                    text: modelData + ":"
                    height: field.height
                    verticalAlignment: Text.AlignVCenter
                }

                QQC2.TextField{
                    id: field
                    width: column.width - label.width - row.spacing
                    placeholderText: modelData
                }
            }
        }



        Text{
            id: title
            text:"Notes:"
        }

        QQC1.TextArea{
            id:textAr
            width: parent.width
            height: parent.height - y - button.height - column.spacing
            wrapMode: Text.WordWrap

            style: TextAreaStyle {
                transientScrollBars: true
                scrollToClickedPosition: true
                selectionColor: "#fff"
                selectedTextColor: "#000"
            }
        }

        QQC2.Button {
            id: button
            text: qsTr("Save")
            anchors.right: parent.right
            anchors.rightMargin: 0
        }

    }
}
