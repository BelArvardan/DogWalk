import QtQuick
import org.kde.ksvg as KSvg
import QtQuick.Layouts
import org.kde.ksysguard.sensors as Sensors
import org.kde.kirigami as Kirigami
import org.kde.plasma.components as PlasmaComponents3
import org.kde.plasma.plasmoid

Item {
    id: compactRepresentation
    Layout.minimumHeight: root.inPanel ? Layout.preferredHeight : -1
    Layout.preferredWidth: grid.width
    Layout.preferredHeight: grid.height
    enum LayoutType {
        HorizontalPanel,
        VerticalPanel,
        HorizontalDesktop,
        VerticalDesktop,
        IconOnly
    }
    property int layoutForm
    Binding on layoutForm {
        delayed: true
        value: {
            if (root.inPanel) {
                return root.isVertical ? CompactRepresentation.LayoutType.VerticalPanel : CompactRepresentation.LayoutType.HorizontalPanel
            }
            if (compactRepresentation.parent.width
                    - svgItem.Layout.preferredWidth >= label.contentWidth) {
                return CompactRepresentation.LayoutType.HorizontalDesktop
            }
            if (compactRepresentation.parent.height
                    - svgItem.Layout.preferredHeight >= label.contentHeight) {
                return CompactRepresentation.LayoutType.VerticalDesktop
            }
            return CompactRepresentation.LayoutType.IconOnly
        }
    }
    GridLayout {
        id: grid
        width: {
            switch (compactRepresentation.layoutForm) {
            case CompactRepresentation.LayoutType.HorizontalPanel:
            case CompactRepresentation.LayoutType.HorizontalDesktop:
                return implicitWidth
            case CompactRepresentation.LayoutType.VerticalPanel:
            case CompactRepresentation.LayoutType.VerticalDesktop:
                return compactRepresentation.parent.width
            }
        }
        height: {
            switch (compactRepresentation.layoutForm) {
            case CompactRepresentation.LayoutType.HorizontalPanel:
            case CompactRepresentation.LayoutType.HorizontalDesktop:
            case CompactRepresentation.LayoutType.VerticalDesktop:
                return compactRepresentation.parent.height
            case CompactRepresentation.LayoutType.VerticalPanel:
                return implicitHeight
            case CompactRepresentation.LayoutType.IconOnly:
                return svgItem.Layout.preferredHeight
            }
        }
        rowSpacing: 0
        columnSpacing: rowSpacing
        flow: {
            switch (compactRepresentation.layoutForm) {
            case CompactRepresentation.LayoutType.VerticalPanel:
            case CompactRepresentation.LayoutType.VerticalDesktop:
                return GridLayout.TopToBottom
            default:
                return GridLayout.LeftToRight
            }
        }
        KSvg.SvgItem {
            property int sourceIndex: 0
            id: svgItem
            opacity: 1
            Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
            Layout.preferredWidth: Math.min(compactRepresentation.parent.width,
                                            compactRepresentation.parent.height)
            Layout.preferredHeight: Layout.preferredWidth
            Layout.maximumHeight: 128
            Layout.maximumWidth: 128
            visible: plasmoid.configuration.type !== 2
            imagePath: Qt.resolvedUrl("../images/my-idle-symbolic.svg")
        }
            Layout.maximumHeight: textMetrics.height * 2
            PlasmaComponents3.Label {
                property double fontHeightRatio: textMetrics.font.pixelSize / textMetrics.height
                id: label
                text: totalSensor.formattedValue
                visible: plasmoid.configuration.type !== 1
                Layout.fillWidth: layoutForm === CompactRepresentation.LayoutType.VerticalPanel
                              || layoutForm === CompactRepresentation.LayoutType.VerticalDesktop
                Layout.maximumWidth: {
                switch (layoutForm) {
                case CompactRepresentation.LayoutType.HorizontalPanel:
                    return textMetrics.width
                case CompactRepresentation.LayoutType.HorizontalDesktop:
                    return compactRepresentation.parent.width
                default:
                    return grid.Layout.preferredWidth
                }
            }
                Layout.minimumWidth: Layout.maximumWidth
                fontSizeMode: Text.VerticalFit
                height: parent.height * 0.71
                // TODO
                font.pixelSize: isVertical ? width / fontHeightRatio
                                             * 0.3 : height * fontHeightRatio
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                renderType: Text.NativeRendering
            }

            TextMetrics {
                id: textMetrics
                font.pixelSize: label.height
                text: "100,0%"
            }
            Sensors.Sensor {
                id: totalSensor
                sensorId: "cpu/all/usage"
                updateRateLimit: plasmoid.configuration.updateRateLimit
            }
            Timer {
                id: switchTimer
                repeat: true
                running: true
                interval: Math.ceil(
                              5000 / Math.sqrt(
                                  totalSensor.value + 35) - 400) // Used from original widget
                onTriggered: {
                    if (svgItem.sourceIndex == 5) {
                        svgItem.sourceIndex = 0
                    }
                    svgItem.imagePath = (totalSensor.value < plasmoid.configuration.idle) ? Qt.resolvedUrl("../images/my-idle-symbolic.svg") : Qt.resolvedUrl("../images/my-active-" + svgItem.sourceIndex + "-symbolic.svg")
                    svgItem.sourceIndex += 1
                }
            }
    }
}
