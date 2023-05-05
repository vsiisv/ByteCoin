//
//  BitcoinView.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import UIKit

final class CoinView: UIView {
	
	private let mainStackView = UIStackView(axis: .vertical, spacing: 25)
	private let coinStackView = UIStackView(axis: .horizontal, spacing: 10)
	private let titleLabel = UILabel(text: "ByteCoin", textColor: UIColor(named: Color.title)!, fontSize: 50, weight: .thin, alignment: .center)
	private let currencyLabel = UILabel(text: "USD")
	private let bitcoinLabel = UILabel(text: "...")
	
	private lazy var coinView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.tertiaryLabel
		return view
	}()
	
	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.tintColor = UIColor(named: Color.icon)
		imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

private extension CoinView {
	func addSubviews() {
		addSubview(mainStackView)
		mainStackView.addArrangedSubview(titleLabel)
		mainStackView.addArrangedSubview(coinView)
		coinView.addSubview(coinStackView)
		
		coinStackView.addArrangedSubview(imageView)
		coinStackView.addArrangedSubview(bitcoinLabel)
		coinStackView.addArrangedSubview(currencyLabel)
	
	}
	
	func setupConstraints() {
		translatesAutoresizingMaskIntoConstraints = false
		mainStackView.translatesAutoresizingMaskIntoConstraints = false
		coinStackView.translatesAutoresizingMaskIntoConstraints = false
		
		bitcoinLabel.setContentHuggingPriority(UILayoutPriority(249), for: .horizontal)
		
		NSLayoutConstraint.activate([
			mainStackView.topAnchor.constraint(equalTo: topAnchor),
			mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			
			titleLabel.heightAnchor.constraint(equalToConstant: 60),
			titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 230),

			coinView.heightAnchor.constraint(equalToConstant: 80),
			coinView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
			coinView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -10),
			
			coinStackView.topAnchor.constraint(equalTo: coinView.topAnchor),
			coinStackView.trailingAnchor.constraint(equalTo: coinView.trailingAnchor, constant: -10),
			coinStackView.leadingAnchor.constraint(equalTo: coinView.leadingAnchor),
			coinStackView.bottomAnchor.constraint(equalTo: coinView.bottomAnchor),

			imageView.widthAnchor.constraint(equalToConstant: 80),
			imageView.topAnchor.constraint(equalTo: coinStackView.topAnchor),
			imageView.bottomAnchor.constraint(equalTo: coinStackView.bottomAnchor),
		])
	}
}
