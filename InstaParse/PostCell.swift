//
//  PostCell.swift
//  InstaParse
//
//  Created by Cong Tam Quang Hoang on 14/03/17.
//  Copyright © 2017 Cong Tam Quang Hoang. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var imagePosted: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        /*
        if let size = imagePosted.image?.size{
            let multiplier = size.width / size.height
            let aspectRatioConstraint = NSLayoutConstraint(item: imagePosted, attribute: .width, relatedBy: .equal, toItem: imagePosted, attribute: .height, multiplier: multiplier, constant: 0)
            imagePosted.addConstraint(aspectRatioConstraint)
        }
 */
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
