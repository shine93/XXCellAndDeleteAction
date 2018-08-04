//
//  XXTableViewController.swift
//  XXCellAndDeleteAction
//
//  Created by 人人 on 2018/8/4.
//  Copyright © 2018年 shine. All rights reserved.
//

import UIKit

class XXTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 176
        
        tableView.backgroundColor = UIColor(red: 224.0/255.0, green: 227.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        
    }

}

// MARK: - Table view data source
extension XXTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! XXCustomCell
     
     
        return cell
     }
 
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 
        return true
     }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let kCellActionWidth: CGFloat = 100
        let kCellHeight: CGFloat = 176
        let whitespace = whitespaceString(width: kCellActionWidth)
        let deleAction = UITableViewRowAction(style: .default, title: whitespace) { (action, indexPath) in
            //delete callback
        }
        
        let kActionImageSize: CGFloat = 18
        let kImageBackViewSize: CGFloat = 44
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kCellActionWidth, height: kCellHeight))
        
        let deleteBackView = UIView(frame: CGRect(x: (kCellActionWidth - kImageBackViewSize) / 2,
                                                  y: (kCellHeight - kImageBackViewSize) / 2,
                                                  width: kImageBackViewSize,
                                                  height: kImageBackViewSize))
   
        deleteBackView.layer.cornerRadius = kImageBackViewSize / 2
        deleteBackView.clipsToBounds = true
        deleteBackView.backgroundColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: (kCellActionWidth - kActionImageSize) / 2,
                                                  y: (kCellHeight - kActionImageSize) / 2,
                                                  width: kActionImageSize,
                                                  height: kActionImageSize))
        imageView.image = UIImage(named: "deleat")
        view.backgroundColor = UIColor(red: 224.0/255.0, green: 227.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        view.addSubview(deleteBackView)
        view.addSubview(imageView)
        let image = view.image()
        
        deleAction.backgroundColor = UIColor(patternImage: image)
        
        return [deleAction]
    }
    
    fileprivate func whitespaceString(font: UIFont = UIFont.systemFont(ofSize: 15), width: CGFloat) -> String {
        let kPadding: CGFloat = 20
        let mutable = NSMutableString(string: "")
        let attribute = [NSAttributedStringKey.font: font]
        while mutable.size(withAttributes: attribute).width < width - (2 * kPadding) {
            mutable.append(" ")
        }
        return mutable as String
    }
}

extension UIView {
    func image() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0)
        guard let context = UIGraphicsGetCurrentContext() else {
            return UIImage()
        }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
