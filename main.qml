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
    color: "#fff"
    title: qsTr("Add contact")

    Column {
        id: column
        spacing: 10
        anchors.bottom: button.top
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10

        Repeater{
            id:repeater
            model: ["Name", "Surname", "Company", "Phone"]
            width: parent.width
            height: (40 + column.spacing)*4 - column.spacing // не работает такой вариант: (field.height + column.spacing)*4 - column.spacing
                                                                         //высота Repeater(a) равна 0 в таком случае

            Row{
                id: row
                y: 50*index
                width: parent.width
                spacing: 10

                Text{
                    id:label
                    width: 60
                    height: field.height
                    text: modelData + ":"
                    verticalAlignment: Text.AlignVCenter
                }

                QQC2.TextField{
                    id: field
                    height: 40
                    width: parent.width - label.width - row.spacing
                    placeholderText: modelData
                }
            }
        }

        QQC1.TextArea{
            id:textAr
            width: parent.width
            height: parent.height - repeater.height - title.height - title.anchors.bottomMargin - column.spacing
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            wrapMode: Text.WordWrap

            style: TextAreaStyle {
                transientScrollBars: true
                scrollToClickedPosition: true
                selectionColor: "#fff"
                selectedTextColor: "#000"
            }


            Text{
                id: title
                text:"Notes:"
                anchors.bottom: textAr.top
                anchors.bottomMargin: 5
            }
        }

    }

    QQC2.Button {
        id: button
        text: qsTr("Save")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
    }
}
