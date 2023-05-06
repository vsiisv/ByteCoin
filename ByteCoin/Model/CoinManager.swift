//
//  CoinManager.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import Foundation

protocol CoinManagerDelegate {
	func didUpdatePrice(price: Double)
	func didFailWithError(_ error: Error)
}

struct CoinManager {
	
	var delegate: CoinManagerDelegate?
	
	let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
	let apiKey = ""
	
	let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK", "NZD", "PLN", "RON", "RUB", "SEK", "SGD", "USD", "ZAR"]
	
	func getCoinPrice(for currency: String) {
		let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
		performRequest(with: urlString)
	}
	
	private func performRequest(with urlString: String) {
		guard let url = URL(string: urlString) else { return }
		let session = URLSession(configuration: .default)
		let task = session.dataTask(with: url) { data, response, error in
			if error != nil {
				delegate?.didFailWithError(error!)
			}
			if let safeData = data {
				guard let price = parseJSON(safeData) else { return }
				delegate?.didUpdatePrice(price: price)
			}
		}
		task.resume()
	}
	
	private func parseJSON(_ data: Data) -> Double? {
		let decode = JSONDecoder()
		do {
			let decodedData = try decode.decode(CoinData.self, from: data)
			let lastPrice = decodedData.rate
			
			return lastPrice
			
		} catch {
			delegate?.didFailWithError(error)
			return nil
		}
	}
}
