//
//  AppContainer.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 23.01.24.
//

import Foundation
import NarHubUIKit
import NarHubNetworkKit

let App = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let theme = AppTheme()
    let service = Service()

}
