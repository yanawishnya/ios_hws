//
//  ViewController.swift
//  yaabarbashinaPW1
//
//  Created by Барбашина Яна on 15.09.2022.
//

import UIKit

extension UIColor {
    convenience init(rgb: String) {
        let hex = rgb.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        (a, r, g, b) = (255, (int >> 8) * 17,
                        (int >> 4 & 0xF) * 17,
                        (int & 0xF) * 17)
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var colorButton: UIButton!
    var set = Set<UIColor>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateViews()
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        colorButton.isEnabled = false
        animateViews()
    }
    
    func fillSet() {
        while set.count < views.count {
            set.insert(
                UIColor(
                    rgb: randomHexColorCode()
                )
            )
        }
    }
    
    func randomHexColorCode() -> String {
        let a = ["1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"];
        return "#".appending(a[Int.random(in:0..<15)]).appending(a[Int.random(in:0..<15)]).appending(a[Int.random(in:0..<15)])
    }
    
    
    func animateViews() {
        fillSet()
        UIView.animate(withDuration: 2, animations: {for view in self.views {
            view.layer.cornerRadius = .random(in: 0...60)
            view.backgroundColor = self.set.popFirst()
        }})
        { completion in
            self.colorButton.isEnabled = true }
        
    }
    
}

