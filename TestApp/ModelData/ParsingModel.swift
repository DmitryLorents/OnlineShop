//
//  Model.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 25.06.2023.
//

import Foundation

// Latest https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7
// Sale https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac
// Detailed https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239

//MARK: - Latest
struct Latest: Codable {
    let latest: [LatestInfo]
}

struct LatestInfo: Codable {
    let category,name : String
    let price : Int
    let urlString: String
    
    enum CodingKeys: String, CodingKey {
        case urlString = "image_url"
        case category
        case name
        case price
    }
}

//MARK: - Sale
struct Sale: Codable {
    let flashSale: [SaleInfo]
    
    enum CodingKeys: String, CodingKey {
        case flashSale = "flash_sale"
    }
}

struct SaleInfo: Codable {
    let category,name : String
    let price : Double
    let discount: Int
    let urlString: String
    
    enum CodingKeys: String, CodingKey {
        case urlString = "image_url"
        case category
        case name
        case price
        case discount
    }
}

//MARK: - Detailed

struct Detailed: Codable {
    let name: String
    let description: String
    let rating: Double
    let numberOfReviews: Int
    let price: Int
    let colors: [String]
    let imageUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case numberOfReviews = "number_of_reviews"
        case name
        case description
        case rating
        case colors
        case price
        case imageUrls = "image_urls"
    }
}
