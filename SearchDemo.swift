//
//  SearchDemo.swift
//  Tests iOS
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

@MainActor class FlickrSearchDemo: ObservableObject {
    
    var searchTerm: String = "" {
        didSet {
            search()
        }
    }
    
    @Published private(set) var searchItems: [FlickrSearch.Item] = []
    
    private func search() {
        guard let url = URL(string: Constants.apiURL + searchTerm) else { return }
        
        Task {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 404 {
                        print("404: ", response)
                    }
                }
                
                let search = try JSONDecoder().decode(FlickrSearch.self, from: data)
                self.searchItems = search.items
            } catch {
                print(error)
            }
        }
    }
}

