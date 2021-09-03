//
//  ReportTableViewCell.swift
//  ReportApp
//
//  Created by Andre Lemos on 2021-09-01.
//

import UIKit

class ReportTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewPost: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureWith(_ report: Report) {
        labelName.text = report.name
        labelAddress.text = report.address
        labelDesc.text = report.descriptionData
        if let image = report.image{
            imageViewPost.image = UIImage(data: image)
        }
    }
}
