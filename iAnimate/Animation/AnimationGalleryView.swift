//
//  AnimationGalleryView.swift
//  iAnimate
//
//  Created by Md Alif Hossain on 23/2/25.
//

import SwiftUI

struct AnimationGalleryView: View {
    @State private var rotate = false
    @State private var fade = false
    @State private var move = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Animation Gallery")
                .font(.title)
                .bold()
                .padding()
            
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotate ? 360 : 0))
                .animation(.easeInOut(duration: 1), value: rotate)
                .onTapGesture {
                    rotate.toggle()
                }
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
                .opacity(fade ? 0.1 : 1.0)
                .animation(.easeInOut(duration: 1), value: fade)
                .onTapGesture {
                    fade.toggle()
                }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange)
                .frame(width: 100, height: 100)
                .offset(x: move ? 100 : -100)
                .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1), value: move)
                .onTapGesture {
                    move.toggle()
                }
            
            NavigationLink("Advanced Animations", destination: AdvancedAnimationView())
                .padding()
        }
        .padding()
    }
}
