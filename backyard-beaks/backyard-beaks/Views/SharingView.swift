//
//  SharingView.swift
//  backyard-beaks
//
//  Created by Tianna Alina Lopes on 2/3/24.
//

import SwiftUI

struct SharingView: View {
    var body: some View {
        VStack {
            Text("Sharing")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            VStack(spacing: 20) {
                SharingOptionView(iconName: "house.fill", title: "Keep your home in check", description: "Share updates about your homestead.")
                SharingOptionView(iconName: "lock.fill", title: "Protect your privacy", description: "Share key conclusions. Stop anytime.")
                SharingOptionView(iconName: "bell.fill", title: "Notifications", description: "Get notified of updates to shared dashboards.")
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
            }) {
                Text("Start sharing")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "879957"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Button(action: {
                //TODO: Setting action
            }) {
                HStack {
                    Image(systemName: "gearshape.fill")
                    Text("Setting")
                }
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 2)
                )
            }
            .padding(.horizontal)
            
            HStack {
                Spacer()
                Image(systemName: "house.fill")
                Spacer()
                Image(systemName: "magnifyingglass")
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                Spacer()
            }
            .padding()
            .background(Color.white)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SharingOptionView: View {
    let iconName: String
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(Color(hex: "879957"))
                .padding()
            VStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.bold)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

struct SharingView_Previews: PreviewProvider {
    static var previews: some View {
        SharingView()
    }
}

