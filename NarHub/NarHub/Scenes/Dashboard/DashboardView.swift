//
//  DashboardView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import UIKit
import NarHubUIKit

class DashboardView: UIView {
    
    private lazy var externalView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: ColorStyle.bgColor.rawValue)
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var scrollView : UIScrollView = {
        let view = UIScrollView()
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var contentView : UIView = {
        let view = UIView()
        return view
    }()
    
  
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    lazy var storiesCollectionView: StoriesCollectionView = {
        let collectionView = StoriesCollectionView()
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoryCircleCell.self, forCellWithReuseIdentifier: StoryCircleCell.reuseIdentifier)
        collectionView.isHidden = true
        return collectionView
    }()
    
    lazy var productsView: ProductsView = {
        let view = ProductsView()
        return view
    }()
    
    lazy var servicesView: ServicesView = {
        let view = ServicesView()
        view.isHidden = true
        return view
    }()
    
    lazy var loadingIndicatorForServices: LoadingActivityIndicator = {
        let indicator = LoadingActivityIndicator()
        return indicator
    }()
    lazy var loadingIndicatorForStories: LoadingActivityIndicator = {
        let indicator = LoadingActivityIndicator()
        return indicator
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = UIColor(named: ColorStyle.mainColor.rawValue)
    }
    
    fileprivate func addSubviews() {
        self.contentView.addSubview(self.contentStackView)
        self.contentStackView.addArrangedSubview(self.loadingIndicatorForStories)
        self.contentStackView.addArrangedSubview(self.storiesCollectionView)
        self.contentStackView.addArrangedSubview(self.productsView)
        self.contentStackView.addArrangedSubview(self.loadingIndicatorForServices)
        self.contentStackView.addArrangedSubview(self.servicesView)
        self.scrollView.addSubview(self.contentView)
        self.externalView.addSubview(self.scrollView)
        self.addSubview(self.externalView)
    }
    
   private func addConstraints() {
       self.externalView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(UIScreen.main.bounds.height * 0.2)
            make.width.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.8)
        }
    
       self.scrollView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
       self.contentView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(self.scrollView)
        }
       self.contentStackView.snp.updateConstraints { make in
           make.top.equalToSuperview().offset(24)
           make.leading.trailing.bottom.equalToSuperview()
        }
       self.storiesCollectionView.snp.updateConstraints { make in
            make.height.equalTo(80) /// collectionview height + sectioninset from top
        }
    }
    
    //MARK: Public
    
    public func startServicesLoading() {
        self.loadingIndicatorForServices.startLoading()
    }
    public func stopServicesLoading() {
        self.loadingIndicatorForServices.stopLoading {
            self.servicesView.isHidden = false
        }
    }
    public func startStoriesLoading() {
        self.loadingIndicatorForStories.startLoading()
    }
    
    public func stopStoriesLoading() {
        self.loadingIndicatorForStories.stopLoading {
            self.storiesCollectionView.isHidden = false
        }
    }
}

