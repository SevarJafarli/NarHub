//
//  BalanceTransferViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit

protocol BalanceTransferDisplayLogic: AnyObject {
    
    func displayTransferAmounts(viewModel: BalanceTransfer.Load.ViewModel)
}

final class BalanceTransferViewController: UIViewController {
    
    var mainView: BalanceTransferView?
    var interactor: BalanceTransferBusinessLogic?
    var router: (BalanceTransferRoutingLogic & BalanceTransferDataPassing)?
    
    private var transferAmounts: [String] = []
    var selectedAmountIndex = 0
    // MARK: - Lifecycle Methods
    
    override func loadView() {
        super.loadView()
        self.view = mainView
        mainView?.delegate = self
  
        view.isExclusiveTouch = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showBackButton = true
        self.hideKeyboardWhenTappedAround()
        self.title = "Balans köçürmə"
       
        self.mainView?.selectTransferAmountView.transferAmountsCollectionView.delegate = self
        self.mainView?.selectTransferAmountView.transferAmountsCollectionView.dataSource = self
        self.load()
    }
    
 
    // MARK: - Public Methods
    
    func load() {
        self.mainView?.startLoading()
        
        let request = BalanceTransfer.Load.Request()
        interactor?.loadTransferAmounts(request: request)
    }
}

// MARK: - Display Logic

extension BalanceTransferViewController: BalanceTransferDisplayLogic {
    
    func displayTransferAmounts(viewModel: BalanceTransfer.Load.ViewModel) {
        self.transferAmounts = viewModel.amountList
        self.mainView?.selectTransferAmountView.transferAmountsCollectionView.reloadData()
        self.mainView?.stopLoading()
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension BalanceTransferViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.transferAmounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TransferAmountCell.reuseIdentifier, for: indexPath) as? TransferAmountCell else {
            return UICollectionViewCell()
        }
        
        let amount = self.transferAmounts[indexPath.row]

        cell.configure(with: amount)
        
        
        cell.isButtonSelected = (indexPath.item == self.selectedAmountIndex)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("select item")
        if self.selectedAmountIndex != indexPath.item {
            self.selectedAmountIndex = indexPath.item
            collectionView.reloadData()
        }
    }
}

// MARK: - BalanceTransferViewDelegate

extension BalanceTransferViewController: BalanceTransferViewDelegate {
    func openContacts() {
        router?.routeToContacts()
    }
}
extension BalanceTransferViewController: UserContactsViewControllerDelegate {
    func onPhoneNumberSelected(selectedPhoneNumber: String) {
        self.mainView?.phoneNumberTextFieldView.phoneTextField.text = selectedPhoneNumber
    }
    
}

