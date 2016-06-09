//
//  DetailViewController.swift
//  ConversationalCards
//
//  Created by Avi Tannenbaum on 3/20/16.
//  Copyright © 2016 Avi Tannenbaum. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var modeLabel: UILabel!
    
   
    
   
    
    var card: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let card = card {
            navigationItem.title = card.name?.capitalizedString
            imageView.image = UIImage(named: card.name!.lowercaseString)
            titleLabel.text = card.title?.capitalizedString
            
            //Mode label
            modeLabel.text = card.mode?.capitalizedString
            
            self.setStyle()
            
            // get custom text from text field
           
            
            
                       // Color the text backgrounds and then resize them later for the cards
            //Red
            switch card.color ?? "none" {   // default to none
            case "0":    titleLabel.backgroundColor = UIColor(red:0.93, green:0.33, blue:0.36, alpha:1.0)
            
          
                // color hex code #EE535D
                
            case "1":    titleLabel.backgroundColor = UIColor(red:0.29, green:0.74, blue:0.70, alpha:1.0)
                
                // color hex code #4ABCB2
                
            case "2":    titleLabel.backgroundColor = UIColor(red:0.92, green:0.65, blue:0.09, alpha:1.0)
                
                // color hex code #EAA516
                
            case "3":    titleLabel.backgroundColor = UIColor(red:0.15, green:0.40, blue:0.57, alpha:0.3)
                         titleLabel.textColor = UIColor(red:1.00, green:1.00, blue:0.95, alpha:1.0)
                
                // color hex code #276592
                
            case "4":    titleLabel.backgroundColor = UIColor(red:0.65, green:0.80, blue:0.39, alpha:1.0)
                
                // color hex code #A6CC63
                
            case "5":    titleLabel.backgroundColor = UIColor(red:0.78, green:0.30, blue:0.35, alpha:1.0)
                
                // color hex code #C84D59
                
            case "6":    titleLabel.backgroundColor = UIColor(red:0.40, green:0.34, blue:0.54, alpha:1.0)
                
                // color hex code #67578A
                
            default:     titleLabel.hidden = false
            }
            
            // Label style
           // self.titleLabelStyle()
            
            
            
        }
        
        
    }
    
    
    
    // font style
    
    func setStyle() {
        
        
    
    
    // Script in charge of main label text font and text size
    titleLabel.font = UIFont(name: "TrajanPro3-Regular", size: 26.0)
    titleLabel.font = UIFont.boldSystemFontOfSize(26)
    titleLabel.font = UIFont.italicSystemFontOfSize(26)
    titleLabel.font = UIFont.systemFontOfSize(26)

    }
    
   
    /* not working yet this is the function responseble for converting hex values to UIColor values - Avi Tannenbaum
    extension UIColor {
        public convenience init?(hexString: String) {
            let r, g, b, a: CGFloat
            
            if hexString.hasPrefix("#") {
                let start = hexString.startIndex.advancedBy(1)
                let hexColor = hexString.substringFromIndex(start)
                
                if hexColor.characters.count == 8 {
                    let scanner = NSScanner(string: hexColor)
                    var hexNumber: UInt64 = 0
                    if scanner.scanHexLongLong(&hexNumber) {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0X00FF0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0x000000ff) / 255
                        
                        self.init(red: r, green: g, blue: b, alpha: a)
                        return
                    }
                }
            }
            return nil
        }
        
    } */

    
    // Style functions
    /*
    func titleLabelStyle() {
        let title = self.titleLabel
        title.numberOfLines = 0
        title.frame = CGRect(x: 10, y: 10, width: 300, height: title.intrinsicContentSize().height)
    }
 
 
 */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
