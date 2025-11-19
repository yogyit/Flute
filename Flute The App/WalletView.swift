import SwiftUI

// Define a structure for the transaction data
struct Transaction: Identifiable {
    let id = UUID()
    let type: String
    let txnId: String
    let amount: Int
    let date: String
    let time: String
}

// Sample Data
let sampleTransactions: [Transaction] = [
    Transaction(type: "Audio Call", txnId: "40362919", amount: 0, date: "27 Apr 24", time: "02:12 PM"),
    Transaction(type: "Video Call", txnId: "40362919", amount: 0, date: "27 Apr 24", time: "02:12 PM"),
    Transaction(type: "Live Audio Call", txnId: "40362919", amount: 0, date: "27 Apr 24", time: "02:12 PM"),
    Transaction(type: "Live Video Call", txnId: "40362919", amount: 0, date: "27 Apr 24", time: "02:12 PM")
]

struct WalletView: View {
    
    // Hardcoded values from the image for demonstration
    let lifetimeEarnings: Int = 11705
    let walletAmount: Int = 5100
    let todaysEarning: Int = 1012
    
    var body: some View {
        NavigationView{
            // Use a ZStack to set a background color for the entire screen
            ZStack {
                Color(red: 0.95, green: 0.95, blue: 0.97).edgesIgnoringSafeArea(.all) // Light gray/off-white background
                
                VStack(spacing: 16) {
                    // 2. Earnings and Wallet Amount Cards
                    HStack(spacing: 8) {
                        
                        // Lifetime Earnings Card
                        CardView(
                            title: "Lifetime Earnings",
                            amount: lifetimeEarnings,
                            backgroundColor: Color.yellow, // Light Green
                            textColor: .black,
                            showArrow: false
                        )
                        
                        // Wallet Amount Card
                        CardView(
                            title: "Wallet Amount",
                            amount: walletAmount,
                            backgroundColor: Color.yellow,
                            textColor: .black,
                            showArrow: true
                        )
                    }
                    .padding(.horizontal)
                    
                    // 3. Today's Earning Card
                    VStack(spacing: 4) {
                        Text("Today's Earning")
                            .font(.headline)
                            .foregroundColor(.black.opacity(0.6))
                        
                        Text("₹\(todaysEarning.formatted(.number))") // Fix: Use .formatted(.number) for correct grouping
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.98, green: 0.90, blue: 0.90)) // Light Pink/Red
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    // 4. Transaction Header with Dropdown
                    HStack {
                        Spacer()
                        Text("Today")
                            .font(.headline)
                        Image(systemName: "chevron.down")
                            .font(.caption)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, minHeight: 50) // Full width, height 80
                    .background(Color.white)                  // White background
                    .shadow(radius: 0.5) // Subtle shadow
                    .padding(.horizontal)
                    
                    // 5. Transaction List
                    List {
                        ForEach(sampleTransactions) { transaction in
                            TransactionRow(transaction: transaction)
                                .listRowInsets(EdgeInsets()) // Remove default list padding
                        }
                        // This is to remove the gray background in the list row in older SwiftUI versions
                        .listRowBackground(Color.white)
                        .shadow(radius: 0.5)
                        .frame(height: 50)
                    }
                    .listStyle(.grouped) // Use plain style for a simple look
                    .padding(.horizontal)
                    
                }
            }
            .navigationBarTitle("Wallet", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "doc.text")
                        .font(.title3)
                        .foregroundColor(.white)   // Make the icon white
                }
            }
        }
    }
}

// MARK: - Subviews

// A reusable view for the top cards (Lifetime and Wallet)
struct CardView: View {
    let title: String
    let amount: Int
    let backgroundColor: Color
    let textColor: Color
    let showArrow: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(textColor.opacity(0.8))
                
                Text("₹\(amount.formatted(.number))") // Fix: Use .formatted(.number)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
            }
            Spacer()
            
            if showArrow {
                Image(systemName: "arrow.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .bold))
            }
        }
        .padding()
        .frame(height: 80) // Fixed height for visual consistency
        .background(backgroundColor)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}

// A reusable view for each transaction row
struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(transaction.type)
                    .font(.headline)
                Spacer()
                Text("+\(transaction.amount, format: .currency(code: "INR"))")
                    .font(.headline)
                    .fontWeight(.semibold)
            }
            
            HStack {
                Text("Txn Id: \(transaction.txnId)")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
                Text("\(transaction.date), \(transaction.time)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Extensions

// Extension to format integers as currency strings
extension NumberFormatter {
    static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        // You could add locale-specific formatting here if needed
        return formatter
    }()
}

// Preview to see the view in Xcode Canvas
