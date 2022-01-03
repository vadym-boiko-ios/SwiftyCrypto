//
//  HomeViewModel.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 29.12.2021.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {

    @Published var statistics: [Statistic] = [
        Statistic(title: "Title", value: "22323", percentageChange: 1),
        Statistic(title: "Title", value: "22323"),
        Statistic(title: "Title", value: "22323"),
        Statistic(title: "Title", value: "22323", percentageChange: -9),
        Statistic(title: "Title", value: "22323", percentageChange: 1)
    ]
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    var cancellables = Set<AnyCancellable>()
    
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        
        $searchText
            .combineLatest(dataService.$allCoins)
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map(filterCoin)
            .sink { [weak self] returnedCoin in
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
    }
    
    private func filterCoin(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        let filteredCoins = coins.filter { coin in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
        return filteredCoins
    }
}
