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
    
    @available(iOS 11.0, *)
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: nil) { (action, view, completeHandler) in
            //delete action
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let kCellActionWidth: CGFloat = 100
        let whitespace = whitespaceString(width: kCellActionWidth)
        let deleAction = UITableViewRowAction(style: .default, title: whitespace) { (action, indexPath) in
            //delete callback
        }
        
        deleAction.backgroundColor = UIColor(patternImage: getDeleteIcon())
        
        return [deleAction]
    }
    
    func getDeleteIcon() -> UIImage {
        let kCellActionWidth: CGFloat = 100
        let kCellHeight: CGFloat = 176
        let kActionImageSize: CGFloat = 18
        let kImageBackViewSize: CGFloat = 44
        let view = UIView(frame: CGRect(x: 0, y: 0, width: kCellActionWidth, height: kCellHeight))
        
        var deletBackViewX: CGFloat = 0
        var imageViewX: CGFloat = 0
        if #available(iOS 11.0, *) {
            deletBackViewX = kActionImageSize / 2
            imageViewX = kActionImageSize / 2 + (kImageBackViewSize - kActionImageSize) / 2
        } else {
            deletBackViewX = (kCellActionWidth - kImageBackViewSize) / 2
            imageViewX = (kCellActionWidth - kActionImageSize) / 2
        }
        
        let deleteBackView = UIView(frame: CGRect(x: deletBackViewX,
                                                  y: (kCellHeight - kImageBackViewSize) / 2,
                                                  width: kImageBackViewSize,
                                                  height: kImageBackViewSize))
        
        deleteBackView.layer.cornerRadius = kImageBackViewSize / 2
        deleteBackView.clipsToBounds = true
        deleteBackView.backgroundColor = UIColor.white
        let imageView = UIImageView(frame: CGRect(x: imageViewX,
                                                  y: (kCellHeight - kActionImageSize) / 2,
                                                  width: kActionImageSize,
                                                  height: kActionImageSize))
        imageView.image = UIImage(named: "delete")
        view.backgroundColor = UIColor(red: 224.0/255.0, green: 227.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        view.addSubview(deleteBackView)
        view.addSubview(imageView)
        return view.image()
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if #available(iOS 11.0, *) {
            for view in tableView.subviews {
                if view.isKind(of: NSClassFromString("UISwipeActionPullView")!) {
                    view.backgroundColor = UIColor(red: 224.0/255.0, green: 227.0/255.0, blue: 232.0/255.0, alpha: 1.0)
                }
            }
        }
        
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
