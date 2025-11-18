//
//  ContentView.swift
//  Flute The App
//
//  Created by ipad on 16/11/25.
//

import SwiftUI
import CoreData


struct LoginView: View {
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var navigate = false
    var isFormValid: Bool {
        return !phoneNumber.isEmpty && !email.isEmpty
    }
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.init(red: 0/255, green: 33/255, blue: 71/255,alpha: 1.0)
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            
            UINavigationBar.appearance().tintColor = .white
        }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // Top Header
                VStack {
                    Text("Flute Business")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .padding(.top, 30)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .background(themeColor()) // Dark blue
                
                Spacer().frame(height: 40)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.primary)
                    // Phone Field with Country Code
                    HStack {
                        Image(systemName: "flag.fill")
                            .foregroundColor(.orange)
                        
                        Text("+91")
                            .foregroundColor(.gray)
                        
                        TextField("Phone Number", text: $phoneNumber)
                            .keyboardType(.numberPad)
                            .padding(.leading, 4)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3))
                    )
                    
                    // Email Field
                    TextField("Enter your Email", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3))
                        )
                    
                    // Get OTP Button (disabled)
                    Button(action: {
                        
                        navigate = true
                        
                    }) {
                        Text("Get OTP")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(isFormValid ? themeColor():Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(!isFormValid)
                    NavigationLink(destination: OTPVerificationView(), isActive: $navigate) {
                        EmptyView()
                    }

                    
                }
                .padding(.horizontal, 24)
                
                Spacer()
                
                // Footer Logo + Terms
                VStack(spacing: 10) {
                    
                    Image("themeIcon") // Replace with your asset name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                    
                    HStack {
                        Text("I agree to the")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Button("Terms of Use") {}
                            .font(.footnote)
                            .foregroundColor(.black)
                        
                        Text("&")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        
                        Button("Privacy Policy") {}
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                }
                .padding(.bottom, 30)
            }
            .background(Color(UIColor.systemGroupedBackground))
            .ignoresSafeArea()
        }
        
    }
}


