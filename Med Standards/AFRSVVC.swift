//
//  AFRSVVC.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 7/4/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit


class AFRSVVC: UITableViewController {
    
    let aFDocArray:NSArray = [aF.rsvOverviewTitle, aF.rsv1aTitle, aF.rsv1aNotesTitle, aF.rsv1b1Title, aF.rsv1b2Title, aF.rsv1b3Title, aF.rsv1b4Title, aF.rsv1cTitle, aF.rsv1dTitle, aF.rsv1e1Title, aF.rsv1e2Title, aF.rsv2aTitle, aF.rsv3aTitle, aF.rsv4aTitle, aF.rsv5aTitle]
    let aFDocDetailArray:NSArray = [aF.rsvOverviewDetail, aF.rsv1aDetail, aF.rsv1aNotesDetail, aF.rsv1b1Detail, aF.rsv1b2Detail, aF.rsv1b3Detail, aF.rsv1b4Detail, aF.rsv1cDetail, aF.rsv1dDetail, aF.rsv1e1Detail, aF.rsv1e2Detail, aF.rsv2aDetail, aF.rsv3aDetail, aF.rsv4aDetail, aF.rsv5aDetail]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Sample RSV Briefings"
        
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
        
        performSegueWithIdentifier("RSVSegue", sender: nil)
        
    }
    
}
