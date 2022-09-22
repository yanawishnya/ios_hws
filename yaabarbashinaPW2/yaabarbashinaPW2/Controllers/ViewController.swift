//
//  ViewController.swift
//  yaabarbashinaPW2
//
//  Created by Барбашина Яна on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func setupIncrementButton() {
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(.black, for: .normal)
        incrementButton.layer.cornerRadius = 12
        incrementButton.titleLabel?.font = .systemFont(ofSize:
                                                        16.0, weight: .medium)
        incrementButton.backgroundColor = .white
        incrementButton.layer.applyShadow()
        self.view.addSubview(incrementButton)
        incrementButton.setHeight(to: 48)
        incrementButton.pinTop(to: self.view.centerYAnchor)
        incrementButton.pin(to: self.view, [.left: 24, .right:
                                                incrementButton.addTarget(self, action:
                                                                            #selector(incrementButtonPressed), for: .touchUpInside)
                                            }
                                            
                                            
                                            }
                                            
                                            final class WelcomeViewController: UIViewController {
            private let commentLabel = UILabel()
            private let valueLabel = UILabel()
            private let value: Int = 0
        }
                                            
