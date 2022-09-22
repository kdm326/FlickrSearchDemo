//
//  FlickrSearch.swift
//  Tests iOS
//
//  Created by Kevin McKenney on 9/22/22.
//

import Foundation

struct FlickrSearch: Decodable {
    let items: [Item]
    
    struct Item: Identifiable {
        let id = UUID()
        let title: String
        let userName: String
        let widthText: String
        let heightText: String
        let imageURL: String
        var imageHeight: Double { Double(heightText) ?? 0 }
    }
}


extension FlickrSearch.Item: Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case description
        case media
    }
    
    enum MediaKeys: String, CodingKey {
        case m
    }
    
    init(from decoder: Decoder) throws {
        let dataContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        title = try dataContainer.decode(String.self, forKey: .title)
        
        let author = try dataContainer.decode(String.self, forKey: .author)
        userName = author.extractString(after: "(\"")
        
        let description = try dataContainer.decode(String.self, forKey: .description)
        widthText = description.extractString(after: "width=\"")
        heightText = description.extractString(after: "height=\"")
        
        let mediaContainer = try dataContainer.nestedContainer(keyedBy: MediaKeys.self, forKey: .media)
        imageURL = try mediaContainer.decode(String.self, forKey: .m)
    }
}
