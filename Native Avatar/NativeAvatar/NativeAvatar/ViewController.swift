//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Vyacheslav Pronin on 24.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yea")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemRed
        imageView.layer.cornerRadius = Constant.height / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "yea")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
    
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.contentSize.height = view.frame.height * 2
        scrollView.backgroundColor = .clear
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}
private extension ViewController {
    
    enum Constant {
        static let title = "Avatar"
        static let imageName = "person.crop.circle.fill"
        static let largeView = "_UINavigationBarLargeTitleView"
        
        static let space: CGFloat = 12
        static let height: CGFloat = 36
    }
    
    func setup() {
        [scrollView].forEach {
            view.addSubview($0)
        }
        
        scrollView.addSubview(iconView)
        
        NSLayoutConstraint.activate([            
            iconView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor, constant: Constant.space * -10),
            iconView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constant.space),
            iconView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constant.space)
        
        ])
        
        setupImageView()
        
        view.backgroundColor = .systemOrange
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        title = Constant.title
    }

    func setupImageView() {
        // Приватная вью была найдена в дебаггере вьюх
        guard let largeAnyClass = NSClassFromString(Constant.largeView) else { return }
        
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            self.navigationController?.navigationBar.subviews.forEach { subview in
                guard subview.isKind(of: largeAnyClass.self) else { return }
                
                subview.addSubview(self.avatarImageView)
                NSLayoutConstraint.activate([
                    self.avatarImageView.heightAnchor.constraint(equalToConstant: Constant.height),
                    self.avatarImageView.widthAnchor.constraint(equalTo: self.avatarImageView.heightAnchor,
                                                                multiplier: 1),
                    self.avatarImageView.bottomAnchor.constraint(equalTo: subview.bottomAnchor,
                                                                 constant: -Constant.space),
                    self.avatarImageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor,
                                                                   constant: -Constant.space * 2)
                ])
            }
        }
    }
}

