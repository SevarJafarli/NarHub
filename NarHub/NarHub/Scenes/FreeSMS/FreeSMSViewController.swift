
import UIKit

protocol FreeSMSDisplayLogic: AnyObject
{
    func displaySomething(viewModel: FreeSMS.Load.ViewModel)
    func displayDailySMSLimitInfo(viewModel: FreeSMS.Load.ViewModel)
}

class FreeSMSViewController: UIViewController
{
    var interactor: FreeSMSBusinessLogic?
    var router: (NSObjectProtocol & FreeSMSRoutingLogic & FreeSMSDataPassing)?
    
    var mainView: FreeSMSView?
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView?.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.hideKeyboardWhenTappedAround()
        self.title = "Pulsuz SMS"
        // Notifications for when the keyboard opens/closes
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
        
        self.load()
    }
    
    //MARK: Deinit
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func load() {
        self.mainView?.startLoading()
        let request = FreeSMS.Load.Request()
        interactor?.loadDailySMSLimitInfo(request: request)
    }
}

//MARK: FreeSMSDisplayLogic

extension FreeSMSViewController: FreeSMSDisplayLogic {
    func displayDailySMSLimitInfo(viewModel: FreeSMS.Load.ViewModel) {
        self.mainView?.dailySMSView.configure(with: viewModel.info)
        
        self.mainView?.stopLoading()
    }
    
    func displaySomething(viewModel: FreeSMS.Load.ViewModel) {
    }
}

//MARK: FreeSMSViewDelegate

extension FreeSMSViewController: FreeSMSViewDelegate {
    func openContacts() {
        router?.routeToContacts()
        
    }
}

extension FreeSMSViewController: UserContactsViewControllerDelegate {
    func onPhoneNumberSelected(selectedPhoneNumber: String) {
        self.mainView?.phoneNumberTextField.phoneTextField.text = selectedPhoneNumber
    }
    
    
}
