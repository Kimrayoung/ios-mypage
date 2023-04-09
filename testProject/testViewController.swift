//
//  testViewController.swift
//  testProject
//
//  Created by 김라영 on 2022/12/24.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { self.bottomConstraint.priority = .init(rawValue: 1000)})
    }
    
}
