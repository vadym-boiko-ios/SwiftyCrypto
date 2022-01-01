//
//  HomeViewModel.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 29.12.2021.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataService = CoinDataService()
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
      addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] receivedCoins in
                self?.allCoins = receivedCoins
            }
            .store(in: &cancellables)
    }
}
