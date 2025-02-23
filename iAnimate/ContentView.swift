//
//  ContentView.swift
//  iAnimate
//
//  Created by Md Alif Hossain on 23/2/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Animagic")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Spacer()
                
                AnimationView()
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                Button("Animate") {
                    animate.toggle()
                    NotificationCenter.default.post(name: .triggerAnimation, object: nil)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                NavigationLink("More Animations", destination: AnimationGalleryView())
                    .padding()
            }
            .padding()
        }
    }
}

