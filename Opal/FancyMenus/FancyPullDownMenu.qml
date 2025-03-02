import QtQuick 2.0
import Sailfish.Silica 1.0
import 'private/Util.js' as Util

PullDownMenu {
    id: pulleyMenu
    property Item _highlightBar
    property bool listItem
    //property bool down: !_atInitialPosition

    Component.onCompleted: _highlightBar = Util.findHighlightRectangle(pulleyMenu)

    onPositionChanged: {
        // propagate x-position since jolla's contextmenu doesn't remember it.
        if (_highlightBar.highlightedItem && _highlightBar.highlightedItem.hasOwnProperty("xPos"))
            _highlightBar.highlightedItem.xPos = _contentColumn.mapFromItem(pulleyMenu, mouse.x, mouse.y).x
    }

    function resetHighlightbar() {
        if (!_highlightBar) return
        _highlightBar.x = x
        _highlightBar.width = width
    }

    on_AtInitialPositionChanged: if(_atInitialPosition) resetHighlightbar()
}
