import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        if let splitViewController = self.window!.rootViewController as? UISplitViewController {
//            let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
//            navigationController.topViewController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem()
//            navigationController.topViewController?.navigationItem.leftItemsSupplementBackButton = true
//            splitViewController.delegate = splitViewController
//        }
        Repo.loadCompanyInfo()
        return true
    }
}

