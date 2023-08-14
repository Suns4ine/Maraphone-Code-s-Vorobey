//
//  ViewController.swift
//  Gradient
//
//  Created by Vyacheslav Pronin on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var gradientView: GradientView = {
        let size = CGSize(width: Constant.defaultWidth, height: Constant.defaultWidth)
        let colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor]
        let coordinat = (start: CGPoint(x: 0, y: 0), end: CGPoint(x: 1, y: 1))
        
        let view = GradientView(gradient: Gradient(size: size,
                                                   colors: colors,
                                                   coordinat: coordinat,
                                                   type: .axial))
        return view
    }()

    override func loadView() {
        view = GradientView(gradient: Gradient(size: .zero,
                                               colors: [UIColor.systemGreen.cgColor,
                                                        UIColor.systemTeal.cgColor],
                                               coordinat: (start: CGPoint(x: 0, y: 0),
                                                           end: CGPoint(x: 1, y: 1)),
                                               type: .axial))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(gradientView)
        setupConstraint()
    }
}

private extension ViewController {
    
    enum Constant {
        static let defaultWidth: CGFloat = 100
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constant.defaultWidth),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
