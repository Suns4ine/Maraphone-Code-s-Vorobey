//
//  TableViewCell.swift
//  TableWithRandomCells
//
//  Created by Vyacheslav Pronin on 15.08.2023.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    static let identifier = "Cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .systemFill
        
        let selectedView = UIView()
        selectedView.backgroundColor = UIColor.systemTeal
        selectedBackgroundView = selectedView
    }
}
