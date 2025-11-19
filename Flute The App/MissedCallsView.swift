
import SwiftUI



struct MissedCall: Identifiable {
    let id = UUID()
    let userName: String
    let serviceType: String
    let orderTime: String
}


struct MissedCallsView: View {
    
    let calls: [MissedCall] = [
        MissedCall(userName: "Aziz Babu", serviceType: "Video Call", orderTime: "27 Apr 24 (03:57 PM)"),
        MissedCall(userName: "NickName", serviceType: "Audio Call", orderTime: "27 Apr 24 (03:57 PM)"),
        MissedCall(userName: "User 420", serviceType: "Video Call", orderTime: "27 Apr 24 (03:57 PM)")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(calls) { call in
                        MissedCallCard(call: call)
                    }
                }
                .padding(.top)
            }
            .navigationBarTitle("Missed Calls", displayMode: .inline)
        }
    }
}




struct MissedCallCard: View {
    let call: MissedCall
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("User Name")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(call.userName)
                        .font(.headline)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 4) {
                    Text("Service Type")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text(call.serviceType)
                        .font(.headline)
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Order Time")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text(call.orderTime)
                    .font(.subheadline)
            }
            
            HStack {
                Spacer()

                Button(action: {}) {
                    Text("Reject")
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(Color.red)
                        .cornerRadius(20)
                }
                
                
                Button(action: {}) {
                    Text("Callback")
                        .foregroundColor(.white)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 20)
                        .background(Color.green)
                        .cornerRadius(20)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
    }
}
