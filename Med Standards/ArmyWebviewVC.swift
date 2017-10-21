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
        
        let reloadButton = UIBarButtonItem(image: redoIcon, style: .plain, target: self, action: #selector(ArmyWebviewVC.webViewLoad))
        let iBooksButton:UIBarButtonItem = UIBarButtonItem(image: downloadIcon, style: .plain, target: self, action: #selector(ArmyWebviewVC.iBooksLaunch))
        let backButton = UIBarButtonItem(image: backArrow, style: .plain, target: self, action: #selector(ArmyWebviewVC.goBack))
        self.navigationItem.setRightBarButtonItems([backButton, reloadButton, iBooksButton], animated: false)

        armyWebview.scalesPageToFit = true
        armyWebview.isMultipleTouchEnabled = true
        
        webViewLoad()
    }
    
    @objc func webViewLoad(){
        if army.selection == army.ar40501Title {
            self.title = army.ar40501Title
            army.link += army.ar40501PDF
            let path = Bundle.main.url(forResource: "pdfjs/web/ArmyAR40-501Viewer", withExtension: "html")
            let request = URLRequest(url: path!)
            armyWebview?.loadRequest(request)
        } else if army.selection == army.fSChecklistTitle {
            self.title = army.fSChecklistTitle
            army.link += army.fSChecklistPDF
            let path = Bundle.main.url(forResource: "pdfjs/web/ArmyFSChecklistViewer", withExtension: "html")
            let request = URLRequest(url: path!)
            armyWebview?.loadRequest(request)
        } else if army.selection == army.petableTitle {
            self.title = army.petableTitle
            army.link += army.petablePDF
            let path = Bundle.main.url(forResource: "pdfjs/web/ArmyPEtable", withExtension: "html")
            let request = URLRequest(url: path!)
            armyWebview?.loadRequest(request)
        }else {
            docError()
        }

    }
    
    @objc func iBooksLaunch() {
        print("button pressed")
        
        if let path = Bundle.main.path(forResource: army.link, ofType: "pdf") {
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
        armyWebview.goBack()
    }

    
}
