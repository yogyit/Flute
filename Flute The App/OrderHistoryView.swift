import SwiftUI

struct OrderHistoryView: View {
    @State private var selectedDate = "6 May 2025"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // MARK: - Date Picker Button
                Button(action: {}) {
                    HStack {
                        Text(selectedDate)
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Image(systemName: "chevron.down")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
                
                // MARK: - Scrollable Order List
                ScrollView {
                    VStack(spacing: 16) {
                        OrderCardView(
                            orderId: "1714207267188",
                            serviceType: "Audio Call",
                            username: "User 919",
                            duration: "1 min",
                            rate: "₹4.5/min",
                            earning: "₹0.0",
                            time: "27 Apr 24 (02:11–02:11 PM)",
                            status: "Complete"
                        )
                        
                        OrderCardView(
                            orderId: "1714207267188",
                            serviceType: "Anonymous Call",
                            username: "Akshat (40362919)",
                            duration: "1 min",
                            rate: "₹4.5/min",
                            earning: "₹0.0",
                            time: "27 Apr 2024 (02:11–02:11 PM)",
                            status: "Complete"
                        )
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarTitle("Order History", displayMode: .inline)
        }
    }
}

struct OrderCardView: View {
    let orderId: String
    let serviceType: String
    let username: String
    let duration: String
    let rate: String
    let earning: String
    let time: String
    let status: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            // Top Section
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Order Id")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(orderId)
                        .font(.system(size: 15, weight: .semibold))
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .rotationEffect(.degrees(90))
                    .foregroundColor(.gray)
            }
            
            // Service Type
            VStack(alignment: .leading, spacing: 4) {
                Text("Service Type:")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(serviceType)
                    .font(.system(size: 16, weight: .semibold))
            }
            
            // User + Duration
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("User Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(username)
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Duration")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(duration)
                        .font(.system(size: 16))
                }
            }
            
            // Rate + Earnings
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Rate")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(rate)
                        .font(.system(size: 16))
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Earning")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(earning)
                        .font(.system(size: 16))
                }
            }
            
            // Time + Status
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Order Time")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(time)
                        .font(.system(size: 14))
                }
                
                Spacer()
                
                Text(status)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.green)
            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}

