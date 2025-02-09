import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as Controls
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM

KCM.SimpleKCM {
    property alias cfg_idle: idleSlider.value
    property alias cfg_type: typeBox.currentIndex
    property alias cfg_updateRateLimit: updateRateLimitSpinBox.value
    Kirigami.FormLayout {
        id: root

        RowLayout {
            Layout.fillWidth: true
            Kirigami.FormData.label: i18n("Idle threshold")
            Controls.Slider {
                Layout.fillWidth: true
                id: idleSlider
                from: 0
                to: 100
                stepSize: 1
            }
            Controls.Label {
                id: label
                text: idleSlider.value + "%"
                Layout.minimumWidth: textMetrics.width
                Layout.minimumHeight: textMetrics.height
                horizontalAlignment: Text.AlignRight
            }
            TextMetrics {
                id: textMetrics
                text: "199%"
            }
        }
        Controls.ComboBox {
            Layout.fillWidth: true
            Kirigami.FormData.label: i18n("Displaying items")
            id: typeBox
            model: [i18n("Character and percentage"), i18n(
                    "Character only"), i18n("Percentage only")]
        }
        Controls.SpinBox {
            id: updateRateLimitSpinBox
            Layout.fillWidth: true
            Kirigami.FormData.label: i18nd("KSysGuardSensorFaces",
                                           "Minimum Time Between Updates:")
            from: 0
            to: 60000
            stepSize: 500
            editable: true
            textFromValue: function (value, locale) {
                if (value <= 0) {
                    return i18nd("KSysGuardSensorFaces", "No Limit")
                } else {
                    var seconds = value / 1000
                    if (seconds == 1) {
                        return i18nd("KSysGuardSensorFaces", "1 second")
                    } else {
                        return i18nd("KSysGuardSensorFaces",
                                     "%1 seconds", seconds)
                    }
                }
            }
            valueFromText: function (value, locale) {
                var v = parseInt(value)
                if (isNaN(v)) {
                    return 0
                } else {
                    return v * 1000
                }
            }
        }
    }
}
