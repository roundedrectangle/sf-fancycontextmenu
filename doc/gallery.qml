//@ This file is part of Opal.FancyContextMenu for use in harbour-opal-gallery.
//@ https://github.com/Pretty-SFOS/opal-fancycontextmenu
//@ SPDX-License-Identifier: GPL-3.0-or-later
//@ SPDX-FileCopyrightText: 2023-2024 Mirian Margiani
//@ SPDX-FileCopyrightText: 2024 roundedrectangle

import QtQuick 2.0
import Sailfish.Silica 1.0 as S
import Opal.FancyContextMenu 1.0 as M

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
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-delete"
                                onClicked: undefined // Here goes your code
                            }
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-clipboard"
                            }
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-favorite"
                            }
                        }
                        M.FancyMenuRow {
                            M.FancyIconMenuItem {
                                icon.source: "image://theme/icon-m-message-reply"
                                text: qsTr("Reply")
                            }
                            M.FancyIconMenuItem {
                                icon.source: "image://theme/icon-m-message-forward"
                                text: qsTr("Forward")
                            }
                        }
                        S.MenuItem {
                            text: qsTr("About this")
                        }

                        M.FancyAloneMenuItem {
                            icon.source: "image://theme/icon-m-favorite"
                            text: qsTr("Add to favorites")
                        }

                    }
                }
            }

            S.SectionHeader {
                text: qsTr("Advanced usage")
            }

            S.ListItem {
                contentHeight: label2.height + label2.y*2
                S.Label {
                    id: label2
                    x: S.Theme.horizontalPageMargin
                    y: S.Theme.paddingLarge
                    width: root.width - 2*x
                    wrapMode: Text.Wrap
                    text: qsTr("Press to open context menu covering all advanced features")
                }

                onClicked: openMenu()
                menu: Component {
                    M.FancyContextMenu {
                        listItem: parent

                        M.FancyAloneMenuItem {
                            direction: Qt.RightToLeft
                            icon.source: "image://theme/icon-m-rotate-right"
                            text: qsTr("Icon on the right side")
                        }

                        M.FancyMenuRow {
                            M.FancyMenuIcon {
                                icon.source: "image://theme/icon-m-question"
                            }
                            M.FancyMenuItem {
                                text: qsTr("Long text is resized")
                            }
                            M.FancyMenuItem {
                                text: qsTr("Truncated super long text which will not fit even when resized goes here")
                            }
                        }

                        M.FancyMenuRow {
                            M.FancyIconMenuItem {
                                direction: Qt.RightToLeft
                                icon.source: "image://theme/icon-m-message-reply"
                                text: qsTr("Icon on the right")
                            }
                            M.FancyIconMenuItem {
                                direction: Qt.RightToLeft
                                icon.source: "image://theme/icon-m-message-forward"
                                text: qsTr("Icon on the right")
                            }
                        }

                        M.FancyAloneMenuItem {
                            icon.source: "image://theme/icon-m-about"
                            // no text
                        }
                    }
                }
            }
        }
    }
}
