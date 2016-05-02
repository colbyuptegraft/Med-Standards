//
//  AFFSToolkitVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/3/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

class AFFSToolkitVC: UITableViewController {
    
    let aFDocArray:NSArray = [aF.nutSupTitle, aF.oxConTitle, aF.pracGuidTitle, aF.rsvTitle, aF.sgpTitle, aF.specDescTitle]
    let aFDocDetailArray:NSArray = [aF.nutSupDetail, aF.oxConDetail, aF.pracGuidDetail, aF.rsvDetail, aF.sgpDetail, aF.specDescDetail]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FS Toolkit"
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aFDocArray.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,  reuseIdentifier: "Cell")
        
        let titleFont:UIFont? = UIFont(name: "Helvetica", size: 14.0)
        let detailFont:UIFont? = UIFont(name: "Helvetica", size: 12.0)
        
        let detailText:NSMutableAttributedString = NSMutableAttributedString(string: "\n" + (aFDocDetailArray[indexPath.row] as! String), attributes: (NSDictionary(object: detailFont!, forKey: NSFontAttributeName) as! [String: AnyObject]))
        detailText.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(0, detailText.length))
        
        let title = NSMutableAttributedString(string: aFDocArray[indexPath.row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName) as! [String: AnyObject]))
        
        title.appendAttributedString(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        aF.selection = ""
        
        aF.selection = aFDocArray[indexPath.row] as! String
        
        if aF.selection == aF.rsvTitle  {
            performSegueWithIdentifier("rsvTableviewSegue", sender: nil)
        } else if aF.selection == aF.oxConTitle {
            performSegueWithIdentifier("OxConvSegue", sender: nil)
        } else {
            performSegueWithIdentifier("fSToolkitWebviewSegue", sender: nil)
        }
        
        
    }
    
}
