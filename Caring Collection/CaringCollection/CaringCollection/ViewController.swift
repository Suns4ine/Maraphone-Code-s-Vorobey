//
//  ViewController.swift
//  CaringCollection
//
//  Created by Vyacheslav Pronin on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var memes = [String]()
    
    private lazy var backgroundView: GradientView = {
        GradientView(gradient: Gradient(size: .zero,
                                        colors: [UIColor.systemRed.cgColor,
                                                 UIColor.systemYellow.cgColor],
                                        coordinat: (start: CGPoint(x: 1, y: 0),
                                                    end: CGPoint(x: 1, y: 1)),
                                        type: .axial))
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = CustomFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constant.width, height: Constant.height)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        memes = ["cats", "arozgovorov", "monkeys", "ouMay",
                 "paebat", "party", "pischu", "top", "ucheny",
                 "what", "yea", "yes"].shuffled()
        
        setup()
        setupConstraint()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier,
                                                            for: indexPath) as? CollectionCell
        else { return .init() }
        cell.setupImage(image: UIImage(named: memes[indexPath.row]))
        
        return cell
    }
}

private extension ViewController {
   
    func setup() {
        [backgroundView, collectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self,
                                forCellWithReuseIdentifier: CollectionCell.identifier)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        title = "Collection"
    }
    
    func setupConstraint() {
        let safeGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor,
                                                constant: Constant.space),
            collectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor,
                                                    constant: Constant.space),
            collectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor,
                                                     constant: -Constant.space),
            collectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor,
                                                   constant: -Constant.space)
        ])
    }
}
