//
//  DashboardInteractor.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import NarHubNetworkKit

protocol DashboardBusinessLogic
{
    func fetchStories(request: Dashboard.FetchStories.Request)
    
    func load(request: Dashboard.Load.Request)
    
    func fetchHubs(request: Dashboard.FetchHubs.Request)
}

protocol DashboardDataStore
{
  //var name: String { get set }
}

class DashboardInteractor: DashboardBusinessLogic, DashboardDataStore
{
    
  var presenter: DashboardPresentationLogic?
lazy var worker: DashboardWorkingLogic = DashboardWorker()
    
    var hubServices: HubResponse?
    var stories: StoriesResponse?

  func fetchStories(request: Dashboard.FetchStories.Request) {
      worker.fetchStories({ [weak self] data in
            guard let self = self else { return }

            if let data = data {
                self.stories = data
                let response = Dashboard.FetchStories.Response( stories: data)
                self.presenter?.presentStories(response: response)
            }
        })
  }
    
    func fetchHubs(request: Dashboard.FetchHubs.Request) {
       
      worker.fetchHubServices({ [weak self] data in
            guard let self = self else { return }

            if let data = data {
                self.hubServices = data
                let response = Dashboard.FetchHubs.Response( hubServices: data)
                self.presenter?.presentHubServices(response: response)
            }
        })
    }
    
    
    func load(request: Dashboard.Load.Request) {
        let response = Dashboard.Load.Response()
        self.presenter?.presentLoad(response: response)
    }
}


                            
