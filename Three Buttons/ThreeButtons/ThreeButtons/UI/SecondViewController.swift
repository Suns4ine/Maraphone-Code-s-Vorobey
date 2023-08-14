//
//  SecondViewController.swift
//  ThreeButtons
//
//  Created by Vyacheslav Pronin on 15.08.2023.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 8
        view.image = UIImage(named: "yea")
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func loadView() {
        view = GradientView(gradient: Gradient(size: .zero,
                                               colors: [UIColor(hexString: "#69df89").cgColor,
                                                        UIColor(hexString: "#0bbeb4").cgColor],
                                               coordinat: (start: CGPoint(x: 0, y: 0),
                                                           end: CGPoint(x: 1, y: 1)),
                                               type: .axial))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupIcomView()
    }
    
    private func setupIcomView() {
        view.addSubview(iconView)
        
        let safeView = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: safeView.topAnchor,
                                          constant: Constant.space),
            iconView.leadingAnchor.constraint(equalTo: safeView.leadingAnchor,
                                              constant: Constant.space),
            iconView.trailingAnchor.constraint(equalTo: safeView.trailingAnchor,
                                               constant: -Constant.space),
            iconView.bottomAnchor.constraint(equalTo: safeView.bottomAnchor,
                                             constant: -Constant.space)
        ])
    }
    
    enum Constant {
        static let space: CGFloat = 20
    }
}
