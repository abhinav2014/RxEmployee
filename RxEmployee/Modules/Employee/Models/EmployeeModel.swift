//
//  EmployeeModel.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 12/01/23.
//

import Foundation
import RxSwift
import RxDataSources

enum EmployeeStatus {
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
}

extension EmployeeModel: Equatable {
    static func == (lhs: EmployeeModel, rhs: EmployeeModel) -> Bool {
        return lhs.id == rhs.id
    }
}
