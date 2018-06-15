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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rotatingView.circleRadius = rotatingView.height / 2
        rotatingView.delegate = self
        rotatingView.shouldDecelerate = true
        deceleratingBehaviour = DecelerationBehaviour.instance(with: self) as? DecelerationBehaviour
        deceleratingBehaviour?.smoothnessFactor = 0.9
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func addTranslation(_ traslation: CGPoint) {
    }
    
    func rotatingWheelDidEndDeceletation(_ rotatingWheel: RotatingWheel?) {
    }
    
    func rotatingWheelDidEndDraging(_ rotatingWheel: RotatingWheel?) {
    }
    
    func rotatingWheelDidStartRotating(_ rotatingWheel: RotatingWheel?) {
    }
}
