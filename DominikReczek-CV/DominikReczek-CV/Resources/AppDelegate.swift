import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UILabel.appearance().substituteDefaultFont = "AmericanTypewriter-Condensed"

        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            let mainViewController = MainViewController()
            window.rootViewController = mainViewController
            application.statusBarStyle = UIStatusBarStyle.lightContent
            window.makeKeyAndVisible()
        }

        return true
    }
}
