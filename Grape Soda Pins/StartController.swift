//
//  StartPage.swift
//  Grape Soda Pins
//
//  Created by Daniel Lomas on 15/06/2018.
//  Copyright © 2018 Snappy Days co. All rights reserved.
//

import UIKit

class StartController: UIViewController
{
    @IBAction func didTapShop(sender: AnyObject) {
        if let url = NSURL(string: "https://www.grapesoda.co"){UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
}
