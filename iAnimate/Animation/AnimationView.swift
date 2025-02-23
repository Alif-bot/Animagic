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
        view.backgroundColor = .clear
        
        // Flag Pole
        let poleLayer = CALayer()
        poleLayer.frame = CGRect(x: 20, y: 50, width: 10, height: 250)
        poleLayer.backgroundColor = UIColor.brown.cgColor
        view.layer.addSublayer(poleLayer)

        // 🇧🇩 Flag Shape (Curved Wave)
        let flagLayer = CAShapeLayer()
        let flagPath = UIBezierPath()
        
        // Define a curved shape (S-like waving flag)
        flagPath.move(to: CGPoint(x: 30, y: 50))
        flagPath.addCurve(to: CGPoint(x: 230, y: 50), controlPoint1: CGPoint(x: 100, y: 30), controlPoint2: CGPoint(x: 160, y: 70))
        flagPath.addLine(to: CGPoint(x: 230, y: 180))
        flagPath.addCurve(to: CGPoint(x: 30, y: 180), controlPoint1: CGPoint(x: 160, y: 200), controlPoint2: CGPoint(x: 100, y: 160))
        flagPath.close()

        flagLayer.path = flagPath.cgPath
        flagLayer.fillColor = UIColor(red: 0, green: 0.42, blue: 0.24, alpha: 1).cgColor // Green color
        view.layer.addSublayer(flagLayer)

        //  Red Circle (Inside the Flag)
        let redCircle = CAShapeLayer()
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 95, y: 85, width: 60, height: 60)) // Adjusted for correct placement
        redCircle.path = circlePath.cgPath
        redCircle.fillColor = UIColor(red: 0.89, green: 0.12, blue: 0.09, alpha: 1).cgColor
        flagLayer.addSublayer(redCircle) // Attach to flagLayer so it moves together

        // Waving Animation
        NotificationCenter.default.addObserver(forName: .triggerAnimation, object: nil, queue: .main) { _ in
            let waveAnimation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            waveAnimation.values = [0, 8, -5, 6, -3, 2, 0] // Smooth waving effect
            waveAnimation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 0.9, 1]
            waveAnimation.duration = 1.5
            waveAnimation.repeatCount = .infinity
            waveAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            let skewAnimation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
            skewAnimation.values = [0.02, -0.02, 0.01, -0.01, 0]
            skewAnimation.keyTimes = waveAnimation.keyTimes
            skewAnimation.duration = waveAnimation.duration
            skewAnimation.repeatCount = .infinity
            skewAnimation.timingFunction = waveAnimation.timingFunction

            let animationGroup = CAAnimationGroup()
            animationGroup.animations = [waveAnimation, skewAnimation]
            animationGroup.duration = waveAnimation.duration
            animationGroup.repeatCount = .infinity
            
            flagLayer.add(animationGroup, forKey: "waving")
        }

        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
