//
//  AudioListCell.swift
//  GitHubDemo
//
//  Created by MacHD on 05/09/19.
//  Copyright © 2019 MacHD. All rights reserved.
//

import UIKit

class AudioListCell: UITableViewCell {
    @IBOutlet weak var txtlblSongTitle: UILabel!
    @IBOutlet weak var txtlblabtsong: UILabel!
    @IBOutlet weak var imgMusicSong: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
