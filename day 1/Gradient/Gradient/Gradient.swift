//
//  Gradient.swift
//  Gradient
//
//  Created by Vyacheslav Pronin on 01.07.2023.
//

import Foundation
import UIKit

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
