//
//  CoinsViewModel.swift
//  CryptoPrices
//
//  Created by Daniel Gabriel on 27/09/23.
//

import Foundation

class CoinsViewModel: ObservableObject {
    // States
    @Published var coins = [CoinModel]()
    @Published var errorMessage: String?
    @Published var coinID: String = ""


    // Mock Data
    let mockData = MockData.sampleCoins

    // Network Service
    private let service = CoinDataService()

    // Inicialization
    init() {
        fetchCoins()
    }

    /*
     
      Functions - Observation for study
     
        - Strong Reference: When an object holds a strong reference to another object, it means the first object "owns" the second one. As long as there's a strong reference to the object, it won't be deallocated from memory. This is what typically happens when you assign an instance of a class to a property.
        - Weak Reference: A weak reference doesn't prevent the referenced object from being deallocated from memory. In other words, if all references to an object are weak, the object can be deallocated from memory. This is useful to avoid reference cycles and memory leaks, especially in block (closure) capture scenarios.
     
        1. When you call service.fetchCoins(), you're likely passing a closure to be executed later when the data becomes available. This closure might take some time to execute.
        2. If you captured self as a strong reference within this closure, the closure would hold a strong reference to self, and self would hold a strong reference to the closure. This would create a reference cycle, preventing self from being deallocated from memory even after the view or controller that owns self has been deallocated.
        3. By using [weak self], you break the reference cycle, allowing self to be deallocated from memory when it's no longer needed, even if the closure is still pending execution.

     
     */
    func fetchCoins() {
        service.fetchCoins() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    self?.coins = result
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
