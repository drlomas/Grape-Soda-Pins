//
//  ViewController.swift
//  Grape Soda Pins
//
//  Created by Daniel Lomas on 10/06/2018.
//  Copyright © 2018 Snappy Days co. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DecelerationBehaviourTarget, RotatingWheelDelegate {
    @IBOutlet weak var rotatingView: RotatingWheel!
    @IBOutlet weak var snackLabel: UILabel!
    
    var deceleratingBehaviour: DecelerationBehaviour?
    var segmentSize: CGFloat = 0
    let snacks: [String] = ["CHURROS", "PREMIUM BAR", "PINEAPPLE WHIP", "COOKIE SANDWICH", "PRETZEL", "CARAMEL APPLE", "WAFFLE", "POPCORN"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotatingView.circleRadius = rotatingView.height / 2
        rotatingView.delegate = self
        rotatingView.shouldDecelerate = true
        rotatingView.referenceAngles = [degreeToRadian(degree: 45), degreeToRadian(degree: 90), degreeToRadian(degree: 135), degreeToRadian(degree: 180), degreeToRadian(degree: 225), degreeToRadian(degree: 270), degreeToRadian(degree: 315)]
        
        deceleratingBehaviour = DecelerationBehaviour.instance(with: self) as? DecelerationBehaviour
        deceleratingBehaviour?.smoothnessFactor = 0.9
        
        segmentSize = (2 * CGFloat.pi) / CGFloat(snacks.count)
    }
    
    @IBAction func didTapShop(sender: AnyObject) {
        if let url = NSURL(string: "https://www.grapesoda.co"){UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addTranslation(_ traslation: CGPoint) {
    }
    
    func rotatingWheelDidEndDeceletation(_ rotatingWheel: RotatingWheel?) {
        let angle = rotatingWheel?.angle
        let currentIndex = Int(floor(angle! / segmentSize))
        
        self.snackLabel.text = snacks[currentIndex]
        self.snackLabel.font = UIFont(name: self.snackLabel.font.fontName, size: 30)
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.snackLabel.transform = self.snackLabel.transform.scaledBy(x: 2, y: 2)
            UIView.animate(withDuration: 0.5, animations: {() -> Void in
                self.snackLabel.transform = self.snackLabel.transform.scaledBy(x: 0.5, y: 0.5)
            })
        })
    }
    
    func rotatingWheelDidEndDraging(_ rotatingWheel: RotatingWheel?) {
    }
    
    func rotatingWheelDidStartRotating(_ rotatingWheel: RotatingWheel?) {
        self.snackLabel.text = ""
        self.snackLabel.layer.removeAllAnimations()
    }
    
    func degreeToRadian(degree: CGFloat) -> CGFloat
    {
        return degree * CGFloat(Double.pi) / 180
    }
    
    func radianToDegree(radian: CGFloat) -> CGFloat
    {
        return radian / (CGFloat(Double.pi) / 180)
    }
}
