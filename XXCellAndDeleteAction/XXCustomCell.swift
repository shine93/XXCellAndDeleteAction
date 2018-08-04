//
//  XXCustomCell.swift
//  XXCellAndDeleteAction
//
//  Created by 人人 on 2018/8/4.
//  Copyright © 2018年 shine. All rights reserved.
//

import UIKit

class XXCustomCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.gray.cgColor
        contentView.backgroundColor = UIColor(red: 224.0/255.0, green: 227.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        backView.backgroundColor = UIColor.white
        backgroundColor = UIColor(red: 224.0/255.0, green: 227.0/255.0, blue: 232.0/255.0, alpha: 1.0)
    }


}
