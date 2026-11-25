@preconcurrency import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let appWindow = UIWindow(frame: UIScreen.main.bounds)
        appWindow.rootViewController = ViewController()
        appWindow.makeKeyAndVisible()
        window = appWindow
        return true
    }
}
