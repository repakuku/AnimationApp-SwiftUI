//
//  ContentView.swift
//  Path
//
//  Created by Alexey Turulin on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var elementIsShowing = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemCyan)
                .ignoresSafeArea()
            VStack {
                Button(action: { buttonAction() }) {
                    Image(systemName: "chevron.up.square")
                        .foregroundColor(elementIsShowing ? .white : .black)
                        .rotationEffect(.degrees(elementIsShowing ? 0 : 180))
                        .scaleEffect(elementIsShowing ? 2 : 1)
                }
                
                Spacer()
                
                ElementView(color: elementIsShowing ? .white : .black)
                    .frame(width: 250, height: 250)
                    .offset(y: elementIsShowing ? 0 : UIScreen.main.bounds.height / 2)
                    .scaleEffect(elementIsShowing ? 2 : 0.5)
                
//                if elementIsShowing {
//                    ElementView(color: .white)
//                        .frame(width: 250, height: 250)
//                        .transition(.bottomSlide)
//                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    private func buttonAction() {
        withAnimation {
            elementIsShowing.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AnyTransition {
    static var bottomSlide: AnyTransition {
        let insertion = AnyTransition.move(edge: .bottom)
            .combined(with: .scale)
        let removal = AnyTransition.move(edge: .bottom)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}
