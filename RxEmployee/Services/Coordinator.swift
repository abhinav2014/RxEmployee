//
//  Coordinator.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 11/01/23.
//

import Foundation
import UIKit

enum NavigationMode {
    case push
    case present
}

protocol CoordinatorProtocol {
    func present(viewController target: UIViewController, from source: UIViewController, navigationMode: NavigationMode, animated: Bool)
}

extension CoordinatorProtocol {
    func present(viewController target: UIViewController, from source: UIViewController, navigationMode: NavigationMode, animated: Bool = true) {
        switch navigationMode {
        case .present:
            // when we are presenting this screen
            source.present(target, animated: animated, completion: nil)
        case .push:
            source.navigationController?.pushViewController(target, animated: animated)
        }
    }
}

protocol Coordinator: CoordinatorProtocol {
    func showEmployeeScreen(from view: UIViewController, navigationMode: NavigationMode)
    
    func showEmployeeDetailsScreen(from view: UIViewController, data: EmployeeModel, navigationMode: NavigationMode)
}
extension Coordinator {
    func showEmployeeScreen(from view: UIViewController, navigationMode: NavigationMode) {}
    func showEmployeeDetailsScreen(from view: UIViewController, data: EmployeeModel, navigationMode: NavigationMode) {}
}

class CoordinatorImpl: Coordinator {
    
    func showEmployeeScreen(from view: UIViewController, navigationMode: NavigationMode) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeesViewController") as! EmployeesViewController
        present(viewController: vc, from: view, navigationMode: navigationMode)
    }
    
    func showEmployeeDetailsScreen(from view: UIViewController, data: EmployeeModel, navigationMode: NavigationMode) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EmployeeDetailsViewController") as! EmployeeDetailsViewController
        vc.viewModel.employeeData = data
        present(viewController: vc, from: view, navigationMode: navigationMode)
    }
}
