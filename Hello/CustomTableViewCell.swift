//
//  CustomTableViewCell.swift
//  Hello
//
//  Created by admin on 21/8/2561 BE.
//  Copyright © 2561 admin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var iVAvata: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    // Event when Nib file
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.iVAvata.image = UIImage(named: "clock")
        
        //UIImage ()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//iVAvata.image = UIImage(named: "clock")
        // Configure the view for the selected state
    }

}
