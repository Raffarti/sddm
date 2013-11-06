
import QtQuick ${COMPONENTS_VERSION}
import SddmComponents ${COMPONENTS_VERSION}

Rectangle {
  width: screenModel.geometry.width
  height: screenModel.geometry.height
  
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
  }
}
