//
//  AFWebviewVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 5/31/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFWebviewVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet var aFWebview: UIWebView!
    
    var docController: UIDocumentInteractionController?
    let downloadIcon:UIImage = UIImage(named: "download.png")!
    let redoIcon:UIImage = UIImage(named: "redo.png")!
    let backArrow:UIImage = UIImage(named: "backArrow.png")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aF.link = "PDFs_AirForce/"
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .plain, target: self, action: #selector(AFWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .plain, target: self, action: #selector(AFWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .plain, target: self, action: #selector(AFWebviewVC.goBack))
        self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)
        
        aFWebview.scalesPageToFit = true
        aFWebview.isMultipleTouchEnabled = true
        
        webViewLoad()
    }
    
    
    @objc func webViewLoad(){
        if aF.selection == aF.dlcTitle {
            self.title = aF.dlcTitle
            aF.link += aF.dlcPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI10-203Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.mesTitle {
            self.title = aF.mesTitle
            aF.link += aF.mesPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAFI48-123Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.medsTitle {
            self.title = aF.medsTitle
            aF.link += aF.medsPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFAircrewApprovedMedsViewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.otcMedsTitle {
            self.title = aF.otcMedsTitle
            aF.link += aF.otcMedsPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFOTCApprovedMedsViewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.modMedsTitle {
            self.title = aF.modMedsTitle
            aF.link += aF.modMedsPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFMODApprovedMeds", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.msdTitle {
            self.title = aF.msdTitle
            aF.link += aF.msdPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFMSDViewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else if aF.selection == aF.physExMtxTitle {
            self.title = aF.physExMtxTitle
            aF.link += aF.physExMtxPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFphysExMtx", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        }else if aF.selection == aF.wgTitle {
            self.title = aF.wgTitle
            aF.link += aF.wgPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/AFWaiverGuideViewer", withExtension: "html")
            let request = URLRequest(url: path!)
            aFWebview?.loadRequest(request)
        } else {
            docError()
        }
    }
    
    @objc func iBooksLaunch() {
        print("button pressed")
        if let path = Bundle.main.path(forResource: aF.link, ofType: "pdf") {
            let targetURL = URL(fileURLWithPath: path)
            docController = UIDocumentInteractionController(url: targetURL)
            let url = URL(string:"itms-books:");
            if UIApplication.shared.canOpenURL(url!) {
                docController!.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
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
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func docError() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("Document not found.  Please contact ColbyCoApps@gmail.com.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func goBack() {
        aFWebview.goBack()
    }
    
}
