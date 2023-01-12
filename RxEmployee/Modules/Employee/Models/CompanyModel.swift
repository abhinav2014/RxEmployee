//
//  CompanyModel.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 12/01/23.
//

import Foundation

struct CompanyModel {
    var id: Int?
    var name: String?
    var employees: [EmployeeModel]?
    var username: String?
    var password : String?
    
    mutating func setData(data: Any) {
        if let data = data as? [String: Any] {
            self.id = data["id"] as? Int
            self.name = data["name"] as? String
            self.username = data["username"] as? String
            self.password = data["password"] as? String
            if let emp = data["employees"] as? [Any] {
                self.employees = emp.map({ item in
                    var mkf = EmployeeModel()
                    mkf.setData(data: item)
                    return mkf
                })
            }
        }
    }
}
