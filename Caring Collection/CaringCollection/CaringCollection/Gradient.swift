//
//  Gradient.swift
//  CaringCollection
//
//  Created by Vyacheslav Pronin on 17.08.2023.
//

import UIKit
import Foundation

struct Gradient {
    
    /// Координаты начала и конца градиента
    typealias Coordinat = (start: CGPoint, end: CGPoint)
    
    /// Размер
    let size: CGSize
    
    /// Цвета
    let colors: [CGColor]
    
    /// Координаты
    let coordinat: Coordinat
    
    /// Тип градиента
    let type: CAGradientLayerType
}

