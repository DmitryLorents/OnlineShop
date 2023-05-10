//
//  UIFont+extension.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 10.05.2023.
//

import UIKit

enum FontType: String {
    case black = "Montserrat-Black"
    case bold = "Montserrat-Bold"
    case light = "Montserrat-Light"
    case medium = "Montserrat-Medium"
    case regular = "Montserrat-Regular"
    case semiBold = "Montserrat-SemiBold"
}

extension UIFont {
    static func montserrat(_ type: FontType, _ size: CGFloat) -> UIFont{
        UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
