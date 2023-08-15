//
//  ChildViewController.swift
//  CompactController
//
//  Created by Vyacheslav Pronin on 15.07.2023.
//

import UIKit
import Foundation

final class ChildViewController: UIViewController {
    
    private lazy var items = [Constant.longHeight, Constant.smallHeight].compactMap { "\(Int($0))pt" }
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "xmark.circle.fill")?.withTintColor(.systemOrange,
                                                                            renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var segment: UISegmentedControl = {
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        control.selectedSegmentTintColor = .systemOrange
        control.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        return control
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "yea")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        setup()
        setupConstraint()
    }
}

private extension ChildViewController {
    
    enum Constant {
        static let space: CGFloat = 6
        static let width: CGFloat = 300
        static let longHeight: CGFloat = 280
        static let smallHeight: CGFloat = 150
    }
    
    func setup() {
        view.backgroundColor = .systemYellow
        preferredContentSize = CGSize(width: Constant.width, height: Constant.longHeight)
        
        [segment, closeButton, imageView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constant.space),
            segment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.topAnchor.constraint(equalTo: segment.topAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(Constant.space + 4)),
            
            imageView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: Constant.space),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.space),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.space),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constant.space)
        ])
    }
    
    func getHeight(segmentValue: String?) -> CGFloat {
        guard let segmentValue,
              let double = Double(segmentValue.filter { $0.isNumber })
        else { return Constant.longHeight }
        
        return CGFloat(double)
    }
    
    @objc
    func segmentedValueChanged(_ sender: UISegmentedControl) {
        let segmentValue = segment.titleForSegment(at: segment.selectedSegmentIndex)
        preferredContentSize.height = getHeight(segmentValue: segmentValue)
    }
    
    @objc
    func closeButtonTapped() {
        dismiss(animated: true)
    }
}
