//
//  CoinImageService.swift
//  SwiftyCrypto
//
//  Created by Vadym Boiko on 30.12.2021.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    private var imageSubcription: AnyCancellable?
    private let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        getCoinImage()
    }
    
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        
        imageSubcription =  NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubcription?.cancel()
            })
    }
}
