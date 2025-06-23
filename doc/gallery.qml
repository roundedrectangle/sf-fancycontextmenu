//@ This file is part of Opal.FancyMenus for use in harbour-opal-gallery.
//@ https://github.com/Pretty-SFOS/opal-fancymenus
//@ SPDX-License-Identifier: GPL-3.0-or-later
//@ SPDX-FileCopyrightText: 2023-2024 Mirian Margiani
//@ SPDX-FileCopyrightText: 2024 roundedrectangle

import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import Opal.FancyMenus 1.0 as M

S.Page {
    id: root
    allowedOrientations: S.Orientation.All

    S.SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height + S.Theme.paddingLarge

        S.VerticalScrollDecorator { flickable: flick }

        M.FancyPullDownMenu {
            M.FancyMenuRow {
                M.IconRowMenuItem {
                    icon.source: "image://theme/icon-m-delete"
                    enabled: false
                }
                M.IconRowMenuItem {
                    icon.source: "image://theme/icon-m-clipboard"
                    onClicked: S.Notices.show(qsTr("Copied"))
                }
                M.IconRowMenuItem {
                    icon.source: "image://theme/icon-m-favorite"
                    onClicked: S.Notices.show(qsTr("Favorited"))
                }
            }
            M.FancyMenuRow {
                M.IconTextRowMenuItem {
                    icon.source: "image://theme/icon-m-message-reply"
                    text: qsTr("Reply")
                    onClicked: S.Notices.show(qsTr("Replied"))
                }
                M.IconTextRowMenuItem {
                    icon.source: "image://theme/icon-m-message-forward"
                    text: qsTr("Forward")
                    onClicked: S.Notices.show(qsTr("Forwarded"))
                }
            }
            S.MenuItem {
                text: qsTr("Download")
                onClicked: S.Notices.show(qsTr("Downloaded"))
            }
        }

        // TODO: fix having both PullDownMenu and PushUpMenu
        /*M.FancyPushUpMenu {

        }*/


        Column {
            id: column
            width: parent.width
            spacing: S.Theme.paddingMedium

            S.PageHeader {
                title: qsTr("Fancy ContextMenus")
            }

            S.SectionHeader {
                text: qsTr("Example")
            }

            S.ListItem {
                contentHeight: label1.height + 2*label2.y
                S.Label {
                    id: label1
                    x: S.Theme.horizontalPageMargin
                    y: S.Theme.paddingLarge
                    width: root.width - 2*x
                    wrapMode: Text.Wrap
                    text: qsTr("Press to open context menu")
                }

                onClicked: openMenu()
                menu: Component {
                    M.FancyContextMenu {
                        listItem: parent
                        M.FancyMenuRow {
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-delete"
                                enabled: false
                            }
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-clipboard"
                                onClicked: S.Notices.show(qsTr("Copied"))
                            }
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-favorite"
                                onClicked: S.Notices.show(qsTr("Favorited"))
                            }
                        }
                        M.FancyMenuRow {
                            M.IconTextRowMenuItem {
                                icon.source: "image://theme/icon-m-message-forward"
                                text: qsTr("Forward")
                                onClicked: S.Notices.show(qsTr("Forwarded"))
                            }
                            M.IconTextRowMenuItem {
                                icon.source: "image://theme/icon-m-message-reply"
                                text: qsTr("Reply")
                                onClicked: S.Notices.show(qsTr("Replied"))
                            }
                        }
                        S.MenuItem {
                            text: qsTr("About this")
                            onClicked: S.Notices.show(qsTr("Information"))
                        }

                        M.FancyMenuItem {
                            icon.source: "image://theme/icon-m-favorite"
                            text: qsTr("Add to favorites")
                            onClicked: S.Notices.show(qsTr("Favorited"))
                        }

                    }
                }
            }

            S.SectionHeader {
                text: qsTr("Advanced usage")
            }

            S.Label {
                x: S.Theme.horizontalPageMargin
                anchors {
                    topMargin: S.Theme.paddingMedium
                    bottomMargin: S.Theme.paddingMedium
                }
                width: root.width - 2*x
                wrapMode: Text.Wrap
                font.pixelSize: S.Theme.fontSizeSmall
                color: S.Theme.highlightColor
                text: qsTr("The following examples cover advanced features such as custom sizes, icon direction, long texts, spacings, as well as short and icon-only text versions. Some of them might behave differently when screen is rotated.")
            }

            S.ListItem {
                contentHeight: label2.height + label2.y*2
                S.Label {
                    id: label2
                    x: S.Theme.horizontalPageMargin
                    y: S.Theme.paddingLarge
                    width: root.width - 2*x
                    wrapMode: Text.Wrap
                    text: qsTr("Press to open context menu covering some advanced features")
                }

                onClicked: openMenu()
                menu: Component {
                    M.FancyContextMenu {
                        listItem: parent

                        M.FancyMenuItem {
                            direction: Qt.RightToLeft
                            icon.source: "image://theme/icon-m-rotate-right"
                            text: qsTr("Icon on the right side")
                        }

                        M.FancyMenuRow {
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-question"
                            }
                            M.RowMenuItem {
                                text: qsTr("Long text is resized")
                            }
                            M.RowMenuItem {
                                text: qsTr("Truncated super long text which will not fit even when resized goes here")
                            }
                        }

                        M.FancyMenuRow {
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-image"
                            }
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-media-radio"
                            }
                            M.IconTextRowMenuItem {
                                direction: Qt.RightToLeft
                                icon.source: "image://theme/icon-m-message-forward"
                                size: 2
                                text: qsTr("Sizing")
                            }
                        }

                        M.FancyMenuItem {
                            icon.source: "image://theme/icon-m-about"
                            // no text
                        }
                    }
                }
            }

            S.TextSwitch {
                id: deletionSwitch
                text: qsTr("Allow deleting")
                checked: true
            }

            S.TextSwitch {
                id: backSwitch
                text: qsTr("Allow going backwards")
            }

            S.ListItem {
                contentHeight: label3.height + label3.y*2
                S.Label {
                    id: label3
                    x: S.Theme.horizontalPageMargin
                    y: S.Theme.paddingLarge
                    width: root.width - 2*x
                    wrapMode: Text.Wrap
                    text: qsTr("Press to open context menu covering other advanced features")
                }

                onClicked: openMenu()
                menu: Component {
                    M.FancyContextMenu {
                        M.FancyMenuRow {
                            spacing: S.Theme.itemSizeExtraSmall
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-image"
                            }
                            M.RowMenuItem {
                                size: 1.5
                                text: qsTr("Spacing")
                            }
                            M.IconRowMenuItem {
                                icon.source: "image://theme/icon-m-home"
                            }
                        }
                        M.FancyMenuRow {
                            // Ratio 2 means that item occupies 1/2 of the screen
                            checkShort: function (ratio, size) { return isPortrait && ratio >= 2 }

                            M.RowMenuItem {
                                visible: deletionSwitch.checked
                                shortText: qsTr("Delete")
                                longText: qsTr("Delete message")
                            }
                            M.RowMenuItem {
                                shortText: qsTr("Edit")
                                longText: qsTr("Edit message")
                            }
                        }
                        M.FancyMenuRow {
                            checkIconOnly: function (ratio) { return /*S.Screen.sizeCategory <= Screen.medium && */ isPortrait && ratio >= 3 }
                            checkShort: function (ratio) { return /*S.Screen.sizeCategory <= Screen.medium && */ isPortrait && ratio >= 2 }

                            M.IconTextRowMenuItem {
                                icon.source: "image://theme/icon-m-previous"
                                visible: backSwitch.checked
                                shortText: qsTr("Back")
                                longText: qsTr("Previous track")
                            }
                            M.IconTextRowMenuItem {
                                icon.source: "image://theme/icon-m-play"
                                shortText: qsTr("Play")
                                longText: qsTr("Resume playback")
                            }
                            M.IconTextRowMenuItem {
                                icon.source: "image://theme/icon-m-next"
                                shortText: qsTr("Next")
                                longText: qsTr("Next track")
                            }
                        }
                    }
                }
            }
        }
    }
}