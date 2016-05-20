//
//  ViewController.swift
//  Project2
//
//  Created by Chuk Onwubuya on 5/19/16.
//  Copyright © 2016 Chuk Onwubuya. All rights reserved.
//

import UIKit
import GameplayKit
class ViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2:UIButton!
    @IBOutlet weak var button3:UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
          countries.append("estonia")
          countries.append("france")
          countries.append("germany")
          countries.append("ireland")
          countries.append("italy")
          countries.append("monaco")
          countries.append("poland")
          countries.append("nigeria")
          countries.append("poland")
          countries.append("russia")
          countries.append("spain")
          countries.append("uk")
          countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGrayColor().CGColor
        button2.layer.borderColor = UIColor.lightGrayColor().CGColor
        button3.layer.borderColor = UIColor.lightGrayColor().CGColor
        
            askQuestion(nil)
             }
    
    func askQuestion(action: UIAlertAction!){
        
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextIntWithUpperBound(3)
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        title = countries[correctAnswer].uppercaseString
        
        
        
    
    }
    

    @IBAction func buttonTapped(sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer{
            title = "Correct"
            score += 1
        
        }
        
        else{
            title = "Wrong"
            score -= 1
        
        }
        
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion ))
        presentViewController(ac, animated: true, completion: nil)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

