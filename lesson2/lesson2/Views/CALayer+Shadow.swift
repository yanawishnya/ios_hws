//
//  CALayer+Shadow.swift
//  lesson2
//
//  Created by Барбашина Яна on 23.09.2022.
//

import UIKit

extension CALayer {
    func applyShadow(scale: Bool = true) {
        self.masksToBounds = false
        self.shadowColor = UIColor.black.cgColor
        self.shadowOpacity = 0.1
        self.shadowOffset = .zero
        self.shadowRadius = 4
        self.shouldRasterize = true
        self.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
