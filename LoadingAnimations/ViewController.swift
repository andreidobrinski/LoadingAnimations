//
//  ViewController.swift
//  LoadingAnimations
//
//  Created by Andrei Dobrinski on 2017-09-28.
//  Copyright © 2017 Andrei Dobrinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let spiralOne = SpiralOne()
        
        spiralOne.drawSpiral()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

