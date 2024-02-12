//
//  UserContactsViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

protocol UserContactsDisplayLogic: AnyObject {
    
    func displayContacts(viewModel: UserContacts.Load.ViewModel)
}
protocol UserContactsViewControllerDelegate: AnyObject {
    func onPhoneNumberSelected(selectedPhoneNumber: String)
}

final class UserContactsViewController: UIViewController {
    
    var mainView: UserContactsView?
    var interactor: UserContactsBusinessLogic?
    var router: (UserContactsRoutingLogic & UserContactsDataPassing)?
    
    weak var delegate: UserContactsViewControllerDelegate?
    
    var selectedPhoneNumber: String = ""
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView!.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadContacts()
        mainView!.contactsTableView.delegate = self
        mainView!.contactsTableView.dataSource = self
    }
    
    
    // MARK: - Public Methods
    
    func loadContacts() {
        let request = UserContacts.Load.Request()
        interactor?.loadContacts(request: request)
    }
}

// MARK: - Display Logic

extension UserContactsViewController: UserContactsDisplayLogic {
    
    func displayContacts(viewModel: UserContacts.Load.ViewModel) {
        self.mainView!.contactsByInitial = viewModel.model.contactsDictionary
        self.mainView!.sectionTitles = viewModel.model.sectionTitles
        DispatchQueue.main.async { [weak self] in
            self?.mainView!.contactsTableView.reloadData()
        }
    }
}

// MARK: - View Delegate

extension UserContactsViewController: UserContactsViewDelegate {
    
}


//MARK: UITableViewDelegate, UITableViewDataSource

extension UserContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = self.mainView!.sectionTitles[section]
        return self.mainView!.contactsByInitial[key]?.count ?? 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.mainView!.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: UserContactsViewCell.reuseIdentifier, for: indexPath) as? UserContactsViewCell else {
            return UITableViewCell()
        }
        
        let key = self.mainView!.sectionTitles[indexPath.section]
        if let contactsForKey = self.mainView!.contactsByInitial[key] {
            let contact = contactsForKey[indexPath.row]
            cell.configure(with: contact)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 + 8
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.mainView!.sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let key = self.mainView!.sectionTitles[indexPath.section]
        if let contactsForKey = self.mainView!.contactsByInitial[key] {
            let contact = contactsForKey[indexPath.row]
            if contact.phoneNumbers.count > 1 {
                let vc = SelectPhoneNumberViewController(phoneNumbers: contact.phoneNumbers)
                vc.delegate = self
                self.showBottomUp(vc,sizes: [.percent(0.25), .intrinsic])
            }
            else {
                let phoneNumber = contact.phoneNumbers.first
                print("Selected Phone number \(phoneNumber!)")
//                phoneNumber.formatPhoneNumber()
                self.selectedPhoneNumber = phoneNumber!
                self.delegate?.onPhoneNumberSelected(selectedPhoneNumber: selectedPhoneNumber)
                self.router?.dismissAndRouteToFreeSMS()
            }
            
          
        }
    }
}

extension UserContactsViewController: SelectPhoneNumberViewControllerDelegate {
    func onPhoneNumberSelected(selectedPhoneNumber: String) {
        self.selectedPhoneNumber = selectedPhoneNumber
        print("SelectPhoneNumberViewControllerDelegate: selectedPhoneNumber is \(selectedPhoneNumber)")
        self.delegate?.onPhoneNumberSelected(selectedPhoneNumber: selectedPhoneNumber)
        
        self.dismiss(animated: true)
        self.router?.dismissAndRouteToFreeSMS()
    }
}
