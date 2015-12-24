//
//  MainViewController.swift
//  Sample Login
//
//  Created by Vy Nguyen on 12/22/15.
//  Copyright © 2015 VVLab. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var textView: UITextView!

    convenience init(){
        self.init(nibName: "MainViewController", bundle: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlPath: String = "https://facebook.com"
        let url1: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url1)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            let datastring = NSString(data:data!, encoding:NSUTF8StringEncoding) as! String
            print(datastring)
            dispatch_sync(dispatch_get_main_queue(), {
                self.textView.text = datastring
                datastring.en
                
            });

        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
