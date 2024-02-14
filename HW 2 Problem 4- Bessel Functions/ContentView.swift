//
//  ContentView.swift
//  HW 2 Problem 4- Bessel Functions
//
//  Created by Marco on 2/13/24.
//


import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        BesselGraphView()
            .frame(width: 500, height: 500)
            .padding()
    }
}

// BesselGraphView is responsible for rendering the Bessel function graph.
struct BesselGraphView: View {
    let Xmin: CGFloat = 0.0
    let Xmax: CGFloat = 12.0
    let step: CGFloat = 0.1
    let Ymax: CGFloat = 1.0
    let Ymin: CGFloat = -0.2
    let tickLength: CGFloat = 2
    
    //Bessel Function

    func besselFunction(x: CGFloat, order: Int) -> CGFloat {
    
        return sin(x) / x
    }

    var body: some View {
        VStack {
            Text("Spherical Bessel Functions").font(.title)
            GeometryReader { geometry in
                Path { path in
                   
                    let frame = CGRect(x: 0, y: 0, width: geometry.size.width, height: geometry.size.height)
                    path.addRect(frame)
                   
     //x-Axis Ticks
                    
                    let xSteps = Int((Xmax - Xmin) / step)
                    for i in 0...xSteps {
                        let x = CGFloat(i) * step + Xmin
                        let xPos = CGFloat((x - Xmin) / (Xmax - Xmin)) * geometry.size.width
                        path.move(to: CGPoint(x: xPos, y: geometry.size.height - tickLength))
                        path.addLine(to: CGPoint(x: xPos, y: geometry.size.height))
                    }
                    
    //y-Axis Ticks
                    let ySteps = 5
                    for i in 0...ySteps {
                        let y = CGFloat(i) * (Ymax - Ymin) / CGFloat(ySteps) + Ymin
                        let yPos = (1 - (y - Ymin) / (Ymax - Ymin)) * geometry.size.height
                        path.move(to: CGPoint(x: 0, y: yPos))
                        path.addLine(to: CGPoint(x: tickLength, y: yPos))
                    }
                }
                .stroke(Color.black, lineWidth: 1)
     
        //This adds labels for the x-axis
                
                ForEach(Array(stride(from: Xmin, through: Xmax, by: (Xmax - Xmin) / 5)), id: \.self) { x in
                    let xPos = CGFloat((x - Xmin) / (Xmax - Xmin)) * geometry.size.width
                    Text("\(Int(x))")
                        .position(x: xPos, y: geometry.size.height - 5)
                        .font(.caption)
                }
                
       //This adds labels for the y-axis
                
                ForEach(Array(stride(from: Ymin, through: Ymax, by: (Ymax - Ymin) / 5)), id: \.self) { y in
                    let yPos = (1 - (y - Ymin) / (Ymax - Ymin)) * geometry.size.height
                    Text(String(format: "%.1f", y))
                        .position(x: 25, y: yPos)
                        .font(.caption)
                }
                
                
        //This draws the Bessel Function Graph
               
                Path { path in
                
                    for x in stride(from: Xmin, through: Xmax, by: step) {
                        let y = besselFunction(x: x, order: 1)
                        let xPos = CGFloat((x - Xmin) / (Xmax - Xmin)) * geometry.size.width
                        let yPos = (1 - (y - Ymin) / (Ymax - Ymin)) * geometry.size.height
                        
                        if x == Xmin {
                            path.move(to: CGPoint(x: xPos, y: yPos))
                        } else {
                            path.addLine(to: CGPoint(x: xPos, y: yPos))
                        }
                    }
                }
                .stroke(Color.red, lineWidth: 2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
