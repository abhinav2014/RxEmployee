//
//  EmployeeViewModel.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 11/01/23.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class EmployeeViewModel {
    
    let datasource = PublishSubject<[EmployeeModel]>()
    
    private let disposeBag = DisposeBag()
    
    func fetchEmployeeData() {
        let dataManager = LocalDataManagerImpl()
        
        let data = dataManager.fetchEmployees(companyId: 1)
        
        datasource.onNext(data)
        datasource.onCompleted()
    }
}
