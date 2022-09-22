//
//  Extensions.swift
//  SearchDemo
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

extension String {
    func extractString(after key: String) -> String {
        let start = self.range(of: key)?.upperBound ?? self.startIndex
        let end = self.suffix(from: start).firstIndex(of: "\"") ?? self.startIndex
        return String(self[start..<end])
    }
}

extension Shape {
    func borderedBackground() -> some View {
        ZStack {
            self.stroke(lineWidth: Constants.borderWidth).foregroundColor(.black)
            self.foregroundColor(.white)
        }
    }
}

extension View {
    func redBackground() -> some View {
        modifier(RedBackground())
    }
    
    func compactScroll() -> some View {
        modifier(CompactScroll())
    }
}
