//
//  ChallengerTierListView.swift
//  riotner
//
//  Created by Eris Ramirez on 15/05/23.
//

import SwiftUI

struct ChallengerTierListView: View {
//    var vm: 
    var body: some View {
        VStack {
            ForEach(0...20, id: \.self) { x in
                Text("Hello, Challengers!").padding()
            }
        }
    }
}

struct ChallengerTierListView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengerTierListView()
    }
}
