import QtQuick ${COMPONENTS_VERSION}
import SddmComponents ${COMPONENTS_VERSION}

Rectangle {
  property variant geometry: screenModel.geometry(screenModel.primary)
  width: geometry.width
  height: geometry.height
  x: geometry.x
  y: geometry.y
  color: "transparent"

  Rectangle {
    id: container
    
    Component.onCompleted: {
      var comp = Qt.createComponent(themePath)
      var theme = comp.createObject(container)
    }
  }
  
  VirtualKeyboard{
    id: vkbd
    startupLoad: false
    anchors.top: vkbd_btn.bottom
    anchors.left: vkbd_btn.left
    

    _import: kbd_import
    _component: kbd_component
  }
  Rectangle {
    id: vkbd_state
    color: "#80FFFFFF"
    
    width: 450
    height: 150
    anchors.top: vkbd_btn.bottom
    anchors.left: vkbd_btn.left
    Text {
      anchors.fill: parent
      font.pointSize: 20
      horizontalAlignment: Text.AlignHCenter
      verticalAlignment: Text.AlignVCenter
      
      color: "red"
      
      text: "Cannot display the virtual keyboard,<br>'" + kbd_import + "'<br> is not installed or fails to load."
      
    }
  }
  
  
  Item {
      visible: !config.hideDefaultKeyboardBtn
      id: vkbd_btn

      x: 0
      y: geometry.height - height

      height: 35
      width: 150

      Rectangle {
	  id: vkbd_btn_text
	  anchors.left: vkbd_btn_drag_area.right
	  anchors.bottom: parent.bottom
	  anchors.right: parent.right
	  height: 17
	  color: "#80000000"
	  Text {
	      color: "#80ffffff"
	      anchors.fill: parent
	      text: "Virtual Keyboard"
	      font.pixelSize: 12
	      horizontalAlignment: Text.AlignHCenter
	      verticalAlignment: Text.AlignVCenter
	      font.capitalization: Font.SmallCaps
	  }
      }

      Rectangle{
	  id: vkbd_btn_drag_area
	  anchors.left: parent.left
	  anchors.bottom: parent.bottom
	  anchors.top: parent.top
	  width: height
	  color: "#80000000"
	  
	  Text{
	      color: "#80ffffff"
	      anchors.fill: parent
	      font.pixelSize: 15
	      text: "  ⇗\nPull "
	      horizontalAlignment: Text.AlignHCenter
	      verticalAlignment: Text.AlignVCenter
	      font.capitalization: Font.SmallCaps
	  }
	  
	  MouseArea {
	      anchors.fill: parent
	      drag.target: vkbd_btn
	      drag.axis: Drag.XandYAxis
	      drag.minimumX: 0
	      drag.maximumX: geometry.width - vkbd_btn.width
	      drag.minimumY: 0
	      drag.maximumY: geometry.height - vkbd_btn.height
	      onPressed:{
		if (!vkbd.loaded && !vkbd.broken){
		  vkbd.load()
		  if (vkbd.broken) return;
		  else vkbd_state.visible = false
		  if (vkbd.implicitWidth < geometry.width) vkbd.width = vkbd.implicitWidth
		  else {
		    drag.axis = Drag.YAxis
		    vkbd_btn.x = 0
		    vkbd.width = geometry.width
		  }
		  if (vkbd.implicitHeight < geometry.height / 5) vkbd.height = vkbd.implicitHeight
		  else vkbd.height = geometry.height / 5
		}
	      }
	  }
      }
  }
}
