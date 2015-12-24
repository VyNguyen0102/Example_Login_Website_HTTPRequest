//
//  ViewController.swift
//  Sample Login
//
//  Created by Vy Nguyen on 12/22/15.
//  Copyright © 2015 VVLab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        var tempWebview = UIWebView.init(frame:theFrame);
        let urlAddress = "https://m.facebook.com/login/"
        let url = NSURL(string: urlAddress)
        let requestObj = NSURLRequest.init(URL:url!)
        webView.loadRequest(requestObj)
        
        let urlPath: String = "https://facebook.com"
        let url1: NSURL = NSURL(string: urlPath)!
        let request1: NSURLRequest = NSURLRequest(URL: url1)
        let queue:NSOperationQueue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(request1, queue: queue, completionHandler:{ (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
            let datastring = NSString(data:data!, encoding:NSUTF8StringEncoding) as! String
            print(datastring)
//            var err: NSError
//            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//            println("AsSynchronous\(jsonResult)")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

