//
//  SelectPhoneNumberViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit

protocol SelectPhoneNumberViewControllerDelegate: AnyObject {
    func onPhoneNumberSelected(selectedPhoneNumber: String)
}
class SelectPhoneNumberViewController: UIViewController {

    let phoneNumbers: [String]
    
    lazy var mainView: SelectPhoneNumberView = {
        let view = SelectPhoneNumberView()
        return view
    }()
    
    weak var delegate: SelectPhoneNumberViewControllerDelegate?
    
    //MARK: Init
    
    init(phoneNumbers: [String]) {
        self.phoneNumbers = phoneNumbers
        super.init(nibName: nil, bundle: nil)
    }
   
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.phoneNumbersTableView.delegate = self
        mainView.phoneNumbersTableView.dataSource = self
    
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
      
    }
}

extension SelectPhoneNumberViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneNumbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneNumberViewCell.reuseIdentifier, for: indexPath) as? PhoneNumberViewCell else {
            return UITableViewCell()
        }
        let phoneNumber = phoneNumbers[indexPath.row]
        cell.configure(with: phoneNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) 
        let selectedPhoneNumber = self.phoneNumbers[indexPath.row]
        self.delegate?.onPhoneNumberSelected(selectedPhoneNumber: selectedPhoneNumber)
    }
}
