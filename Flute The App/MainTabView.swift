//
//  File.swift
//  Flute The App
//
//  Created by ipad on 18/11/25.
//

import SwiftUI

import SwiftUI

struct MainTabView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground() // Makes the background non-transparent
        appearance.backgroundColor = UIColor.systemGray6 // your desired color
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance // important for iOS 15+
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            InboxView()
                .tabItem {
                    Image(systemName: "envelope.fill")
                    Text("Inbox")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .accentColor(.blue)
        .navigationBarBackButtonHidden(true)
    }
}



struct InboxView: View {
    var body: some View {
        Text("Inbox Screen")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile Screen")
    }
}

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)
                let names = [
                    "Update phone Number", "My gallery", "View Price list request", "wallet", "waitlist",
                    "Price change Request", "Bank Detail", "term and condition", "Download form 16A", "Pay Slips",
                ]
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(Array(names.enumerated()), id: \.offset) { index, name in
                        
                        // Random background color
                        let randomColor = Color(
                            red: .random(in: 0.3...0.9),
                            green: .random(in: 0.3...0.9),
                            blue: .random(in: 0.3...0.9)
                        )
                        
                        VStack(spacing: 8) {
                            
                            ZStack {
                                Circle()
                                    .fill(randomColor)
                                
                                Image(systemName: "doc.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 60, height: 60)
                            
                            Text(name)
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .fixedSize(horizontal: false, vertical: true) // ← allows multi-line
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(uiColor: .systemBackground))
                        .cornerRadius(12)
                        .shadow(radius: 0.5)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "power")
                        .font(.title3)
                        .foregroundColor(.white)
                }
            }
        }
    }
}








