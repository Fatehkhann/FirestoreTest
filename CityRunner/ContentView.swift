//
//  ContentView.swift
//  CityRunner
//
//  Created by Fateh Khan on 28/04/2021.
//

import SwiftUI


struct ContentView: View {
    let fbService = FirebaseService()
    @State var cityName = ""
    var body: some View {
        VStack {
            TextField("City Name", text: self.$cityName)
            HStack {
                Button(action: {
                    fbService.addCity(city: self.cityName)
                }) {
                    Text("Push to Firestore")
                }
            }
        }
        .padding()
    }
}
