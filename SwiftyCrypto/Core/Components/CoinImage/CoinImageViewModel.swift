//
//  CoinImageViewModel.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 30.12.2021.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: Coin
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.isLoading = true
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self](_) in
                self?.isLoading = false
            } receiveValue: { [weak self] receivedImage in
                self?.image = receivedImage
            }
            .store(in: &cancellables)

    }
}
