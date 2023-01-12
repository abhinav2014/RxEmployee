//
//  LocalDataManager.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 12/01/23.
//

import Foundation

protocol LocalDataManager {
    func fetchJsonData() -> [EmployeeModel]
    func updateDataToJsonFile()
}

class LocalDataManagerImpl: LocalDataManager {
    
    func fetchJsonData() -> [EmployeeModel] {
        let employee = EmployeeModel(id: 1, name: "Abhinav", departmentId: 1, department: "Dev", designationId: 1, designation: "Developer", status: .working)
        return [employee]
    }

    func updateDataToJsonFile() {

    }
    
}
