//
//  ChallengerTierListViewModel.swift
//  riotner
//
//  Created by Eris Ramirez on 16/05/23.
//

import Foundation

class ChallengerTierListViewModel: ObservableObject {
    @Published var challengers: [Int] = Array(0..<20)
    
    func onAppear() async {
        
    }
}
