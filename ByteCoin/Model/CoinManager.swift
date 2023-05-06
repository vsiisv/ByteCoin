//
//  CoinManager.swift
//  ByteCoin
//
//  Created by VASILY IKONNIKOV on 05.05.2023.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
	func didUpdatePrice(price: Double)
	func didFailWithError(_ error: Error)
}

struct CoinManager {
	
	weak var delegate: CoinManagerDelegate?
	
	private let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
	private let apiKey = "Your apikey"
	
	let currencyArray = ["AUD", "BRL", "CAD", "CNY", "EUR", "GBP", "HKD", "IDR", "ILS", "INR", "JPY", "MXN", "NOK", "NZD", "PLN", "RON", "RUB", "SEK", "SGD", "USD", "ZAR"]
	
	func getCoinPrice(for currency: String) {
		let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
		performRequest(with: urlString)
	}
	
	private func performRequest(with urlString: String) {
		guard let url = URL(string: urlString) else { return }
		URLSession.shared.dataTask(with: url) { data, response, error in

//		let session = URLSession(configuration: .default)
//		let task = session.dataTask(with: url) { data, response, error in
			if let error {
				delegate?.didFailWithError(error)
				return
			}
			
			if let response {
				print(response)
			}
			
			if let safeData = data {
				guard let price = parseJSON(safeData) else { return }
				delegate?.didUpdatePrice(price: price)
			}
		}.resume()
//		task.resume()
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
