//
//  AdvancedAnimationView.swift
//  iAnimate
//
//  Created by Md Alif Hossain on 23/2/25.
//

import SwiftUI

struct AdvancedAnimationView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        // Stroke Animation
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: CGPoint(x: 150, y: 150), radius: 80, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.systemPink.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeEnd = 0
        view.layer.addSublayer(shapeLayer)
        
        let strokeAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeAnimation.toValue = 1
        strokeAnimation.duration = 2
        strokeAnimation.repeatCount = .infinity
        shapeLayer.add(strokeAnimation, forKey: "strokeAnimation")
        
        // Particle Animation
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: 150, y: 400)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: 300, height: 1)
        
        let cell = CAEmitterCell()
        cell.birthRate = 10
        cell.lifetime = 3.0
        cell.velocity = 150
        cell.scale = 0.1
        cell.emissionRange = .pi / 4
        cell.contents = UIImage(systemName: "star.fill")?.cgImage
        
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(emitterLayer)
        
        // Gradient Animation
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.purple.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.toValue = [UIColor.red.cgColor, UIColor.orange.cgColor]
        colorAnimation.duration = 3
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = .infinity
        gradientLayer.add(colorAnimation, forKey: "gradientAnimation")
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    AdvancedAnimationView()
}
