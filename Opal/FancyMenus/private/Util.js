function findHighlightRectangle(item) {
    var bar
    // find highlight rectangle
    for (var i=0; i<item.data.length; i++) {
        var childItem = item.data[i]
        if (childItem.hasOwnProperty("highlightedItem"))
            // got the highlightbar
            bar = childItem
    }
    if (!bar)
        console.log("HighlightBar not found!")
    return bar
}
