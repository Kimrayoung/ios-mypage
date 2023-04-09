//
//  CustomView.swift
//  testProject
//
//  Created by 김라영 on 2022/12/14.
//

import Foundation
import UIKit

@IBDesignable

class CustomView : UIView {
    @IBInspectable
    
    //뷰 동르가미 만들기
    var isCircle : Bool = false {
        didSet {
            if isSquare() && isCircle {
                self.layer.cornerRadius = self.frame.height / 2
            }
        }
    }
    
    
    /// 뷰 정사각형 여부
    /// - Returns: 여부
    fileprivate func isSquare() -> Bool {
        return self.frame.width == self.frame.height
    }
}
