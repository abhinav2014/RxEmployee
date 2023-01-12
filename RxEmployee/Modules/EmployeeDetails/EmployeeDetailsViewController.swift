//
//  EmployeeDetailsViewController.swift
//  RxEmployee
//
//  Created by Abhinav Dobhal on 11/01/23.
//

import UIKit
import RxCocoa
import RxSwift
import SDWebImage

class EmployeeDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var departmentLabel: UILabel!
    
    @IBOutlet weak var designationLabel: UILabel!
    
    @IBOutlet weak var employeeImageView: UIImageView!
    
    let viewModel = EmployeeDetailsViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpBinding()
    }
    
    func setUpBinding() {
        
        self.nameLabel.text = viewModel.employeeData?.name
        self.departmentLabel.text = viewModel.employeeData?.department
        self.designationLabel.text = viewModel.employeeData?.designation
        if let urlSting = viewModel.employeeData?.image, let url = URL(string: urlSting) {
            self.employeeImageView.sd_setImage(with: url)
        }
        
//        _ = viewModel.employeeData.subscribe { [weak self] value in
//            guard let `self` = self else {return}
//            self.nameLabel.text = value.element?.name
//            self.departmentLabel.text = value.element?.department
//            self.designationLabel.text = value.element?.designation
//        }
        
//        viewModel.employeeData.bind { [weak self] value in
//
//            guard let `self` = self else {return}
//            self.nameLabel.text = value.name
//            self.departmentLabel.text = value.department
//            self.designationLabel.text = value.designation
//
//        }.disposed(by: disposeBag)
    }

}
