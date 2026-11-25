import UIKit
import WebKit

@main
@MainActor
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let appWindow = UIWindow(frame: UIScreen.main.bounds)
        appWindow.rootViewController = SmartDineWebViewController()
        appWindow.makeKeyAndVisible()
        window = appWindow
        return true
    }
}

@MainActor
final class SmartDineWebViewController: UIViewController, WKNavigationDelegate {
    private var webView: WKWebView!
    private let targetURL = "https://chung.rf.gd/SBA_ICT_Smart_Order_System/website/smartdine.html"

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = WKWebViewConfiguration()
        config.websiteDataStore = WKWebsiteDataStore.default()
        config.allowsInlineMediaPlayback = true

        webView = WKWebView(frame: view.bounds, configuration: config)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        webView.navigationDelegate = self
        view.addSubview(webView)

        if let url = URL(string: targetURL) {
            webView.load(URLRequest(url: url))
        }
    }

    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationAction: WKNavigationAction,
        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
    ) {
        if let url = navigationAction.request.url,
           let scheme = url.scheme,
           scheme != "http" && scheme != "https" {
            UIApplication.shared.open(url)
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
}
