//
//  StateListSection.swift
//  USA_Project
//
//  Created by Matthew Garlington on 7/28/22.
//

import SwiftUI

struct StateListSection: View {
    @State private var showData: Bool = false
    @StateObject var networkManager = NetworkManager()
    var stateFullName: String
    var stateAbrvName: String
    var body: some View {
        VStack {
            Text(stateFullName)
                .font(.system(size: 17, weight: .bold))
            
            Button {
                showData.toggle()
            } label: {
                Text(showData ? "Hide Data" : "Show Data")
            }
            if showData {
                ForEach(networkManager.covidInfo.sorted(by: { $1.created_at < $0.created_at }), id: \.self) { item in
                    ForEach(states.sorted(by: ==), id: \.key) { key, value in
                        if filterState(state: item.state, key: key, stateAbrv: stateAbrvName) {
                            NavigationLink {
                                StateView(stateName: item.state)
                            } label: {
                                Text("\(item.created_at)")
                            }
                        }
                    }
                }
            }
        }
    }
    func filterState(state: String, key: String?, stateAbrv: String) -> Bool {
        if state == stateAbrv && state == key {
            return true
        } else {
            return false
        }
    }
}

struct StateListSection_Previews: PreviewProvider {
    static var previews: some View {
        StateListSection(stateFullName: "Maryland", stateAbrvName: "MD")
    }
}
