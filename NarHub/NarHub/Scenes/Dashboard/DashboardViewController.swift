//
//  DashboardViewController.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.

import UIKit
import SnapKit
import NarHubNetworkKit

protocol DashboardDisplayLogic: AnyObject
{
    func displayStories(viewModel: Dashboard.FetchStories.ViewModel)
    
    func displayLoad(viewModel: Dashboard.Load.ViewModel)
    
    func displayHubServices(viewModel: Dashboard.FetchHubs.ViewModel)
}


class DashboardViewController: UIViewController
{
    var interactor: DashboardBusinessLogic?
    var router: (NSObjectProtocol & DashboardRoutingLogic & DashboardDataPassing)?
    var mainView: DashboardView!
    
    var stories: [StoryModel] = []
    var hubServices: [HubModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.storiesCollectionView.delegate = self
        mainView.storiesCollectionView.dataSource = self
        
        mainView.servicesView.servicesCollectionView.delegate = self
        mainView.servicesView.servicesCollectionView.dataSource = self
        
        self.load()
        
    }
    
    override func loadView() {
        super.loadView()
        self.view = mainView
    }
    
    func load() {
        let request = Dashboard.Load.Request()
        interactor?.load(request: request)
    }
    
    func loadStories() {
        self.mainView.startStoriesLoading()
        let request = Dashboard.FetchStories.Request()
        interactor?.fetchStories(request: request)
    }
    
    func loadHubServices() {
        self.mainView.startServicesLoading()
        let request = Dashboard.FetchHubs.Request()
        interactor?.fetchHubs(request: request)
    }
}

//MARK: DashboardDisplayLogic

extension DashboardViewController: DashboardDisplayLogic {
    func displayLoad(viewModel: Dashboard.Load.ViewModel) {
        self.loadStories()
        self.loadHubServices()
    }
    
    func displayHubServices(viewModel: Dashboard.FetchHubs.ViewModel) {

        self.hubServices = viewModel.servicesList
        
        self.mainView?.servicesView.servicesCollectionView.reloadData()
        
        self.mainView?.stopServicesLoading()
    }
    
    
    func displayStories(viewModel: Dashboard.FetchStories.ViewModel) {
        self.stories = viewModel.storiesList
        self.mainView.storiesCollectionView.reloadData()
        self.mainView.stopStoriesLoading()
    }
}

//MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.storiesCollectionView {
            return self.stories.count
        }
        else if collectionView ==  mainView.servicesView.servicesCollectionView {
            return self.hubServices.count
        }
        else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.storiesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCircleCell.reuseIdentifier, for: indexPath) as? StoryCircleCell else {
                return UICollectionViewCell()
            }
            
            let storyModel = self.stories[indexPath.row]
            cell.configure(storyModel: storyModel)
            
            return cell
        }
        
        else if collectionView ==  mainView.servicesView.servicesCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceViewCell.reuseIdentifier, for: indexPath) as? ServiceViewCell else {
                return UICollectionViewCell()
            }
            let hubModel = self.hubServices[indexPath.row]
            cell.configure(with: hubModel)
            return cell
        }
        else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.storiesCollectionView {
            router?.routeToStory(stories: stories, selectedIndex: indexPath.row, onCompletion: {index in 
                if index != nil {
                    if !self.stories[index!].isSeen {
                        self.stories[index!].isSeen = true
                    }
                   
                } else {
                    if !self.stories[indexPath.row].isSeen {
                        self.stories[indexPath.row].isSeen = true
                    }
                }
                collectionView.reloadData()

            })
        }
        
        else if collectionView ==  mainView.servicesView.servicesCollectionView {
            let hubModel = self.hubServices[indexPath.row]
            
            switch hubModel.id {
            case 1:
                router?.routeToFreeSMS()
            case 2:
                router?.routeToBalanceTransfer()
            case 3:
                router?.routeToVAS()
            default:
                break
            }
        }
    }
}


