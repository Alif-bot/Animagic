//
//  AnimationView.swift
//  iAnimate
//
//  Created by Md Alif Hossain on 23/2/25.
//

import SwiftUI
import UIKit

struct AnimationView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let layer = CALayer()
        layer.backgroundColor = UIColor.blue.cgColor
        layer.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
        layer.cornerRadius = 20
        view.layer.addSublayer(layer)
        
        NotificationCenter.default.addObserver(forName: .triggerAnimation, object: nil, queue: .main) { _ in
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1.0
            animation.toValue = 1.5
            animation.duration = 1.0
            animation.autoreverses = true
            animation.repeatCount = .infinity
            layer.add(animation, forKey: "scale")
        }
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
