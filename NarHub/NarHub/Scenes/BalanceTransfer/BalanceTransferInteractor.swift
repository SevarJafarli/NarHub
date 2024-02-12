//
//  BalanceTransferInteractor.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 26.01.24.
//

import UIKit
import NarHubNetworkKit

protocol BalanceTransferBusinessLogic {
    
    func loadTransferAmounts(request: BalanceTransfer.Load.Request)
}

protocol BalanceTransferDataStore {
    
    //var name: String { get set }
}

final class BalanceTransferInteractor: BalanceTransferBusinessLogic, BalanceTransferDataStore {
    
    var presenter: BalanceTransferPresentationLogic?
    lazy var worker: BalanceTransferWorkingLogic = BalanceTransferWorker()

    var transferAmounts: BalanceTransferResponse?
    
    // MARK: Business Logic
    
    func loadTransferAmounts(request: BalanceTransfer.Load.Request) {
        self.worker.fetchTransferAmounts({ [weak self] data in
            guard let self = self else { return }
            if let data = data {
                self.transferAmounts = data
                let response = BalanceTransfer.Load.Response(transferAmounts: data)
                self.presenter?.presentTransferAmounts(response: response)
            }
        })
        }
    }

                            
