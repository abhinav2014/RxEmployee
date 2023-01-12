//
//  EmployeesViewController.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 11/01/23.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class EmployeesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = EmployeeViewModel()
    let disposeBag = DisposeBag()
    
    var coordinator = CoordinatorImpl()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        tableView.rowHeight = UITableView.automaticDimension
        setUpBinding()
        viewModel.fetchEmployeeData()
    }
    
    func setUpBinding() {
        
        viewModel.datasource.bind(to: tableView.rx.items(cellIdentifier: "Cell", cellType: EmployeeCell.self)) { (row,item,cell) in
            cell.setUpViews(data: item)
        }.disposed(by: disposeBag)
                
        tableView.rx.modelSelected(EmployeeModel.self).subscribe(onNext: { [weak self] item in
            
            guard let `self` = self else {return}
            self.showEmployeeDetailsScreen(from: self, data: item, navigationMode: .push)
            
        }).disposed(by: disposeBag)
            
    }

}

extension EmployeesViewController: UITableViewDelegate {}

extension EmployeesViewController: Coordinator {
    
    func showEmployeeDetailsScreen(from view: UIViewController, data: EmployeeModel, navigationMode: NavigationMode) {
        coordinator.showEmployeeDetailsScreen(from: self, data: data, navigationMode: .push)
    }
    
}
