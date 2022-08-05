//
//  StateView.swift
//  USA_Project
//
//  Created by Matthew Garlington on 7/28/22.
//

import SwiftUI

struct StateView: View {
    let stateName: String
    var body: some View {
        Text("Selected state: \(stateName)")
            .font(.largeTitle)
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView(stateName: "Maryland")
    }
}
