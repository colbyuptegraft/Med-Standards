//
//  ArmyWebviewVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 6/1/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class ArmyWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var armyWebview: UIWebView!
    
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!

    override func viewDidLoad() {
        super.viewDidLoad()
        army.link = "PDFs_Army/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .Plain, target: self, action: #selector(ArmyWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .Plain, target: self, action: #selector(ArmyWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .Plain, target: self, action: #selector(ArmyWebviewVC.goBack))
        self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)

        armyWebview.scalesPageToFit = true
        armyWebview.multipleTouchEnabled = true
        
        webViewLoad()
    }
    
    func webViewLoad(){
        if army.selection == army.ar40501Title {
            self.title = army.ar40501Title
            army.link += army.ar40501PDF
            let path = NSBundle.mainBundle().URLForResource("pdfjs/web/ArmyAR40-501Viewer", withExtension: "html")
            let request = NSURLRequest(URL: path!)
            armyWebview?.loadRequest(request)
        } else if army.selection == army.fSChecklistTitle {
            self.title = army.fSChecklistTitle
            army.link += army.fSChecklistPDF
            let path = NSBundle.mainBundle().URLForResource("pdfjs/web/ArmyFSChecklistViewer", withExtension: "html")
            let request = NSURLRequest(URL: path!)
            armyWebview?.loadRequest(request)
        } else {
            docError()
        }

    }
    
    func iBooksLaunch() {
        print("button pressed")
        
        if let path = NSBundle.mainBundle().pathForResource(army.link, ofType: "pdf") {
            let targetURL = NSURL.fileURLWithPath(path)
            docController = UIDocumentInteractionController(URL: targetURL)
            let url = NSURL(string:"itms-books:");
            if UIApplication.sharedApplication().canOpenURL(url!) {
                docController!.presentOpenInMenuFromRect(CGRectZero, inView: self.view, animated: true)
                print("iBooks is installed")
            } else {
                print("iBooks is not installed")
                iBooksError()
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
        armyWebview.goBack()
    }

    
}
