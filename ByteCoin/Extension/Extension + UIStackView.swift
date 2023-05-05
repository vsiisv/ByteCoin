//
//  Extension + UIStackView.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import UIKit

extension UIStackView {
	convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
		self.init()
		self.axis = axis
		alignment = .center
		distribution = .fill
		self.spacing = spacing
		contentMode = .scaleToFill
	}
}
