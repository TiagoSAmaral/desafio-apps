//
//  NewsImageCell.swift
//  jornalapp
//
//  Created by Tiago da Silva Amaral on 17/08/18.
//  Copyright © 2018 com.outlook.tiagofly. All rights reserved.
//

import UIKit
import Kingfisher

class NewsImageCell: UITableViewCell, NewsCellProtocol {

	@IBOutlet weak var imageMain: UIImageView!
	@IBOutlet weak var subTitle: UILabel!

	var defaultCoder: UIImage = UIImage(named: "cover-news")!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

		self.setApperanceOfCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func setCell(info: Novelty) {

		self.imageMain.image = defaultCoder
		self.imageMain.kf.setImage(with: info.imagens![0].sourceUrl)

		self.subTitle.text = info.imagens![0].legenda
		self.subTitle.text?.append(" ")
		self.subTitle.text?.append(info.imagens![0].fonte!)
	}

	func setApperanceOfCell() {

		self.subTitle.textColor = Colors.secondary.value
		self.imageMain.layer.addSublayer(self.addGradientShadow(with: self.imageMain, height: 0.5)!)
	}
}