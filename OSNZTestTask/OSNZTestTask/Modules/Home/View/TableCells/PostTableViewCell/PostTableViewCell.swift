//
//  PostTableViewCell.swift
//  OSNZTestTask
//
//  Created by Muhammad  Akhtar on 9/18/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configurCell(obj:PostResponseModelElement) {
        self.titleLabel?.text = obj.title ?? ""
        self.bodyLabel?.text = obj.body ?? ""
    }
    
    func configurCommentCell(obj:PostCommentModelElement) {
        self.titleLabel?.text = obj.name ?? ""
        self.bodyLabel?.text = obj.body ?? ""
    }
}
