//
//  Constants.swift
//  SearchDemo
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

struct Constants {
    static let apiURL = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    static let thumbnailSide: CGFloat = 120
    static var gridWidth: CGFloat { thumbnailSide * 4 / 3 }
    static var thumbnailCorner: CGFloat { thumbnailSide / 24 }
    static let thumbnailLines = 1
    static let detailLines = 4
    static let borderWidth: CGFloat = 5
    static let searchCorner: CGFloat = 10
}


