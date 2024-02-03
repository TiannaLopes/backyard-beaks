//
//  FoodWasteDataTrackingView.swift
//  backyard-beaks
//
//  Created by Tianna Alina Lopes on 2/3/24.
//

import SwiftUI

struct FoodWasteDataTrackingView: View {
    var body: some View {
        
                VStack {
                    HStack {
                        Text("Food Waste")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Spacer()
                    }
                    .padding()
                    
                    Text("You have achieved")
                        .font(.headline)
                    Text("80% of your goal this year")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                    ProgressRingView(progress: 0.8, goalAmount: 80)
                    HStack {
                          StatisticView(icon: "flame.fill", amount: 234, progress: 0.6)
                          StatisticView(icon: "drop.fill", amount: 345, progress: 0.75)
                          StatisticView(icon: "leaf.fill", amount: 4543, progress: 0.9)
                      }
                      .padding()
                    
                    Picker(selection: .constant(1), label: Text("Statistics Period")) {
                        Text("Today").tag(0)
                        Text("Weekly").tag(1)
                        Text("Monthly").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    ChartView()
                        .padding()
                        .background(Color(hex: "879957"))
                        .cornerRadius(20)
                    
                    Spacer()
                }
                .padding(.top)
                .navigationTitle("Food Waste")
                .navigationBarTitleDisplayMode(.inline)
            }
        }

        struct ProgressRingView: View {
            var progress: Double // The progress percentage (0.0 to 1.0)
            var goalAmount: Int // The goal amount in pounds
            
            var body: some View {
                ZStack {
                    // Outer ring indicating the goal completion
                    Circle()
                        .stroke(lineWidth: 20)
                        .opacity(0.3)
                        .foregroundColor(Color(hex: "879957"))
                    
                    // Inner progress indicator
                    Circle()
                        .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .foregroundColor(Color(hex: "879957"))
                        .rotationEffect(Angle(degrees: 270.0))
                        .animation(.linear) //TODO: update
                    
                    // Goal amount text in the center
                    VStack {
                        Text("\(goalAmount) pounds")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("of food waste used to feed")
                            .font(.caption)
                    }
                }
                .frame(width: 200, height: 200)
            }
        }

        struct StatisticView: View {
            var icon: String
            var amount: Int
            var progress: CGFloat

            
            var body: some View {
                VStack {
                               ZStack {
                                   Circle()
                                       .stroke(lineWidth: 5)
                                       .opacity(0.3)
                                       .foregroundColor(Color.gray)
                                   
                                   Circle()
                                       .trim(from: 0.0, to: progress)
                                       .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                                       .foregroundColor(Color(hex: "879957"))
                                       .rotationEffect(Angle(degrees: -90))
                                       .animation(.linear) //TODO: Update
                                   
                                   Image(systemName: icon)
                                       .foregroundColor(Color(hex: "879957"))
                                       .font(.system(size: 20))
                               }
                               .frame(width: 60, height: 60)
                               
                               Text("\(amount)")
                                   .fontWeight(.bold)
                                   .padding(.top, 5)
                           }
                       }
                   }
            

struct LineChartView: View {
    let dataPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            let step = width / CGFloat(dataPoints.count - 1)
            
            Path { path in
                for index in dataPoints.indices {
                    let x = step * CGFloat(index)
                    let y = height - (dataPoints[index] * height)
                    if index == 0 {
                        path.move(to: CGPoint(x: x, y: y))
                    } else {
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                }
            }
            .stroke(Color.white, lineWidth: 2)
            
            ForEach(0..<dataPoints.count, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(Color.white)
                    .position(x: step * CGFloat(index), y: height - (dataPoints[index] * height))
            }
        }
    }
}

struct ChartView: View {
    var body: some View {
        LineChartView(dataPoints: [0.2, 0.5, 0.8, 0.3, 0.6])
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .cornerRadius(20)
    }
}



struct FoodWasteDataTrackingView_Previews: PreviewProvider {
    static var previews: some View {
        FoodWasteDataTrackingView()
    }
}
