//
//  VASView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubUIKit


final class VASView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var contentVStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        view.isHidden = true
        return view
    }()
    
    lazy var loadingIndicator: LoadingActivityIndicator = {
        let indicator = LoadingActivityIndicator()
        return indicator
    }()
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
        self.addSubviews()
        self.setupUI()
        self.addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.contentView.addSubview(self.loadingIndicator)
        self.contentView.addSubview(self.contentVStackView)
        self.scrollView.addSubview(self.contentView)
        self.addSubview(self.scrollView)
        
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.bgColor)
    }
    
    private func addConstraints() {
        self.scrollView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        self.contentView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        self.contentVStackView.snp.updateConstraints { make in
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.trailing.equalToSuperview().offset(-16)
        }
        
        self.loadingIndicator.snp.updateConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    public func configure(with vasModels: [VASCardModel]) {
        for vasModel in vasModels {
            let vasView = VASCardView(vasModel: vasModel)
            
            self.contentVStackView.addArrangedSubview(vasView)
        }
    }
    
    //MARK: Public
    
    public func startLoading() {
        self.loadingIndicator.startLoading()
    }
    
    public func stopLoading() {
        self.loadingIndicator.stopLoading {
            self.contentVStackView.isHidden = false
        }
    }
    
}
