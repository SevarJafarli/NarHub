//
//  BalanceTransferPresenter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit

protocol BalanceTransferPresentationLogic {
    
    func presentTransferAmounts(response: BalanceTransfer.Load.Response)
}

final class BalanceTransferPresenter: BalanceTransferPresentationLogic {
    
    weak var viewController: BalanceTransferDisplayLogic?
    
    
    // MARK: Presentation
    
    func presentTransferAmounts(response: BalanceTransfer.Load.Response) {
        
        guard let amountList = response.transferAmounts.amountList else {
            return
        }
        let viewModel = BalanceTransfer.Load.ViewModel(amountList: amountList)
        
        viewController?.displayTransferAmounts(viewModel: viewModel)
    }
}
