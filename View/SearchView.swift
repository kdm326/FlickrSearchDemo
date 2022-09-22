//
//  SearchView.swift
//  Shared
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject private var demo = FlickrSearchDemo()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: Constants.gridWidth))]) {
                    ForEach(demo.searchItems) { item in
                        NavigationLink(destination: { DetailView(item: item) }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: Constants.thumbnailCorner)
                                    .borderedBackground()
                                TitledImageView(item: item)
                            }
                            .padding()
                        }
                    }
                }
            }
            .redBackground()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(demo.searchTerm)
            
        }
        .searchable(text: $demo.searchTerm)
        .navigationViewStyle(.stack)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
