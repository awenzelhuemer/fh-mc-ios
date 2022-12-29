//
//  ContentView.swift
//  Landmarks
//
//  Created by Andreas Wenzelhuemer on 21.12.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage().offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                Text("Turtle rock")
                    .font(Font.title)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(Font.subheadline)
                    Spacer()
                    Text("California")
                        .font(Font.subheadline)
                }
                
                Divider()
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }.padding()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
