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
  @State private var tipPercentage = 20
  @FocusState private var amountIsFocused: Bool
  
  var grandTotal: Double {
    let tipSelection = Double(tipPercentage)
    
    let tipValue = checkAmount / 100 * tipSelection
    let grandTotal = checkAmount + tipValue
    
    return grandTotal
  }
  
  var totalPerPerson: Double {
    let peopleCount = Double(numberOfPeople + 2)
    let amountPerPerson = grandTotal / peopleCount
    
    return amountPerPerson
  }
  
  var isZero: Bool {
    return tipPercentage == 0
  }
  
  var body: some View {
    NavigationStack {
      Form {
        Section {
          TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            .keyboardType(.decimalPad)
            .focused($amountIsFocused)
          
          Picker("Number of people", selection: $numberOfPeople) {
            ForEach(2..<100) {
              Text("\($0) people")
            }
          }
        }
        
        Section("How much do you want to tip?") {
          Picker("Tip percentage", selection: $tipPercentage) {
            ForEach(0..<101) {
              Text("\($0) %")
            }
          }
          .pickerStyle(.navigationLink)
        }
        
        Section("Amount per person") {
          Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
        
        Section("Total amount") {
          Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
        .foregroundColor(isZero ? .red : .black)
      }
      .navigationTitle("WeSplit")
      .toolbar {
        Button("Done") {
          if amountIsFocused {
            amountIsFocused = false
          }
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
