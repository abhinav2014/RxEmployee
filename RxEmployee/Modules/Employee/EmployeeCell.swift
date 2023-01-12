//
//  EmployeeCell.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 12/01/23.
//

import UIKit

class EmployeeCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpViews(data: EmployeeModel) {
         nameLabel.text = data.name
         departmentLabel.text = data.department
         designationLabel.text = data.designation
    }

}
