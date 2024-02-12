//
//  VASInteractor.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubNetworkKit

protocol VASBusinessLogic {
    
    func loadVAS(request: VAS.Load.Request)
}

protocol VASDataStore {
    
    //var name: String { get set }
}

final class VASInteractor: VASBusinessLogic, VASDataStore {

    var presenter: VASPresentationLogic?
    lazy var worker: VASWorkingLogic = VASWorker()
    
    var vas: VASResponse?
  
    func loadVAS(request: VAS.Load.Request) {
        self.worker.fetchVAS({ [weak self] data in
            guard let self = self else { return }
            if let data = data {
                self.vas = data
                let response = VAS.Load.Response(vas: data)
                self.presenter?.presentVAS(response: response)
            }
        })
    }
    
}
