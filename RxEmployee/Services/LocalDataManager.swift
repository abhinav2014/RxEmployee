//
//  LocalDataManager.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 12/01/23.
//

import Foundation

let jsonFile = "EmpDataa"

protocol LocalDataManager {
    func fetchEmployees(companyId: Int) -> [EmployeeModel]
    func fetchEmployeeData(companyId: Int, employeeId: Int) -> [EmployeeModel]
    func updateDataToJsonFile()
}

class LocalDataManagerImpl: LocalDataManager {
    
    func fetchEmployees(companyId: Int) -> [EmployeeModel] {
        var data: Any?
        do {
            data = try JSONSerialization.loadJSON(withFilename: jsonFile)
            guard let array = data as? [Any] else { return [] }
            let companies = array.map({ item -> CompanyModel in
                var mkf = CompanyModel()
                mkf.setData(data: item)
                return mkf
            })
            return companies.filter { item in
                item.id == companyId
            }[0].employees ?? []
        } catch {
            fatalError()
        }
    }
    func fetchEmployeeData(companyId: Int, employeeId: Int) -> [EmployeeModel] {
        
        
        return []
    }

    func updateDataToJsonFile() {

    }
    
}


//let employee = EmployeeModel(id: 1, name: "Abhinav", departmentId: 1, department: "Dev", designationId: 1, designation: "Developer", status: .working, image: "https://img.a.transfermarkt.technology/portrait/header/3139-1459504284.jpg?lm=1")
