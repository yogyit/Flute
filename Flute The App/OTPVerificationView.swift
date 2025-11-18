import SwiftUI

struct OTPVerificationView: View {
    @State private var otp: String = ""
    @FocusState private var isOTPFieldFocused: Bool
    @State private var navigate = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Verify your account")
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)
                    
                    Text("Type in the verification code we sent you on +91 7850098500")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    otpField
                    Button(action: {
                        
                        navigate = true
                    }) {
                        Text("continue")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(otp.count == 6 ? themeColor():Color.gray.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(otp.count < 6)
                    NavigationLink(destination: MainTabView(), isActive: $navigate) {
                        EmptyView()
                    }
                    
                    HStack {
                        Text("No code received?")
                            .foregroundColor(.gray)
                        Button("Resend OTP") {}
                            .foregroundColor(.primary)
                    }
                    .font(.footnote)
                    .padding(.top, 8)
                    Spacer().frame(height: 60)
                    VStack {
                        Image("themeIcon") // Replace with your asset name
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                    }
                    .frame(maxWidth: .infinity)
                    Spacer().frame(height: 20)
                    footerStatus.frame(height: 200)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            }
        }
        .navigationBarHidden(false)
        
    }
    
   
    
    private var otpField: some View {
           ZStack {
               HStack(spacing: 12) {
                   ForEach(0..<6) { index in
                       ZStack {
                           RoundedRectangle(cornerRadius: 8)
                               .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                               .frame(width: 45, height: 50)
                           
                           Text(otpCharacter(at: index))
                               .font(.title2)
                               .bold()
                       }
                   }
               }
               
               // Invisible TextField capturing input for all boxes
               TextField("", text: $otp)
                   .keyboardType(.numberPad)
                   .textContentType(.oneTimeCode) // iOS OTP autofill hint
                   .foregroundColor(.clear)
                   .accentColor(.clear)
                   .disableAutocorrection(true)
                   .focused($isOTPFieldFocused)
                   .onChange(of: otp) { newValue in
                       // Allow only digits, max 6 characters
                       let filtered = newValue.filter { "0123456789".contains($0) }
                       if filtered != newValue || filtered.count > 6 {
                           otp = String(filtered.prefix(6))
                       } else {
                           otp = filtered
                       }
                   }
                   .frame(width: 270, height: 50) // Width enough for 6 boxes + spacing
                   .background(Color.clear)
           }
           .contentShape(Rectangle()) // Make entire area tappable to bring up keyboard
           .onTapGesture {
               isOTPFieldFocused = true
           }
       }
    
    private func otpCharacter(at index: Int) -> String {
        guard index < otp.count else { return "" }
        let char = Array(otp)[index]
        return String(char)
    }
    
    private var footerStatus: some View {
        HStack {
            VStack(alignment: .leading, spacing: 24) {
                Text("New User?")
            }
            .font(.subheadline)
            .foregroundColor(.black)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Inactive")
                Text("Rejected")
                Text("Suspended")
            }
            .font(.subheadline)
            .foregroundColor(.black)
        }
    }
}
