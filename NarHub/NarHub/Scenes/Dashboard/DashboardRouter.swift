
import UIKit

protocol DashboardRoutingLogic {
    
    func routeToFreeSMS()
    func routeToBalanceTransfer()
    func routeToVAS()
    func routeToStory(stories: [StoryModel], selectedIndex: Int, onCompletion: @escaping (_ index: Int?) -> ())
}

protocol DashboardDataPassing {
    var dataStore: DashboardDataStore? { get }
}

final class DashboardRouter: NSObject, DashboardRoutingLogic, DashboardDataPassing {
    
    weak var viewController: DashboardViewController?
    var dataStore: DashboardDataStore?
  
    
    // MARK: Routing

    func routeToFreeSMS() {
        let destinationVC = FreeSMSViewController()
        FreeSMSConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToFreeSMS(source: dataStore!, destination: &destinationDS)
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToFreeSMS(source: viewController!, destination: destinationVC)
    }
    
    func routeToBalanceTransfer() {
        let destinationVC = BalanceTransferViewController()
        BalanceTransferConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToBalanceTransfer(source: dataStore!, destination: &destinationDS)
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToBalanceTransfer(source: viewController!, destination: destinationVC)
    }
    
    func routeToVAS() {
        let destinationVC = VASViewController()
        VASConfigurator.configure(destinationVC)

        var destinationDS = destinationVC.router!.dataStore!
        passDataToVAS(source: dataStore!, destination: &destinationDS)
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToVAS(source: viewController!, destination: destinationVC)
    }
    
    func routeToStory(stories: [StoryModel], selectedIndex: Int, onCompletion: @escaping (_ index: Int?) -> ()) {

        let destinationVC =
        StoryViewController(stories: stories, selectedIndex: selectedIndex, onCompetion:  onCompletion)
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        destinationVC.modalTransitionStyle = .coverVertical
        destinationVC.hidesBottomBarWhenPushed = true
        navigateToStory(source: viewController!, destination: destinationVC)
    }
    

    
    // MARK: Navigation to Free SMS

    func navigateToFreeSMS(source: DashboardViewController, destination: FreeSMSViewController) {
        source.show(destination, sender: nil)
    }

    
    
    // MARK: Passing data to Free SMS

    func passDataToFreeSMS(source: DashboardDataStore, destination: inout FreeSMSDataStore) {
//        destination.name = source.name
    }
    
    // MARK: Navigation to Balance Transfer

    func navigateToBalanceTransfer(source: DashboardViewController, destination: BalanceTransferViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data to Balance Transfer

    func passDataToBalanceTransfer(source: DashboardDataStore, destination: inout BalanceTransferDataStore) {
//        destination.name = source.name
    }
    
    func navigateToVAS(source: DashboardViewController, destination: VASViewController) {
        source.show(destination, sender: nil)
    }

    
    // MARK: Passing data to VAS

    func passDataToVAS(source: DashboardDataStore, destination: inout VASDataStore) {
//        destination.name = source.name
    }
    
    func navigateToStory(source: DashboardViewController, destination: StoryViewController) {
        
        source.present(destination, animated: true, completion: nil)
       
    }

}
