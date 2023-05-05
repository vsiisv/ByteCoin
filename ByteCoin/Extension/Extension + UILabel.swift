//
//  Extension + UILabel.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import UIKit

extension UILabel {
	convenience init(text: String, textColor: UIColor = .white, fontSize: CGFloat = 25, weight: UIFont.Weight = .regular, alignment: NSTextAlignment = .right) {
		self.init()
		self.text = text
		self.textColor = textColor
		self.textAlignment = alignment
		font = UIFont.systemFont(ofSize: fontSize, weight: weight)
	}
}
