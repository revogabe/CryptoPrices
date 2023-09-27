//
//  CoinDataService.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 27/09/23.
//

import Foundation

class CoinDataService {
    // Network URL
    var baseUrl = "https://api.coingecko.com/api/v3/"

    /*
      # Functions - Observation for study
        - @escaping: This is a keyword used to indicate that the closure can "escape" the current function's scope. In other words, it means the closure can be stored as a property, passed as an argument to other functions, or used after the fetchCoins function has finished executing. This is often used when the closure is asynchronous and might be executed later, ensuring it doesn't go out of scope prematurely.
     
        - Result: The Result type is an enum provided by Swift to handle the result of an operation that can either succeed or fail. It has two possible values: .success and .failure. In this case:
                1. success: If the operation is successful, it will contain a value of type [CoinModel], which is an array of CoinModel objects. This represents the successful result of fetching coin data.
                2. failure: If the operation fails, it will contain an error of type Error, representing the reason for the failure.
     */
    func fetchCoins(completion: @escaping(Result<[CoinModel], CoinErrorModel>) -> Void) {
        // Setup URL
        let urlString = baseUrl + "/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1&sparkline=false&price_change_percentage=24h&locale=en"
        guard let url = URL(string: urlString) else { return }

        // Request API
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Errors Validation
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "Resquest failed")))
                return
            }
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            // Decoder JSON
            do {
                let coins = try JSONDecoder().decode([CoinModel].self, from: data)
                completion(.success(coins))
            } catch {
                print("DEBUG: Failed to decode with error \(error)")
                completion(.failure(.jsonParsingFailure))
            }
        }.resume()
    }
}
