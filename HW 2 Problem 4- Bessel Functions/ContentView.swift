//
//  ContentView.swift
//  HW2 Problem 3 - Bessel Function
//
//  Modified by Marco Gonzalez 2/20/24
//

import SwiftUI

struct ContentView: View {
    @State private var N1: String = ""
    @State private var resultsUpward: [String] = []
    @State private var resultsDownward: [String] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Problem 4a - Upward and Downward Recursion")
                    .font(.title)
                    .underline()
                
                Text("Calculate j_l(x) for the first 25 (l) values for (x) = N")
                    .font(.headline)
                    .fontWeight(.regular)
                    .italic()
                    .padding(.bottom, 5)
                
                TextField("Enter N", text: $N1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)

                Button("Calculate") {
                    // Ensure the input can be converted to a Double
                    if let xValue = Double(N1) {
                        calculateBesselFunctions(x: xValue)
                    }
                }
                .padding(.bottom, 20)
                
                Text("Upward Recursion Results:")
                    .font(.headline)
                ForEach(resultsUpward, id: \.self) { result in
                    Text(result)
                }
                
                Text("Downward Recursion Results:")
                    .font(.headline)
                ForEach(resultsDownward, id: \.self) { result in
                    Text(result)
                }
            }
        }
        
    }

    func calculateBesselFunctions(x: Double) {
        // Clear previous results
        resultsUpward.removeAll()
        resultsDownward.removeAll()
        
        // Calculate using upward recursion
        let upwardResults = calculateUpwardRecursion(x: x, lMax: 25)
        for l in 0..<upwardResults.count {
            resultsUpward.append("j_\(l)(\(x)) = \(upwardResults[l])")
        }
        
        // Calculate using downward recursion
        let downwardResults = calculateDownwardRecursion(x: x, lMax: 25)
        for l in 0..<downwardResults.count {
            resultsDownward.append("j_\(l)(\(x)) = \(downwardResults[l])")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
