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
    var deceleratingBehaviour: DecelerationBehaviour?
    
    var snacks: [String] = ["Premium Bar", "Waffle", "Pineapple Whip", "Preztel", "Caramel Apple", "Cookie Sandwich", "Popcorn", "Churros"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotatingView.circleRadius = rotatingView.height / 2
        rotatingView.delegate = self
        rotatingView.shouldDecelerate = true
        rotatingView.referenceAngles = [0, degreeToRadian(degree: 45), degreeToRadian(degree: 90), degreeToRadian(degree: 135), degreeToRadian(degree: 180), degreeToRadian(degree: 225), degreeToRadian(degree: 270), degreeToRadian(degree: 315)]
        
        deceleratingBehaviour = DecelerationBehaviour.instance(with: self) as? DecelerationBehaviour
        deceleratingBehaviour?.smoothnessFactor = 0.9   
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
        let nearestIndex: NSInteger = (rotatingWheel?.nearestIndex)! - 1
        print(nearestIndex as Any)
        print(snacks[nearestIndex] as Any)
    }
    
    func rotatingWheelDidEndDraging(_ rotatingWheel: RotatingWheel?) {
    }
    
    func rotatingWheelDidStartRotating(_ rotatingWheel: RotatingWheel?) {
    }
    
    func degreeToRadian(degree: CGFloat) -> CGFloat
    {
        return degree * CGFloat(Double.pi) / 180
    }
}
