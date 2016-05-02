//
//  AFOxConvVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/4/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFOxConvVC: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet var startingElevation: UITextField!
    @IBOutlet var cabinAltitude: UITextField!
    @IBOutlet var initialFiOx: UITextField!
    @IBOutlet var scrollerView: UIScrollView!
    @IBOutlet var calcButtonObj: UIButton!
    @IBOutlet var result: UILabel!
    @IBOutlet var resultMethod: UILabel!
    
    let infoIcon:UIImage = UIImage(named: "info.png")!
    
    @IBAction func calculateButton(sender: AnyObject) {
        calculate()
        scrollerView.setContentOffset(CGPointMake(0, result.frame.origin.y - 75), animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Altitude Oxygen Converter"
        self.initialFiOx.delegate = self
        self.startingElevation.delegate = self
        self.cabinAltitude.delegate = self
        let _: UIScrollViewKeyboardDismissMode
        self.scrollerView.keyboardDismissMode = .Interactive
        
        let infoButton = UIBarButtonItem(image: infoIcon, style: .Plain, target: self, action: #selector(AFOxConvVC.segue))
        self.navigationItem.setRightBarButtonItem(infoButton, animated: false)
    }
    
    func segue() {
        performSegueWithIdentifier("OxConvAboutSegue", sender: nil)
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let scrollHeight = screenHeight * 1.5
        self.scrollerView.userInteractionEnabled = true
        self.scrollerView.contentSize = CGSizeMake(screenWidth, scrollHeight)
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if textField == self.startingElevation {
            self.cabinAltitude.becomeFirstResponder()
            scrollerView.setContentOffset(CGPointMake(0, cabinAltitude.frame.origin.y - 75), animated: true)
        } else if textField == self.cabinAltitude {
            self.initialFiOx.becomeFirstResponder()
            scrollerView.setContentOffset(CGPointMake(0, initialFiOx.frame.origin.y - 75), animated: true)
        } else {
            self.initialFiOx.resignFirstResponder()
            calculate()
            scrollerView.setContentOffset(CGPointMake(0, result.frame.origin.y - 75), animated: true)
        }
        
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == self.startingElevation {
            scrollerView.setContentOffset(CGPointMake(0, startingElevation.frame.origin.y - 75), animated: true)
        } else if textField == self.cabinAltitude {
            scrollerView.setContentOffset(CGPointMake(0, cabinAltitude.frame.origin.y - 75), animated: true)
        } else if textField == self.initialFiOx {
            scrollerView.setContentOffset(CGPointMake(0, initialFiOx.frame.origin.y - 75), animated: true)
        }
    }
    
    
    func calculate() {
        let m = 0.3048
        
        let startingElevationInt = Int(startingElevation.text!)
        let cabinAltitudeInt = Int(cabinAltitude.text!)
        let initialFiOxInt = Int(initialFiOx.text!)
        
        if startingElevationInt != nil && cabinAltitudeInt != nil && initialFiOxInt != nil && cabinAltitudeInt >= 0 && initialFiOxInt >= 21 {
            
            let enteredStartingElevationM = Double(startingElevationInt!) * m
            let enteredCabinAltitudeM = Double(cabinAltitudeInt!) * m
            let enteredInitialFiOxPer = Double(initialFiOxInt!) / 100
            
            
            let denom = 8.31447 * 288.15
            let topNum = 9.80665 * 0.0289644 * enteredStartingElevationM
            let botNum = 9.80665 * 0.0289644 * enteredCabinAltitudeM
            
            let topExp = exp(-1 * (topNum / denom))
            let botExp = exp(-1 * (botNum / denom))
            
            let finalFiOx = ((enteredInitialFiOxPer * topExp) / botExp)
            
            let finalResult = Int(finalFiOx * 100)
            
            if finalResult > 0 && finalResult <= 100  {
                
                result.text = "Equivalent FiO2: \(finalResult)%"
                print(finalFiOx)
                
                if finalResult <= 21 {
                    resultMethod.text = "Supplemental O2 Not Required"
                } else if finalResult > 21 && finalResult <= 24 {
                    resultMethod.text = "Nasal Cannula at 1 L/Min"
                } else if finalResult > 24 && finalResult < 28 {
                    resultMethod.text = "Nasal Cannula at 1-2 L/Min"
                } else if finalResult >= 28 && finalResult < 32 {
                    resultMethod.text = "Nasal Cannula at 2-3 L/Min"
                } else if finalResult >= 32 && finalResult < 36 {
                    resultMethod.text = "Nasal Cannula at 3-4 L/Min"
                } else if finalResult >= 36 && finalResult < 40 {
                    resultMethod.text = "Nasal Cannula at 4-5 L/Min"
                } else if finalResult >= 40 && finalResult <= 44 {
                    resultMethod.text = "Nasal Cannula at 5-6 L/Min"
                } else if finalResult > 44 && finalResult < 48 {
                    resultMethod.text = "Simple Face Mask at 6-7 L/Min"
                } else if finalResult >= 48 && finalResult < 52 {
                    resultMethod.text = "Simple Face Mask at 7-8 L/Min"
                } else if finalResult >= 52 && finalResult < 56 {
                    resultMethod.text = "Simple Face Mask at 8-9 L/Min"
                } else if finalResult >= 56 && finalResult < 60 {
                    resultMethod.text = "Simple Face Mask at 9-10 L/Min"
                } else if finalResult >= 60 && finalResult < 70 {
                    resultMethod.text = "Non-Rebreathing Mask at 6-7 L/Min"
                } else if finalResult >= 70 && finalResult < 80 {
                    resultMethod.text = "Non-Rebreathing Mask at 7-8 L/Min"
                } else if finalResult >= 80 && finalResult < 90 {
                    resultMethod.text = "Non-Rebreathing Mask at 8-9 L/Min"
                } else if finalResult >= 90 && finalResult < 95 {
                    resultMethod.text = "Non-Rebreathing Mask at 9-10 L/Min"
                } else {
                    resultMethod.text = "Non-Rebreathing Mask at 10-15 L/Min"
                }
                
            } else if startingElevationInt == cabinAltitudeInt {
                
                elevSameAlert()
                
            } else if finalResult <= 0 {
                
                result.text = ""
                resultMethod.text = ""
                finalResultZeroAlert()
                
            } else {
                result.text = "Required FiO2 > 100%. Lower Cabin Altitude."
                resultMethod.text = "Non-Rebreathing Mask at 15 L/Min"
            }
            
            
        } else if startingElevationInt == nil || cabinAltitudeInt == nil || initialFiOxInt == nil {
            result.text = ""
            resultMethod.text = ""
            nilValueAlert()
        } else if cabinAltitudeInt < 0 {
            result.text = ""
            resultMethod.text = ""
            self.cabinAltitude.becomeFirstResponder()
            cabAltAlert()
        } else if initialFiOxInt < 21 {
            result.text = ""
            resultMethod.text = ""
            self.initialFiOx.becomeFirstResponder()
            lowFiO2Alert()
        } else {
            result.text = ""
            resultMethod.text = ""
            nilValueAlert()
        }
        
        self.view.endEditing(true)
    }
    
    func elevSameAlert() {
        
        let title = NSLocalizedString("Duplicate Values", comment: "")
        let message = NSLocalizedString("The Starting Elevation and Cabin Altitude are the same.  Recheck these values.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func finalResultZeroAlert() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("FiO2 cannot be < 0%.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func nilValueAlert() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("Please enter whole numbers.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func cabAltAlert() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("Cabin Altitude must be > 0 feet.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func lowFiO2Alert() {
        let title = NSLocalizedString("Error", comment: "")
        let message = NSLocalizedString("Initial FiO2 cannot be < 21%.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alertController.addAction(cancelAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
}
