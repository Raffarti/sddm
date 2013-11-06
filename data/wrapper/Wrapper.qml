
import QtQuick ${COMPONENTS_VERSION}
import SddmComponents ${COMPONENTS_VERSION}

Rectangle {
  width: screenModel.geometry.width
  height: screenModel.geometry.height
  color: "transparent"

  Rectangle {
    id: container
    anchors.top: parent.top
    anchors.right: parent.right
    anchors.left: parent.left
    anchors. bottom: vkbd.top
    
    Component.onCompleted: {
      var comp = Qt.createComponent(themePath)
      var theme = comp.createObject(container)
      theme.anchors.fill = container
    }
  }
  
  VirtualKeyboard{
    id: vkbd
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    anchors.left: parent.left
    
    visible: false
    height: 0

    _import: kbd_import
    _component: kbd_component
  }

  function isKeyboardLoaded(){
      return vkbd.loaded
  }

  function isKeyboardVisible(){
      return isKeyboardLoaded() && vkbd.visible
  }

  function toggleKeyboard(visible){
      vkbd.visible = visible
      vkbd.height = visible?vkbd.implicitHeight:0
  }

  Rectangle {
      visible: !config.hideDefaultKeyboardBtn
      id: vkbd_btn

      color: "#000000"
      anchors.left: parent.left
      anchors.bottom: vkbd.top

      height: 17
      width: 105

      Text {
          color: "#ffffff"
          anchors.fill: parent
          text: "Virtual Keyboard"
          font.pixelSize: 12
          horizontalAlignment: Text.AlignJustify
          verticalAlignment: Text.AlignVCenter
      }

      MouseArea {
          anchors.fill: parent
          onClicked: toggleKeyboard(!isKeyboardVisible())
      }
  }
}
