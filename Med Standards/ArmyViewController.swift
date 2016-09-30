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
    static let ar40501Detail = "Standards of Medical Fitness (11 Aug 2015)"
    static let ar40501PDF = "AR 40-501 Standards of Medical Fitness (11 Aug 2015)"
    
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return armyDocArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle,  reuseIdentifier: "Cell")
        
        let titleFont:UIFont? = UIFont(name: "Helvetica", size: 14.0)
        let detailFont:UIFont? = UIFont(name: "Helvetica", size: 12.0)
        
        let detailText:NSMutableAttributedString = NSMutableAttributedString(string: "\n" + (armyDocDetailArray[(indexPath as NSIndexPath).row] as! String), attributes: (NSDictionary(object: detailFont!, forKey: NSFontAttributeName as NSCopying) as! [String: AnyObject]))
        detailText.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSMakeRange(0, detailText.length))
        
        let title = NSMutableAttributedString(string: armyDocArray[(indexPath as NSIndexPath).row] as! String, attributes: (NSDictionary(object: titleFont!, forKey: NSFontAttributeName as NSCopying) as! [String: AnyObject]))
        
        title.append(detailText)
        
        cell.textLabel?.attributedText = title
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.numberOfLines = 0
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        army.selection = ""
        
        army.selection = armyDocArray[(indexPath as NSIndexPath).row] as! String
        
        performSegue(withIdentifier: "armyWebviewSegue", sender: nil)
        
    }


}

