//
//  ViewController.swift
//  CompactController
//
//  Created by Vyacheslav Pronin on 15.07.2023.
//

import UIKit

class ViewController: UIViewController {
        
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tapPresent), for: .touchUpInside)
        return button
    }()
    
    override func loadView() {
        view = GradientView(gradient: Gradient(colors: [UIColor.systemGreen.cgColor,
                                                        UIColor.systemTeal.cgColor],
                                               coordinat: (start: CGPoint(x: 0, y: 0),
                                                           end: CGPoint(x: 1, y: 1)),
                                               type: .axial))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupConstraint()
    }
}

private extension ViewController {
    
    enum Constant {
        static let space: CGFloat = 16
    }
    
    func setup() {
        [presentButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: Constant.space),
        ])
    }
    
    @objc
    func tapPresent() {
        let child = ChildViewController()
        child.modalPresentationStyle = .popover
        
        let popoverChild = child.popoverPresentationController
        popoverChild?.delegate = self
        popoverChild?.sourceView = presentButton
        popoverChild?.sourceRect = presentButton.bounds
        popoverChild?.permittedArrowDirections = .up
        
        present(child, animated: true)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}
