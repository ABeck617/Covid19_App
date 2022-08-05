//
//  ContentView.swift
//  USA_Project
//
//  Created by Anthony Beckford on 5/3/22.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @StateObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(states.sorted(by: ==), id: \.key) { key, value in
                        StateListSection(networkManager: networkManager, stateFullName: value, stateAbrvName: key)
                }
            }
        }
        .navigationTitle("USA States")
        .onAppear {
            networkManager.fetch()
        }
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




