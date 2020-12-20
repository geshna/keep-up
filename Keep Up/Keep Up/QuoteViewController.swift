//
//  QuoteViewController.swift
//  Keep Up
//
//  Created by Lisa Tang on 12/19/20.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var btnGenerate: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!


    //These are the imgs
    var arrayOfQuotes: [String] = ["If you don’t go after what you want, you’ll never have it. If you don’t ask, the answer is always no. If you don’t step forward, you’re always in the same place. \n - Nora Roberts",
                                   "Set your goals high, and don't stop till you get there. \n - Bo Jackson",
                                   "If you don't like how things are, change it! You're not a tree. \n - Jim Rohn" ,
                                   "If you're going through hell, keep going. \n - Winston Churchill",
     "You can get everything in life you want if you will just help enough other people get what they want. \n - Zig Ziglar" ,
                          "Formal education will make you a living; self-education will make you a fortune. \n - Jim Rohn", "I don’t stop when I’m tired. I stop when I’m done."]




    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    @IBAction func btnGenerateQuote(_ sender: Any) {

        let random =  Int(arc4random_uniform(6))
        let quotesGenerated = arrayOfQuotes[random]
        let quote = quotesGenerated
         print(quote)
        quoteLabel.text = "\(quote)"

    }


}
