//
//  ViewController.swift
//  hw-4-O-o
//
//  Created by abdullah alsayegh on 29/06/2020.
//  Copyright © 2020 abdullah alsayegh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    
    var buttons: [UIButton] = []
     var counter = 0
    
    override func viewDidLoad() {
        buttons = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
    }
    
    @IBAction func press(_ sender: UIButton) {
       print("تم الضغط عليي")
    
        if counter % 2 == 0{
            
        
        sender.setTitle("X", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            turnLabel.text = "O Turn"
    }
        else {
            sender.setTitle("O", for: .normal)
             sender.setTitleColor(.orange, for: .normal)
             turnLabel.text = "X Turn"
        }
        counter += 1
        print(counter)
        sender.isEnabled = false
        
        winning(winner: "X")
        winning(winner: "O")
    }
      
    @IBAction func resetTapped() {
        self.restartGame()
    }
    
    
    func winning(winner : String)
    {
         var winner = false
        
        if (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner)
               ||
           (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
           (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
           (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
           (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
           (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
           (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
           (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            print("\(winner) الفائز")
            
            winner = true
            let alertController = UIAlertController(title: " 🎉🎊🎁  \(winner)  مبرووووك  فاز", message: "قم بالضغط على الزر التالي كي  يتم إعادة الللعب ", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "إعادة الللعب", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
        if counter == 9 && winner == false {
        print("draw")

    }
    }
    
    func restartGame()
    {
        for b in buttons{
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        counter = 0
        turnLabel.text = "X Turn"
    }
}
    



