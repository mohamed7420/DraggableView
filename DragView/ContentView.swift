//
//  ContentView.swift
//  DragView
//
//  Created by Mohamed Osama on 18/02/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var startingOffset: CGFloat = UIScreen.main.bounds.height * 0.88
    @State private var currentOffset: CGFloat = .zero
    @State private var endingOffset: CGFloat = .zero
    
    var body: some View {
        DraggableView()
            .offset(y: startingOffset)
            .offset(y: currentOffset)
            .offset(y: endingOffset)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        withAnimation(.spring) {
                            currentOffset = value.translation.height
                        }
                    }
                    .onEnded { value in
                        withAnimation(.spring) {
                            if currentOffset < -150 {
                                endingOffset = -startingOffset
                                currentOffset = 0
                            } else if endingOffset != 0 && currentOffset > 150 {
                                endingOffset = 0
                                currentOffset = 0
                            } else {
                                currentOffset = 0
                            }
                        }
                    }
            )
    }
}

#Preview {
    ZStack {
        Color.gray.ignoresSafeArea()
        ContentView()
    }.ignoresSafeArea(edges: .bottom)
}

struct DraggableView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
            
            Text("Hello, SwiftUI Developers!!")
                .foregroundStyle(.black)
                .bold()
            Text("SwiftUI is a user interface framework for building user interfaces for iOS, iPadOS, watchOS, tvOS, visionOS and macOS, developed by Apple Inc. for the Swift programming language.")
                .foregroundStyle(.black)
                .font(Font.system(size: 15, weight: .medium))
            
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
        .frame(maxHeight: .infinity)
        .background(.white)
        .cornerRadius(20)
    }
}
