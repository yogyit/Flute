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
        Text("Settings Screen")
    }
}




struct HomeView: View {
    @State private var chatEnabled = false
    @State private var audioEnabled = false
    @State private var videoEnabled = false
    @State private var waitlistEnabled = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // MARK: Internet Speed Banner
                HStack {
                    Text("Your Internet speed: ")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    Text("Very Good")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                    
                    Image(systemName: "wifi")
                        .foregroundColor(.green)
                        .padding(.leading, 4)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green.opacity(0.15))
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        
                        // MARK: Chat Toggle
                        toggleRow(
                            title: "Chat",
                            price: "India: ₹4.0",
                            binding: $chatEnabled
                        )
                        
                        // MARK: Audio Toggle
                        toggleRow(
                            title: "Audio Call",
                            price: "India: ₹8.0",
                            binding: $audioEnabled
                        )
                        
                        // MARK: Video Toggle (disabled look)
                        toggleRow(
                            title: "Video Call",
                            price: "India: ₹16.0",
                            binding: $videoEnabled,
                            disabled: true
                        )
                        
                        // MARK: Waitlist Toggle
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Text("Waitlist")
                                    .font(.headline)
                                Spacer()
                                Toggle("", isOn: $waitlistEnabled)
                                    .labelsHidden()
                            }
                            
                            Text("Allow users to join")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        // MARK: - Status Box
                        statusBox
                        
                        VStack(spacing: 16) {
                            ForEach(["Button 1", "Button 2"], id: \.self) { title in
                                Button(action: {
                                    print("\(title) tapped")
                                }) {
                                    HStack {
                                        Image(systemName: "person.fill") // Left circular image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 30, height: 30)
                                            .clipShape(Circle())
                                        
                                        
                                        Text(title) // Center text
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right") // Right arrow
                                            .foregroundColor(.white)
                                    }
                                    .padding(.horizontal)
                                    .frame(height: 60)
                                    .frame(maxWidth: .infinity)
                                    .background(themeColor())
                                    .cornerRadius(12)
                                }
                                .padding(.horizontal, 10) // 90% width approximation
                            }
                        }
                        .padding(.vertical)

                        
                        
                        
                        Text("Gallery")
                                   .font(.headline)
                                   .padding(.horizontal)
                               
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(1...10, id: \.self) { index in
                                    Image(systemName: "photo") // Replace with your image names
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipped()
                                        .cornerRadius(12)
                                        .shadow(radius: 2)
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                        
                        Text("")
                            .font(.headline)
                            .padding(.horizontal)

                        let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)

                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(1...12, id: \.self) { index in
                                VStack(spacing: 8) {
                                    Image(systemName: "person.fill") // Replace with your image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                    
                                    Text("Item \(index)")
                                        .font(.subheadline)
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
                    .padding()
                }
                // MARK: Bottom Tab Bar Placeholder
            }
            .navigationBarTitle("Kiara", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell")
                        .font(.title3)
                }
            }
        }
    }
}


// MARK: - Toggle Row Component
private func toggleRow(title: String,
                       price: String,
                       binding: Binding<Bool>,
                       disabled: Bool = false) -> some View {
    
    VStack(alignment: .leading, spacing: 6) {
        HStack {
            Text(title)
                .font(.headline)
            
            Spacer()
            
            Toggle("", isOn: binding)
                .labelsHidden()
                .disabled(disabled)
                .opacity(disabled ? 0.4 : 1)
        }
        
        Text(price)
            .font(.subheadline)
            .foregroundColor(disabled ? Color.gray.opacity(0.4) : .gray)
    }
}


// MARK: - Status Box at Bottom
private var statusBox: some View {
    VStack(spacing: 16) {
        HStack {
            Text("CHAT")
            Spacer()
            Text("AUDIO")
            Spacer()
            Text("VIDEO")
            Spacer()
            Text("M Calls")
        }
        .font(.caption)
        
        
        HStack(spacing: 40) {
            VStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 45, height: 45)
                    .overlay(Text("Update\ninfo").font(.caption2).multilineTextAlignment(.center).foregroundColor(.white))
                Text("Live").font(.caption).foregroundColor(.green)
            }
            VStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 45, height: 45)
                    .overlay(Text("502").font(.headline).foregroundColor(.white))
                Text("Live info").font(.caption).foregroundColor(.yellow)
            }
            VStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 45, height: 45)
                    .overlay(Text("404").font(.headline).foregroundColor(.white))
                Text("Live info").font(.caption).foregroundColor(.yellow)
            }
            VStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 45, height: 45)
                    .overlay(Text("Sess\ninfo").font(.caption2).multilineTextAlignment(.center).foregroundColor(.white))
                Text("Live").font(.caption).foregroundColor(.green)
            }
        }
    }
    .padding()
    .frame(maxWidth: .infinity)
    .background(RoundedRectangle(cornerRadius: 12).stroke(style: StrokeStyle(lineWidth: 1, dash: [6])))
    .padding(.top, 10)
}


// MARK: - Custom Tab Bar (simple mock)



