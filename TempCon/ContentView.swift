//
//  ContentView.swift
//  TempCon
//
//  Created by Harpuneet Singh on 2021-05-30.
//

import SwiftUI

struct ContentView: View {
    @State private var tempIn = ""
    @State private var tempUnit1 = 0
    @State private var tempUnit2 = 1
    
    let tempUnits = ["Celsius", "Fahrehenheit", "Kelvin"]
    
    var tempCalc: Double {
        let tempInput = Double(tempIn) ?? 0
        
        switch (tempUnit1, tempUnit2) {
        case (0, 1):
            // c -> f
            return (tempInput * 1.8) + 32
        case (0, 2):
            // c -> k
            return tempInput + 273.15
        case (1, 0):
            // f -> c
            return (tempInput - 32) / 1.8
        case (1, 2):
            // f -> k
            return (tempInput + 459.67) / (5/9)
        case (2, 0):
            // k -> c
            return tempInput - 273.15
        case (2,1):
            // k -> f
            return (tempInput * 1.8) - 459.67
        default:
            return tempInput
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input")) {
                TextField("Enter temperature here", text: $tempIn)
                    .keyboardType(.decimalPad)
                    
                    Picker("Input Unit", selection: $tempUnit1) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output")) {
                    Picker("Input Unit", selection: $tempUnit2) {
                        ForEach(0..<tempUnits.count) {
                            Text("\(self.tempUnits[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text("\(tempCalc, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("TempConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
