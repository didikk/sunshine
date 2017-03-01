//
//  GradientView.swift
//  Sunshine
//
//  Created by Didik Ismawanto on 2/25/17.
//  Copyright © 2017 Didik Ismawanto. All rights reserved.
//

import UIKit
@IBDesignable

class GradientView: UIView {

    @IBInspectable var colorTop: UIColor? {
        didSet {
            layerGradient(colorTop: colorTop, colorBottom:colorBottom)
        }
    }
    
    @IBInspectable var colorBottom: UIColor? {
        didSet {
            layerGradient(colorTop: colorTop, colorBottom:colorBottom)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layerGradient(colorTop: colorTop, colorBottom:colorBottom)
    }
    
    func layerGradient(colorTop:UIColor?,colorBottom:UIColor?) {
        if colorTop != nil && colorBottom != nil{
            let layer : CAGradientLayer = CAGradientLayer()
            layer.frame = self.frame
            layer.colors = [colorTop!.cgColor,colorBottom!.cgColor]
            self.layer.insertSublayer(layer, at: 0)
        }
    }

}
