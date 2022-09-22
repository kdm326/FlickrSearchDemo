//
//  RedBackground.swift
//  SearchDemo
//
//  Created by Kevin McKenney on 9/22/22.
//

import SwiftUI

struct RedBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.red.ignoresSafeArea()
            content
        }
    }
}

struct CompactScroll: ViewModifier {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    func body(content: Content) -> some View {
        if verticalSizeClass == .compact {
            ScrollView {
                content
            }
        } else {
            VStack {
                content
            }
        }
    }
}
