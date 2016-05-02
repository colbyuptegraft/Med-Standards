//
//  ArmyViewController.swift
//  Med Standards
//
//  Created by Colby Uptegraft on 5/31/15.
//  Copyright (c) 2015 ColbyCo. All rights reserved.
//

import UIKit

struct army {
    static var selection = ""
    static var link = ""
    
    static let ar40501Title = "AR 40-501"
    static let ar40501Detail = "Standards of Medical Fitness (04 Aug 2011)"
    static let ar40501PDF = "AR 40-501 Standards of Medical Fitness (04 Aug 2011)"
    
    static let fSChecklistTitle = "FS Checklist"
    static let fSChecklistDetail = "Aeromedical Policy Letters & Technical Bulletins (May 2015)"
    static let fSChecklistPDF = "Army FS Checklist (May 2015)"
    
    
}

class ArmyViewController: UITableViewController {
    
    let armyDocArray:NSArray = [army.ar40501Title, army.fSChecklistTitle]
    let armyDocDetailArray:NSArray = [army.ar40501Detail, army.fSChecklistDetail]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return armyDocArray.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,  reuseIdentifier: "Cell")
        
        let titleFont:UIFont? = UIFont(name: "Helvetica", size: 14.0)
        let detailFont:UIFont? = UIFont(name: "Helvetica", size: 12.0)
        
        let detailText:NSMutableAttributedString = NSMutableAttributedString(string: "\n" + (armyDocDetailArray[indexPath.row] as! String), attributes: (NSDictionary(object: detailFont!, forKey: NSFontAttributeName) as! [String: AnyObject]))
        detailText.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGrayColor(), range: NSMakeRange(0, detailText.length))
        
        let title = NSMutableAttributedString(string: armyDocArray[indexPath.row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName) as! [String: AnyObject]))
        
        title.appendAttributedString(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        army.selection = ""
        
        army.selection = armyDocArray[indexPath.row] as! String
        
        performSegueWithIdentifier("armyWebviewSegue", sender: nil)
        
    }


}

