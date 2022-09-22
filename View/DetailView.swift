//
//  DetailView.swift
//  SearchDemo
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

struct DetailView: View {
    
    var item: FlickrSearch.Item
    
    var body: some View {
        Section {
            TitledImageView(item: item, isThumbnail: false)
            HStack {
                Text("Width: \(item.widthText)")
                Text("Height: \(item.heightText)")
            }
            Text("Posted by: \(item.userName)")
            Spacer()
        }
        .compactScroll()
        .redBackground()
        .navigationBarTitleDisplayMode(.inline)
    }
}
