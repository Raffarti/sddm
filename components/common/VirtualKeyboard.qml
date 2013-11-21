import QtQuick ${COMPONENTS_VERSION}

Rectangle{
  property bool loaded
  property bool broken
  property bool startupLoad: true

  id: keyboard
  property string _import
  property string _component
  Component.onCompleted: if (startupLoad) load()
  function load(){
    var kbd = Qt.createQmlObject("import QtQuick ${COMPONENTS_VERSION}; import "+_import+";"+_component + "{ }",keyboard);
    if (kbd){
        loaded = true
    } else {
        loaded = false
        broken = true
        return
    }
    keyboard.implicitHeight = kbd.height
    keyboard.implicitWidth = kbd.width
    kbd.anchors.fill = keyboard
  }
}
