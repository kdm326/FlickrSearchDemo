//
//  TitledImageView.swift
//  SearchDemo
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

struct TitledImageView: View {
    
    var item: FlickrSearch.Item
    
    var isThumbnail = true
    var lineLimit: Int { isThumbnail ? Constants.thumbnailLines : Constants.detailLines }
    var height: CGFloat { isThumbnail ? Constants.thumbnailSide : CGFloat(item.imageHeight) }
    
    var body: some View {
        VStack {
            Text(item.title).lineLimit(lineLimit)
                .padding()
            AsyncImage(url: URL(string: item.imageURL)) {
                isThumbnail ? $0.resizable() : $0
            } placeholder: {
                Image(systemName: "clock")
            }
            .frame(height: height)
          
            .padding()
        }
    }
}
