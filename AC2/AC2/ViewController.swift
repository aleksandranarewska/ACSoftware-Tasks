//
//  ViewController.swift
//  AC2
//
//  Created by Admin on 08/02/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
        let q1 = DispatchQueue(label: "Queue1")
        let q2 = DispatchQueue(label: "Queue2")
        q1.async {
            self.runLoop(queueId: q1.hash)
        }
        q2.async {
            self.runLoop(queueId: q2.hash)
        }
    }
    func runLoop(queueId: Int){
        for _ in 1...20{
            let randomTimeInSec = Double.random(in: 0.001..<1)
            Thread.sleep(forTimeInterval: TimeInterval(randomTimeInSec))
            let textToDisplay = "\n\(queueId):\((Int)(randomTimeInSec*1000))"
            DispatchQueue.main.sync {
                self.label.text! += textToDisplay
            }
        }
        DispatchQueue.main.sync {
            self.label.text! += "\ndone"
        }
    }

}

