//
//  SectionType.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 05.05.2023.
//

import Foundation

enum SectionType: Int {
case latestSection = 0
case flashSale = 1
case brands = 2
    
var number: Int {
       
            return self.rawValue

    }
}
