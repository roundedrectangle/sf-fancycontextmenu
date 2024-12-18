//@ This file is part of Opal.FancyContextMenu for use in harbour-opal-gallery.
//@ https://github.com/Pretty-SFOS/opal-fancycontextmenu
//@ SPDX-License-Identifier: GPL-3.0-or-later
//@ SPDX-FileCopyrightText: 2023-2024 Mirian Margiani
//@ SPDX-FileCopyrightText: 2024 roundedrectangle

import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import '../modules/FancyContextMenu' as M

S.Page {
    id: root
    allowedOrientations: S.Orientation.All

    S.SilicaFlickable {
        id: flick
        anchors.fill: parent
        contentHeight: column.height + S.Theme.horizontalPageMargin

        S.VerticalScrollDecorator { flickable: flick }

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
                S.Label {
                    x: S.Theme.horizontalPageMargin
                    y: S.Theme.paddingLarge
                    width: root.width - 2*x
                    wrapMode: Text.Wrap
                    text: qsTr("Press and hold to open context menu")
                }

                menu: Component {
                    M.FancyContextMenu {
                        listItem: parent
                        M.FancyMenuRow {
                            M.FancyMenuItem {
                                text: qsTr("Text action")
                            }
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-clipboard"
                            }
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-favorite"
                            }
                        }
                        M.FancyMenuRow {
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-delete"
                            }
                            M.FancyMenuItem {
                                text: qsTr("Long Long Long Text Action")
                            }
                            M.FancyIconMenuItem {
                                icon.source: "image://theme/icon-m-reply"
                                text: qsTr("Reply")
                            }
                        }
                        S.MenuItem {
                            text: qsTr("Basic item")
                        }

                        M.FancyAloneIconMenuItem {
                            icon.source: "image://theme/icon-m-about"
                            text: qsTr("About this")
                        }

                    }
                }
            }

            S.SectionHeader {
                text: qsTr("Advanced usage")
            }

            S.Label {
                x: S.Theme.horizontalPageMargin
                width: root.width - 2*x
                wrapMode: Text.Wrap
                text: qsTr("This is a more complex scenario.")
                color: S.Theme.highlightColor
            }
        }
    }
}
