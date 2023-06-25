//
//  DownloadManager.swift
//  TestApp
//
//  Created by Дмитрий Лоренц on 25.06.2023.
//

import Foundation

class DownloadManager {
    
    // Latest https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7
    // Sale https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac
    // Detailed https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239
    
    enum ParsingErrors: Error {
        case decodingProblem
    }
    
    enum ParsingType: String {
        case latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case sale = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        case detailed = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
    }

    class  DownloadManager {
        var urlString: String! //= "https://restcountries.com/v3.1/all"
        let decoder = JSONDecoder()
        
        
        func getData<T: Codable>(urlString: ParsingType, parseProtocol: T.Type, completion: @escaping (Result<T, Error>) -> () ) {
           
            guard let url = URL(string: urlString.rawValue) else {
                print("Incorrect URL")
                return}
            
            URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
                
                guard let self = self else {
                    print("No self")
                    return }
                guard let downloadedData = data, error == nil else {
                    completion(.failure(error!))
                    return}
                
                
                guard let parsedData = try? self.decoder.decode(parseProtocol, from: downloadedData) else {
                    completion(.failure(error ?? ParsingErrors.decodingProblem))
                    return}
                completion(.success(parsedData))
            }.resume()
        }
        
        
        
    }

}
