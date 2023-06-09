//
//  ViewController.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import UIKit

class CoinViewController: UIViewController {
	
	private var coinManager = CoinManager()
	
	private let coinView = CoinView()
	private let pickerView = UIPickerView()
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		pickerView.delegate = self
		pickerView.dataSource = self
		
		coinManager.delegate = self
		
		addSubviews()
		constraints()
		setupView()
	}
}

// MARK: - Layout

private extension CoinViewController {
	func addSubviews() {
		view.addSubview(coinView)
		view.addSubview(pickerView)
	}
	
	func constraints() {
		pickerView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			coinView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			coinView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			coinView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			
			pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			pickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			
			pickerView.heightAnchor.constraint(equalToConstant: 216)
		])
	}
	
	func setupView() {
		view.backgroundColor = UIColor(named: Color.background)
	}
}

// MARK: - Coin Manager Delegate

extension CoinViewController: CoinManagerDelegate {
	func didFailWithError(_ error: Error) {
		print(error)
	}
	
	func didUpdatePrice(price: Double) {
		DispatchQueue.main.async {
			let price = String(format: "%.2f", price)
			self.coinView.updateBitcoinLabelText(price)
		}
	}
}

// MARK: - PickerView delegate and datasource

extension CoinViewController: UIPickerViewDelegate, UIPickerViewDataSource {
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return coinManager.currencyArray.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return coinManager.currencyArray[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		let selectedCurrency = coinManager.currencyArray[row]
		coinManager.getCoinPrice(for: selectedCurrency)
		coinView.updateCurrencyLabelText(selectedCurrency)
	}
}
