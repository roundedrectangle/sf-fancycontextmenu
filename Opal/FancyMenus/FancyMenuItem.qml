import QtQuick 2.0
import Sailfish.Silica 1.0
import "private"

FadeableHorizontalMenuItem {
    property real size: 1
    width: parent.itemWidth * size
    property bool _calculateWidth: true
    onVisibleChanged: if (parent.calculateItemWidth && _calculateWidth) parent.calculateItemWidth()
}
