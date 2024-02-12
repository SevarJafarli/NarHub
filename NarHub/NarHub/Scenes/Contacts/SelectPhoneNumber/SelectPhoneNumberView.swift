//
//  SelectPhoneNumberView.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 31.01.24.
//

import UIKit
import NarHubUIKit

class SelectPhoneNumberView: UIView {
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
        self.addSubviews()
        self.addConstraints()
    }

    
    private let tableHeaderLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Choose number"
        lbl.font = AppFonts.boldTitleSize18.fontStyle
        lbl.textColor = .black
        return lbl
    }()
    
    lazy var phoneNumbersTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(PhoneNumberViewCell.self, forCellReuseIdentifier: PhoneNumberViewCell.reuseIdentifier)
        tableView.tableHeaderView = tableHeaderLabel
        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        return tableView
    }()

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
    
    private func addSubviews() {
        self.addSubview(self.phoneNumbersTableView)
    }
    
    
    private func addConstraints() {
        phoneNumbersTableView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        tableHeaderLabel.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview()
        }
    }
}
