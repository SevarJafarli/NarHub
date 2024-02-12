//
//  VASPresenter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit

protocol VASPresentationLogic {
    
    func presentVAS(response: VAS.Load.Response)
}

final class VASPresenter: VASPresentationLogic {
    
    weak var viewController: VASDisplayLogic?
    
    func presentVAS(response: VAS.Load.Response) {
        guard let vasCardResponse = response.vas.data else {
            return
        }
        var vasModels: [VASCardModel] = []
        
        for response in vasCardResponse {
            let vasCardModel = VASCardModel(title: response.title ?? "", desc: response.desc ?? "", amountMonthly: response.amountMonthly ?? "", isSwitch: response.isSwitch ?? false, amount: response.amount ?? 0.0, renewal: response.renewal ?? "", renewalDate: response.renewalDate ?? "", nextRenewalDate: response.nextRenewalDate ?? "", progressValue: response.progressValue ?? 0.0)
            
            vasModels.append(vasCardModel)
            
        }
        
        let viewModel = VAS.Load.ViewModel(vasModels: vasModels)
        
        viewController?.displayVAS(viewModel: viewModel)
    }
}
