//
//  ViewController.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import UIKit

class ViewController: UIViewController {
	
	private let coinView = CoinView()

	override func viewDidLoad() {
		super.viewDidLoad()
		addSubviews()
		constraints()
		setupView()
	}
}

// MARK: - Layout

private extension ViewController {
	func addSubviews() {
		view.addSubview(coinView)
	}
	
	func constraints() {
		NSLayoutConstraint.activate([
			coinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			coinView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			coinView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])
	}
	
	func setupView() {
		view.backgroundColor = UIColor(named: Color.background)
	}
}
