import QtQuick ${COMPONENTS_VERSION}

Rectangle{
  id: keyboard
  property string _import: "sandkeys.theme.ClassicBlack 1.0"
  property string _component: "ClassicBlackKeyboard"
  Component.onCompleted: {
    var kbd = Qt.createQmlObject("import QtQuick ${COMPONENTS_VERSION}; import "+_import+";"+_component + "{ }",keyboard);
    keyboard.height = kbd.height
    keyboard.width = kbd.width
    kbd.anchors.fill = keyboard
  }
}
