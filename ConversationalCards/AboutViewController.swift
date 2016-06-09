//
//  AboutViewController.swift
//  ConversationalCards
//
//  Created by Avi Tannenbaum on 4/20/16.
//  Copyright © 2016 Avi Tannenbaum. All rights reserved.
//

import UIKit

import Foundation

import MessageUI

class AboutViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    // User enters name for form sending textfield

    @IBOutlet weak var nameField: UITextField!
    
    // User enters email for form sending textfield
    
    @IBOutlet weak var emailField: UITextField!
    
    // User enters feedback Text for form sending textfield
    
    @IBOutlet weak var messageTextView: UITextView!
    
    
    // Cover Image
    
    @IBOutlet weak var coverImage: UIImageView!
    
    // Outlet for sendButton
         
    @IBOutlet weak var sendButton: UIButton!
    
    // Action for sendbutton
    
    
    @IBAction func sendButtonPressed(sender: AnyObject) {
        let toRecipients = ["ConversationalCards@gmail.com"]
        let subject = "Feedback for conversational cards"
        let address = emailField.text // eMail address of sender
        
        let name = nameField.text // Name of sender
        let body = messageTextView.text + ("From: \(name)" + " " + "Reply to: " + "\(address)")
        /* Your text fields text This appears inside the message body */
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(toRecipients)
        mail.setSubject(subject)
        mail.setMessageBody(body, isHTML: false)
        
        presentViewController(mail, animated: true, completion: nil)
        
        navigationController?.popViewControllerAnimated(true)

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.coverImageStyle()
        self.sendButtonStyle()
        self.messageFieldStyle()
        
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func coverImageStyle() {
        
        let lightBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
        // Blure Image
        // . light
       
        
        let blurView = UIVisualEffectView(effect: lightBlur)
        blurView.frame = coverImage.bounds
        
        
        let imageCover = self.coverImage
        imageCover.addSubview(blurView)
    }
    
    // Button Style
    
    func sendButtonStyle() {
        let button = self.sendButton
        
        let buttonText = "Send"
        button.setTitle("\(buttonText)", forState: UIControlState.Normal)
        
        // Button background.
        
       button.layer.backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.2).CGColor
        
        button.layer.cornerRadius = 5
        
        
        
    }
    
    // Message text view style
    
    func messageFieldStyle() {
        let messageField = self.messageTextView
        
        messageField.layer.backgroundColor = UIColor.purpleColor().colorWithAlphaComponent(0.1).CGColor
        
        messageField.layer.cornerRadius = 5
    }
    
    // Style Functions
    
    // Style for the button
   
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
