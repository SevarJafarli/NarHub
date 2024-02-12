//
//  FreeSMSPresenter.swift
//  Nar_Hub
//
//  Created by Sevar Jafarli on 25.01.24.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FreeSMSPresentationLogic
{
  func presentSomething(response: FreeSMS.Something.Response)
}

class FreeSMSPresenter: FreeSMSPresentationLogic
{
  weak var viewController: FreeSMSDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: FreeSMS.Something.Response)
  {
    let viewModel = FreeSMS.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}