//
//  ContentView.swift
//  WeSplit
//
//  Created by Bakhtiyorjon Mirzajonov on 10/18/23.
//
 
import SwiftUI

struct ContentView: View {
  @State private var checkAmount = 0.0
  @State private var numberOfPeople = 2
  @State private var topPercentage = 20
  
  let tipPercentages = [10, 15, 20, 25, 0]
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .keyboardType(.decimalPad)
          
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }
        
        Section {
          Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
      }
      .navigationTitle("WeSplit")
    }
  }
}

#Preview {
    ContentView()
}
