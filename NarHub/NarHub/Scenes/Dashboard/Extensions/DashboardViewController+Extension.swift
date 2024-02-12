//
//  DashboardViewController + Extension.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 09.02.24.
//

import Foundation

//MARK: Hide and show navigation bar

extension DashboardViewController {
    //Hide and show navigation bar when it's dashboardviewcontroller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Show the navigation bar when leaving the DashboardViewController
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
