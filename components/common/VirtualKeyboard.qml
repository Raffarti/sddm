import QtQuick ${COMPONENTS_VERSION}

Rectangle{
  property bool loaded

  id: keyboard
  property string _import
  property string _component
  Component.onCompleted: {
    var kbd = Qt.createQmlObject("import QtQuick ${COMPONENTS_VERSION}; import "+_import+";"+_component + "{ }",keyboard);
    if (kbd){
        loaded = true
    } else {
        loaded = false
        return
    }
    keyboard.height = kbd.height
    keyboard.width = kbd.width
    kbd.anchors.fill = keyboard
  }
}
