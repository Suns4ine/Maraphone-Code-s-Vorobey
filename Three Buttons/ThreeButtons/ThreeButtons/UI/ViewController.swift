//
//  ViewController.swift
//  ThreeButtons
//
//  Created by Vyacheslav Pronin on 06.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var image = UIImage(systemName: "heart.fill")
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.backgroundColor = .clear
        view.alignment = .center
        view.distribution = .fillProportionally
        view.spacing = 10
        view.sizeToFit()
        return view
    }()
    
    private lazy var firstButton: Button = {
        return Button(title: "Сначала я", image: image)
    }()
    
    private lazy var secondButton: Button = {
        return Button(title: "Потом конечно же я", image: image)
    }()
    
    private lazy var thirdButton: Button = {
        let button = Button(title: "Затем меня", image: image)
        button.addTarget(self, action: #selector(startSheetController), for: .touchUpInside)
        return button
    }()
    
    func setup() {
        view = GradientView(gradient: Gradient(size: .zero,
                                               colors: [UIColor.systemCyan.cgColor,
                                                        UIColor.systemBlue.cgColor],
                                               coordinat: (start: CGPoint(x: 0, y: 0),
                                                           end: CGPoint(x: 1, y: 1)),
                                               type: .axial))
        view.addSubview(stackView)
        
        [firstButton, secondButton, thirdButton].forEach { button in
            stackView.addArrangedSubview(button)
        }
        setupConstraint()
    }
}

private extension ViewController {
    
    enum Constant {
        static let space: CGFloat = 20
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                           constant: Constant.space),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: Constant.space),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                constant: -Constant.space),
        ])
    }
    
    @objc
    func startSheetController() {
        present(SecondViewController(), animated: true)
    }
}
