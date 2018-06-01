//
//  SpiralOne.swift
//  LoadingAnimations
//
//  Created by Andrei Dobrinski on 2017-09-28.
//  Copyright © 2017 Andrei Dobrinski. All rights reserved.
//

import UIKit

@IBDesignable class SpiralOne: UIView {
    
    override func draw(_ rect: CGRect) {
        drawSpiral()
    }
    
    @IBOutlet var view: UIView!
    
    //Boilerplate
    
    public override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)
        postInitSetUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        postInitSetUp()
    }
    
    private func postInitSetUp() {
        backgroundColor = .clear
        loadView()
        configureView()
        addSubview(view)
    }
    
    private func loadView() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let _ = nib.instantiate(withOwner: self, options: nil)
    }
    
    private func configureView() {
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func drawSpiral() {
        
        // set up the rect containers for the circles
        
        let ovalStartAngle = CGFloat(90.01 * Double.pi/180)
        let ovalEndAngle = CGFloat(90 * Double.pi/180)
        let container = CGRect(x: view.center.x - 100, y: view.center.y - 100, width: 200, height: 200)
        let topCircleRect = CGRect(x: view.center.x - 50, y: view.center.y - 100, width: 100, height: 100)
        let bottomCircleRect = CGRect(x: view.center.x - 50, y: view.center.y, width: 100, height: 100)
        let leftCircleRect = CGRect(x: view.center.x - 100, y: view.center.y - 50, width: 100, height: 100)
        let rightCircleRect = CGRect(x: view.center.x, y: view.center.y - 50, width: 100, height: 100)
        
        // add the bezier path
        
        let containerPath = UIBezierPath()
        let containerPath180 = UIBezierPath()
        let containerPath270 = UIBezierPath()
        let containerPath360 = UIBezierPath()
        let topCirclePath = UIBezierPath()
        let bottomCirclePath = UIBezierPath()
        let leftCirclePath = UIBezierPath()
        let rightCirclePath = UIBezierPath()
        
        containerPath.addArc(withCenter: CGPoint(x: container.midX, y: container.midY),
                        radius: container.width / 2,
                        startAngle: ovalStartAngle,
                        endAngle: ovalEndAngle, clockwise: true)
        
        containerPath180.addArc(withCenter: CGPoint(x: container.midX, y: container.midY),
                           radius: container.width / 2,
                           startAngle: CGFloat(180.01 * Double.pi/180),
                           endAngle: CGFloat(180 * Double.pi/180), clockwise: true)
        
        containerPath270.addArc(withCenter: CGPoint(x: container.midX, y: container.midY),
                           radius: container.width / 2,
                           startAngle: CGFloat(270.01 * Double.pi/180),
                           endAngle: CGFloat(270 * Double.pi/180), clockwise: true)
        
        containerPath360.addArc(withCenter: CGPoint(x: container.midX, y: container.midY),
                           radius: container.width / 2,
                           startAngle: CGFloat(360.01 * Double.pi/180),
                           endAngle: CGFloat(360 * Double.pi/180), clockwise: true)
        
        topCirclePath.addArc(withCenter: CGPoint(x: topCircleRect.midX, y: topCircleRect.midY),
                         radius: topCircleRect.width / 2,
                         startAngle: CGFloat(90.01 * Double.pi/180),
                         endAngle: CGFloat(90 * Double.pi/180), clockwise: true)
        
        bottomCirclePath.addArc(withCenter: CGPoint(x: bottomCircleRect.midX, y: bottomCircleRect.midY),
                         radius: bottomCircleRect.width / 2,
                         startAngle: CGFloat(270.01 * Double.pi/180),
                         endAngle: CGFloat(270 * Double.pi/180), clockwise: true)
        
        leftCirclePath.addArc(withCenter: CGPoint(x: leftCircleRect.midX, y: leftCircleRect.midY),
                         radius: leftCircleRect.width / 2,
                         startAngle: CGFloat(360 * Double.pi/180),
                         endAngle: CGFloat(360.01 * Double.pi/180), clockwise: false)
        
        rightCirclePath.addArc(withCenter: CGPoint(x: rightCircleRect.midX, y: rightCircleRect.midY),
                         radius: rightCircleRect.width / 2,
                         startAngle: CGFloat(180 * Double.pi/180),
                         endAngle: CGFloat(180.01 * Double.pi/180), clockwise: false)
        
        
        // create the line from the path
        
        let containerLine = CAShapeLayer()
        containerLine.path = containerPath.cgPath
        containerLine.strokeColor = UIColor.blue.cgColor
        containerLine.fillColor = UIColor.clear.cgColor
        containerLine.lineWidth = 2.0
        containerLine.lineCap = kCALineCapRound
        containerLine.lineDashPattern = [157.08]
        
        let containerLine180 = CAShapeLayer()
        containerLine180.path = containerPath180.cgPath
        containerLine180.strokeColor = UIColor.blue.cgColor
        containerLine180.fillColor = UIColor.clear.cgColor
        containerLine180.lineWidth = 2.0
        containerLine180.lineCap = kCALineCapRound
        containerLine180.lineDashPattern = [157.08]
        
        let containerLine270 = CAShapeLayer()
        containerLine270.path = containerPath270.cgPath
        containerLine270.strokeColor = UIColor.blue.cgColor
        containerLine270.fillColor = UIColor.clear.cgColor
        containerLine270.lineWidth = 2.0
        containerLine270.lineCap = kCALineCapRound
        containerLine270.lineDashPattern = [157.08]
        
        let containerLine360 = CAShapeLayer()
        containerLine360.path = containerPath360.cgPath
        containerLine360.strokeColor = UIColor.blue.cgColor
        containerLine360.fillColor = UIColor.clear.cgColor
        containerLine360.lineWidth = 2.0
        containerLine360.lineCap = kCALineCapRound
        containerLine360.lineDashPattern = [157.08]
        
        let topCircleLine = CAShapeLayer()
        topCircleLine.path = topCirclePath.cgPath
        topCircleLine.strokeColor = UIColor.blue.cgColor
        topCircleLine.fillColor = UIColor.clear.cgColor
        topCircleLine.lineWidth = 2.0
        topCircleLine.lineCap = kCALineCapRound
        
        let bottomCircleLine = CAShapeLayer()
        bottomCircleLine.path = bottomCirclePath.cgPath
        bottomCircleLine.strokeColor = UIColor.blue.cgColor
        bottomCircleLine.fillColor = UIColor.clear.cgColor
        bottomCircleLine.lineWidth = 2.0
        bottomCircleLine.lineCap = kCALineCapRound
        
        let leftCircleLine = CAShapeLayer()
        leftCircleLine.path = leftCirclePath.cgPath
        leftCircleLine.strokeColor = UIColor.blue.cgColor
        leftCircleLine.fillColor = UIColor.clear.cgColor
        leftCircleLine.lineWidth = 2.0
        leftCircleLine.lineCap = kCALineCapRound
        
        let rightCircleLine = CAShapeLayer()
        rightCircleLine.path = rightCirclePath.cgPath
        rightCircleLine.strokeColor = UIColor.blue.cgColor
        rightCircleLine.fillColor = UIColor.clear.cgColor
        rightCircleLine.lineWidth = 2.0
        rightCircleLine.lineCap = kCALineCapRound
        
        // add the layer to the screen
        
        self.view.layer.addSublayer(containerLine)
        self.view.layer.addSublayer(containerLine180)
        self.view.layer.addSublayer(containerLine270)
        self.view.layer.addSublayer(containerLine360)
        self.view.layer.addSublayer(topCircleLine)
        self.view.layer.addSublayer(bottomCircleLine)
        self.view.layer.addSublayer(leftCircleLine)
        self.view.layer.addSublayer(rightCircleLine)
        
        // create an animation and delayed animation for stroke start and end
        
        let animateStrokeStart = CABasicAnimation(keyPath: "strokeStart")
        animateStrokeStart.duration = 2.0
        animateStrokeStart.fromValue = -0.4
        animateStrokeStart.toValue = 1.0
        animateStrokeStart.beginTime = CACurrentMediaTime()
        animateStrokeStart.fillMode = kCAFillModeForwards
        animateStrokeStart.autoreverses = true
        animateStrokeStart.repeatCount = .infinity
        animateStrokeStart.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let animateStrokeStartDelayed = CABasicAnimation(keyPath: "strokeStart")
        animateStrokeStartDelayed.duration = 2.0
        animateStrokeStartDelayed.fromValue = -0.5
        animateStrokeStartDelayed.toValue = 1.0
        animateStrokeStartDelayed.beginTime = CACurrentMediaTime()
        animateStrokeStartDelayed.fillMode = kCAFillModeForwards
        animateStrokeStartDelayed.autoreverses = true
        animateStrokeStartDelayed.repeatCount = .infinity
        animateStrokeStartDelayed.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let animateStrokeEnd = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEnd.duration = 2.0
        animateStrokeEnd.fromValue = -0.15
        animateStrokeEnd.toValue = 1.0
        animateStrokeEnd.beginTime = CACurrentMediaTime()
        animateStrokeEnd.fillMode = kCAFillModeBackwards
        animateStrokeEnd.autoreverses = true
        animateStrokeEnd.repeatCount = .infinity
        animateStrokeEnd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let animateStrokeEndDelayed = CABasicAnimation(keyPath: "strokeEnd")
        animateStrokeEndDelayed.duration = 2.0
        animateStrokeEndDelayed.fromValue = 0.0
        animateStrokeEndDelayed.toValue = 1.0
        animateStrokeEndDelayed.beginTime = CACurrentMediaTime()
        animateStrokeEndDelayed.fillMode = kCAFillModeBackwards
        animateStrokeEndDelayed.autoreverses = true
        animateStrokeEndDelayed.repeatCount = .infinity
        animateStrokeEndDelayed.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        // add the animations
        
        containerLine.add(animateStrokeStart, forKey: "animate stroke start animation")
        containerLine.add(animateStrokeEnd, forKey: "animate stroke end animation")
        
        containerLine180.add(animateStrokeStart, forKey: "animate stroke start animation")
        containerLine180.add(animateStrokeEnd, forKey: "animate stroke end animation")
        
        containerLine270.add(animateStrokeStart, forKey: "animate stroke start animation")
        containerLine270.add(animateStrokeEnd, forKey: "animate stroke end animation")
        
        containerLine360.add(animateStrokeStart, forKey: "animate stroke start animation")
        containerLine360.add(animateStrokeEnd, forKey: "animate stroke end animation")
        
        topCircleLine.add(animateStrokeEndDelayed, forKey: "animate stroke end animation")
        bottomCircleLine.add(animateStrokeEndDelayed, forKey: "animate stroke end animation")
        leftCircleLine.add(animateStrokeEndDelayed, forKey: "animate stroke end animation")
        rightCircleLine.add(animateStrokeEndDelayed, forKey: "animate stroke end animation")
        
        bottomCircleLine.add(animateStrokeStartDelayed, forKey: "animate stroke start")
        leftCircleLine.add(animateStrokeStartDelayed, forKey: "animate stroke start")
        topCircleLine.add(animateStrokeStartDelayed, forKey: "animate stroke start")
        rightCircleLine.add(animateStrokeStartDelayed, forKey: "animate stroke start")
    }
}
