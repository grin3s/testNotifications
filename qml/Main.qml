import VPlay 2.0
import QtQuick 2.0
import VPlayPlugins 1.0

GameWindow {
    id: gameWindow

    // You get free licenseKeys from http://v-play.net/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the V-Play Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    licenseKey: "B23946E4460B4712C06DA01D83B12B3D7DEB459FE8AC45CDAD369EA62037F58E7CF720CE81D3631802FBD5B1E4173A3560A13478D6E24330842AF49B9D93F3E876D1AF1594FC818CC93F547824A97CDE64BD3DC69408290FB7C9C42D1C668306CC17486C9387A73FA76CD1C1FBFD3640E42548EEC932484F20D22707C13ABDE9C04238E8B3FA6B0E17D1F5C355A596FEDB7E5BAAE857D76315AAFF5FF559DE0CC33E6445B00DA07184759EFA3E8D2003D12BDC037C322C464F6D105FA7915395786F533CBDD7C31FA265DA1A21F92C3DFF5928C1EAEF8E1A074F8807B7C0DA8C5898114CE53BA6A85118FA622A84DD8677ABFB4C60BE16DD010C3CCC5C557A9904769F58438185CD10434704D7894EF6F14C807853A6C04813AC55C244F4116A7EE8C7E70D4E313C022CD54AFF8E8DF045F4E18026EA82E6697A0E0F16A5B69263C0CFC3D943F45947B1A592ADF7FF882248B1579450C401B64125E598EE53CB987CAF8BEED94D2453917A595E0BBFA79E63F96ED4527FB1FC99CC2E2600CD8ACA3E73C71394A06752AE0E47AD681D34076C220CD3EC7D9300AADC651BEEF6A0CF64CD3698DDEEB916CE8078A48F48442483005E09E1357C77F74CE3F92338AC67F78535412415C624F0FFE93A5C804DD4C5200BE690A3732DE43118560ADF8760643499447C20A3CF4EB8934AF3CB4C0122BAAC383D064BB6386F93CC7448F28F821D8D46A3BD7E4268A6F3C7A5CC199575C4286BD8349FA7C5806F73CE7B9CD40E1D92117457149FAC3A232881AE864CC4C9FA394CAD65E92A55FE471D999CDDF5102678190DB83EA73B57899A917B26551606A68FF7264733135E655484C1AD136DEBA1DB3F8C324209B5650F5853"

    activeScene: scene

    // the size of the Window can be changed at runtime by pressing Ctrl (or Cmd on Mac) + the number keys 1-8
    // the content of the logical scene size (480x320 for landscape mode by default) gets scaled to the window size based on the scaleMode
    // you can set this size to any resolution you would like your project to start with, most of the times the one of your main target device
    // this resolution is for iPhone 4 & iPhone 4S
    screenWidth: 640
    screenHeight: 960

    NotificationManager {
        id: notificationManager
        onNotificationFired: {
            console.log("HAHA, it fired!!");
        }
    }

    Scene {
        id: scene

        // the "logical size" - the scene content is auto-scaled to match the GameWindow size
        width: 320
        height: 480

        // background rectangle matching the logical scene size (= safe zone available on all devices)
        // see here for more details on content scaling and safe zone: http://v-play.net/doc/vplay-different-screen-sizes/
        Rectangle {
            id: rectangle
            anchors.fill: parent
            color: "grey"

            Text {
                id: textElement
                // qsTr() uses the internationalization feature for multi-language support
                text: qsTr("Hello V-Play World")
                color: "#ffffff"
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("one");
                    notificationManager.schedule({ message: "Hello World!", number: 3, timeInterval: 8 });
                    console.log("two");
                }
            }


        }
    }
}
