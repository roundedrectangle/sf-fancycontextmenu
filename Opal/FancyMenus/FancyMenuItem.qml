import QtQuick 2.0
import Sailfish.Silica 1.0

FancyIconMenuItem {
    property int __silica_menuitem
    width: parent.width

    signal earlyClick
    signal delayedClick

    onSizeChanged: if (size) console.warn("FancyAloneMenuItem::size is ignored.")
}
