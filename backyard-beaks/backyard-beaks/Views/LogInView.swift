//
//  LogInView.swift
//  backyard-beaks
//
//  Created by Tianna Alina Lopes on 2/3/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            Text("Welcome back")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.top, 100)
                .foregroundColor(Color(hex: "879957"))
            
            TextField("Enter email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                .padding(.top, 50)
            
            SecureField("Enter password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Button("Forgot password?") {
                //TODO: Forgot password action
            }
            .padding(.top, 5)
            .foregroundColor(.gray)
            
            Button(action: {
                //TODO: Sign in action
            }) {
                Text("Sign In")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "879957"))
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.top, 30)
            
            Text("OR LOG IN WITH")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding(.top, 30)
            
            HStack(spacing: 20) {
                Button(action: { /* TODO: Google login action */ }) {
                    Image(systemName: "g.circle")
                }
                
                Button(action: { /*TODO: Facebook login action */ }) {
                    Image(systemName: "f.circle")
                }
                
                Button(action: { /*TODO: Apple login action */ }) {
                    Image(systemName: "applelogo")
                }
            }
            .font(.largeTitle)
            .padding(.top, 20)
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign up")
                        .foregroundColor(Color(hex: "879957"))
                }
            }
            .padding(.bottom, 40)
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SignUpView: View {
    var body: some View {
        Text("Sign Up View")
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LogInView()
        }
    }
}

