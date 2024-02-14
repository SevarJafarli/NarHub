//
//  UserContactsView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 30.01.24.
//

import UIKit

protocol UserContactsViewDelegate: AnyObject {
    
}

final class UserContactsView: UIView {
    
    weak var delegate: UserContactsViewDelegate?
    
    var contactsByInitial: [String: [UserContactModel]] = [:]
    var sectionTitles: [String] = []
    
    lazy var contactsTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.register(UserContactsViewCell.self, forCellReuseIdentifier: UserContactsViewCell.reuseIdentifier)
        view.contentInset = .init(top: 16, left: 0, bottom: 16, right: 0)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        self.addSubview(contactsTableView)
    }
    
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
    private func addConstraints() {
        contactsTableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
