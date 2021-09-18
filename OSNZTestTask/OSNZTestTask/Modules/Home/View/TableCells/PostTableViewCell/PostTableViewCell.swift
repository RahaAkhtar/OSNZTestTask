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

    func confgigureCell(obj:PostResponseModelElement) {
        self.titleLabel?.text = obj.title ?? ""
        self.bodyLabel?.text = obj.body ?? ""
    }
    
}
