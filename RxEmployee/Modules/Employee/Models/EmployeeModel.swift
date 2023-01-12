//
//  EmployeeModel.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 12/01/23.
//

import Foundation
import RxSwift
import RxDataSources

enum EmployeeStatus: String {
    case working
    case resigned
}

struct EmployeeModel {
    var id: Int?
    var name: String?
    var departmentId: Int?
    var department: String?
    var designationId: Int?
    var designation: String?
    var status: EmployeeStatus?
    var image: String?
    
    
    mutating func setData(data: Any) {
        if let data = data as? [String: Any] {
            self.id = data["id"] as? Int
            self.name = data["name"] as? String
            self.departmentId = data["departmentId"] as? Int
            self.department = data["department"] as? String
            self.designationId = data["designationId"] as? Int
            self.designation = data["designation"] as? String
            self.image = data["image"] as? String
        }
    }
}

extension EmployeeModel: Equatable {
    static func == (lhs: EmployeeModel, rhs: EmployeeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
