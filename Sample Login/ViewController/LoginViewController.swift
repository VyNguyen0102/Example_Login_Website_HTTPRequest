//
//  LoginViewController.swift
//  Sample Login
//
//  Created by Vy Nguyen on 12/22/15.
//  Copyright © 2015 VVLab. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIWebViewDelegate, NSURLConnectionDataDelegate {
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassWord: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    convenience init(){
        self.init(nibName: "LoginViewController", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.text = "nguyenvanvy0102@gmail.com"
    }

    @IBAction func btnLoginClick(sender: AnyObject) {
        btnLogin.enabled = false
        let urlPath: String = "https://m.facebook.com/login.php?refsrc=https%3A%2F%2Fm.facebook.com%2Flogin%2F&lwv=100"
        let postStr = NSString(format: "email=%@&pass=%@",txtEmail.text! ,txtPassWord.text! )
        let postData = postStr.dataUsingEncoding(NSUTF8StringEncoding)
        let postLeg = NSString(format: "%d", postStr.length)
        
        let request = NSMutableURLRequest()
        
        request.URL = NSURL(string: urlPath)
        request.HTTPMethod = "POST"
        request.setValue(postLeg as String, forHTTPHeaderField: "Content-Length")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.HTTPBody = postData
        
        let conn = NSURLConnection(request: request, delegate: self)
        
        if ((conn) != nil) {
            print("Connection Successful");
        } else {
            print("Connection could not be made");
        }
    }
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
        print(response)
        btnLogin.enabled = true
    }
    
    func connection(connection: NSURLConnection, willSendRequest request: NSURLRequest, redirectResponse response: NSURLResponse?) -> NSURLRequest? {
        print(request)
        return request
    }
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        let datastring = NSString(data:data, encoding:NSUTF8StringEncoding) as! String
        print(datastring)
        
        if (datastring.containsString("Log Out"))
        {
            let viewController = MainViewController.init()
            self.presentViewController(viewController, animated: true, completion: nil)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
