//
//  ViewController.swift
//  CAReplicatorLearning
//
//  Created by Hesse Huang on 2017/2/7.
//  Copyright © 2017年 Hesse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var pulseLayer: CAShapeLayer!
    
    var scaleAnimation: CABasicAnimation {
        let a = CABasicAnimation(keyPath: "transform")
        let t = CATransform3DIdentity
        a.fromValue = NSValue(caTransform3D: CATransform3DScale(t, 0.5, 0.5, 0.5))
        a.toValue = NSValue(caTransform3D: CATransform3DScale(t, 1, 1, 1))
        return a
    }
    
    var opacityAnimation: CABasicAnimation {
        let a = CABasicAnimation(keyPath: "opacity")
        a.fromValue = 1.0
        a.toValue = 0.2
        return a
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        pulseLayer = CAShapeLayer()
        pulseLayer.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        pulseLayer.path = UIBezierPath(ovalIn: pulseLayer.bounds).cgPath
        pulseLayer.fillColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).cgColor
        
        let replicatorLayerX = CAReplicatorLayer()
        replicatorLayerX.instanceCount = 8
        replicatorLayerX.instanceDelay = 0.1
        replicatorLayerX.instanceTransform = CATransform3DMakeTranslation(32, 0, 0)
        replicatorLayerX.addSublayer(pulseLayer)
        
        let replicatorLayerY = CAReplicatorLayer()
        replicatorLayerY.frame = CGRect(x: 60, y: 100, width: 30, height: 30)
        replicatorLayerY.instanceCount = 8
        replicatorLayerY.instanceDelay = 0.1
        replicatorLayerY.instanceTransform = CATransform3DMakeTranslation(0, 32, 0)
        replicatorLayerY.addSublayer(replicatorLayerX)
        
        view.layer.addSublayer(replicatorLayerY)
    
    }

    @IBAction func startAnimation(_ sender: UIButton) {
        let ag = CAAnimationGroup()
        ag.animations = [scaleAnimation, opacityAnimation]
        ag.duration = 0.8
        ag.autoreverses = true
        ag.repeatCount = 10000
        pulseLayer.add(ag, forKey: "groupAnimation")
    }


}

