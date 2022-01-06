//
//  EncyclopediaModel.swift
//  Studio Ghibli Encyckopedia
//
//  Created by administrator on 06/01/2022.
//

import Foundation


class EncyclopediaModel {
    static func getData(with url: String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = URL(string: url)
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: completionHandler)
        task.resume()
    }
}
