//
//  ContentView.swift
//  CityRunner
//
//  Created by Fateh Khan on 28/04/2021.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var fbService = FirebaseService()
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
            VStack {
                
                ForEach(self.fbService.cities, id: \.self) { name in
                    Text(name)
                }
            }
        }
        .padding()
    }
}
