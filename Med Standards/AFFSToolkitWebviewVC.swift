//
//  AFFSToolkitWebview.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/4/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFFSToolkitWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var aFWebview: UIWebView!
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!
    let forwardArrow:UIImage = UIImage(named: "forwardArrow.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aF.link = "PDFs_AirForce/Toolkit/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .Plain, target: self, action: "webViewLoad")
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .Plain, target: self, action: "iBooksLaunch")
        let backButton = UIBarButtonItem(image: backArrow, style: .Plain, target: self, action: "goBack")
        let forwardButton = UIBarButtonItem(image: forwardArrow, style: .Plain, target: self, action: "goForward")
        
        if aF.selection == aF.pracGuidTitle {
            self.navigationItem.setRightBarButtonItems([forwardButton, backButton, reloadButton], animated: false)
        } else {
            self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)
        }
        
        aFWebview.scalesPageToFit = true
        aFWebview.multipleTouchEnabled = true
        
        webViewLoad()
    }
    
    
    func webViewLoad(){
        if aF.selection == aF.nutSupTitle {
            self.title = aF.nutSupTitle
            aF.link += aF.nutSupPDF
            let path = NSBundle.mainBundle().URLForResource("pdfjs/web/AFDietarySupp", withExtension: "html")
            let request = NSURLRequest(URL: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.sgpTitle {
            self.title = aF.sgpTitle
            aF.link += aF.sgpPDF
            let path = NSBundle.mainBundle().URLForResource("pdfjs/web/AFSGPearls", withExtension: "html")
            let request = NSURLRequest(URL: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.specDescTitle {
            self.title = aF.specDescTitle
            aF.link += aF.specDescPDF
            let path = NSBundle.mainBundle().URLForResource("pdfjs/web/AFSpecDesc", withExtension: "html")
            let request = NSURLRequest(URL: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.pracGuidTitle {
            self.title = aF.pracGuidTitle
            let url = "http://www.asams.org/guidelines.htm"
            let requestUrl = NSURL(string: url)
            let request = NSURLRequest(URL: requestUrl!)
            aFWebview?.loadRequest(request)
        } else {
            docError()
        }
    }
    
    func iBooksLaunch() {
        print("button pressed")
        
        if let path = NSBundle.mainBundle().pathForResource(aF.link, ofType: "pdf") {
            let targetURL = NSURL.fileURLWithPath(path)
            docController = UIDocumentInteractionController(URL: targetURL)
            let url = NSURL(string:"itms-books:");
            if UIApplication.sharedApplication().canOpenURL(url!) {
                self.docController!.presentOpenInMenuFromRect(CGRectZero, inView: self.view, animated: true)
                print("iBooks is installed")
            } else {
                print("iBooks is not installed")
                self.iBooksError()
            }
        }
    }
    
    func iBooksError() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("iBooks is not installed.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func docError() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("Document not found.  Please contact ColbyCoApps@gmail.com.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func goBack() {
        aFWebview.goBack()
    }
    
    func goForward(){
        aFWebview.goForward()
    }
    
    
    
}
