//
//  HomeDashboardView.swift
//  backyard-beaks
//
//  Created by Tianna Alina Lopes on 2/3/24.
//

import SwiftUI

extension Color {
    static let mainGreen = Color(hex: "879957")
    static let mainOrange = Color(hex: "F87F4C")
    static let mainLightBlue = Color(hex: "97D4DB")
    static let mainDarkOrange = Color(hex: "F3A65A")
    static let mainLightOrange = Color(hex: "EEBCB0")
    
    static let semanticRed = Color(hex: "DE3B40")
    static let semanticYellow = Color(hex: "EFB034")
    static let semanticGreen = Color(hex: "1DD75B")
    static let semanticBlue = Color(hex: "379AE6")

}

struct HomeDashboardView: View {
    var body: some View {
           ScrollView {
               VStack(alignment: .leading) {
                    Text("TUES 11 JUL")
                        .foregroundColor(.secondary)
                        .padding(.top)
                    
                    Text("Overview")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    // Brooding Period
                    VStack(alignment: .leading) {
                        Text("Brooding Period")
                            .font(.headline)
                            .foregroundColor(Color.semanticRed)
                        Text("Based on your chickens age today you should...")
                            .font(.subheadline)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.mainLightOrange)
                    .cornerRadius(10)
                    .padding(.bottom)
                    
                    // Highlights
                    Text("Highlights")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    // Example of highlight cards
                    HighlightCardView()
                    
                    // This Week Report
                    Text("This week report")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    // Example of weekly report cards
                    WeeklyReportCardView()
                    
                    // Blogs Section
                    Text("Blogs")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.vertical)
                    
                    // Example of blog cards
                    BlogCardView()
                }
           
                       .padding(.horizontal)
                   }
                   .background(Color.white)
                   .navigationBarTitleDisplayMode(.inline)
                   .toolbar {
                       ToolbarItem(placement: .navigationBarLeading) {
                           Button(action: {}) {
                               Image(systemName: "line.horizontal.3")
                           }
                       }
                   }
               }
           }

    
    struct HighlightCard: View {
        var color: Color
        var title: String
        var amount: String
        var time: String
        
        var body: some View {
            VStack {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(amount)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(color)
                Text(time)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(width: 150, height: 150)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
    
    struct ReportCard: View {
        var title: String
        var detail: String
        var icon: String
        
        var body: some View {
            VStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(Color.mainDarkOrange)
                    .padding(.bottom, 5)
                Text(title)
                    .fontWeight(.semibold)
                Text(detail)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(width: 150, height: 150)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
struct WeeklyReportCardView: View {
    var body: some View {
        HStack(spacing: 10) {
            ReportCard(title: "Chicken Status", detail: "4 Full Grown", icon: "hare.fill")
            ReportCard(title: "Soil State", detail: "Ready for seeds", icon: "leaf.fill")
            ReportCard(title: "Water", detail: "10,659 ml", icon: "drop.fill")
            ReportCard(title: "Feed", detail: "78 ounces", icon: "cup.and.saucer.fill")
        }
        .padding(.vertical)
    }
}
struct HighlightCardView: View {
    var body: some View {
        HStack(spacing: 10) {
            HighlightCard(color: .mainGreen, title: "Waste saved from landfills", amount: "2.34 pounds", time: "updated 15 min ago")
            HighlightCard(color: .mainOrange, title: "Eggs Produced", amount: "7", time: "updated 30m ago")
            HighlightCard(color: .mainLightBlue, title: "Carbon Savings", amount: "0.5 kg CO2e", time: "updated a day ago")
            HighlightCard(color: .mainDarkOrange, title: "Manure Production", amount: "2.3 pounds", time: "updated 5 min ago")
        }
        .padding(.vertical)
    }
}
    struct BlogCard: View {
        var imageName: String
        var title: String
        var votes: String
        
        var body: some View {
            VStack {
                Image("ChickenFamily")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 100)
                    .clipped()
                Text(title)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .frame(width: 150)
                Text(votes)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(width: 150, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
struct BlogCardView: View {
    var body: some View {
        HStack(spacing: 10) {
            BlogCard(imageName: "chickenFamily", title: "Which Breeds Are Right For You?", votes: "78 votes")
            BlogCard(imageName: "garden", title: "How to enrich soil", votes: "54 votes")
        }
        .padding(.vertical)
    }
}



    struct HomeDashboardView_Previews: PreviewProvider {
        static var previews: some View {
            HomeDashboardView()
        }
    }
