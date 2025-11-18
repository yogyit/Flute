import SwiftUI

struct RegistrationView: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var dob = Date()
    @State private var gender = "Male"
    let genders = ["Male", "Female", "Others"]
    
    @State private var maritalStatus = ""
    let maritalOptions = ["Single", "Married", "Divorced", "Widowed"]
    
    @State private var selectedLanguages: [String] = []
    let languages = ["English", "Hindi", "Tamil", "Bengali", "Telugu"]
    
    @State private var role = "Astrologer"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    
                    // MARK: First Name
                    Text("First Name")
                        .font(.caption)
                    
                    TextField("Enter first name", text: $firstName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
                    
                    // MARK: Last Name
                    Text("Last Name")
                        .font(.caption)
                    TextField("Enter last name", text: $lastName)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
                    
                    // MARK: Date of Birth
                    Text("Date of birth")
                        .font(.caption)
                    DatePicker("", selection: $dob, displayedComponents: .date)
                        .datePickerStyle(.compact)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
                    
                    // MARK: Gender
                    Text("Gender")
                        .font(.caption)
                    
                    HStack(spacing: 20) {
                        ForEach(genders, id: \.self) { item in
                            HStack {
                                Image(systemName: gender == item ? "circle.inset.filled" : "circle")
                                    .foregroundColor(.blue)
                                Text(item)
                            }
                            .onTapGesture { gender = item }
                        }
                    }
                    
                    // MARK: Marital Status Dropdown
//                    Text("Marital Status")
//                        .font(.caption)
//
//                    Menu {
//                        ForEach(maritalOptions, id: \.self) { option in
//                            Button(option) { maritalStatus = option }
//                        }
//                    } label: {
//                        HStack {
//                            Text(maritalStatus.isEmpty ? "Select" : maritalStatus)
//                                .foregroundColor(maritalStatus.isEmpty ? .gray : .primary)
//                            Spacer()
//                            Image(systemName: "chevron.down")
//                        }
//                        .padding()
//                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
//                    }
                    
                     //MARK: Languages Dropdown
                    Text("Languages you speak")
                        .font(.caption)

                    Menu {
                        ForEach(languages, id: \.self) { lang in
                            Button(lang) {
                                if selectedLanguages.contains(lang) {
                                    selectedLanguages.removeAll { $0 == lang }
                                } else {
                                    selectedLanguages.append(lang)
                                }
                            }
                        }
                    } label: {
                        HStack {
                            Text(selectedLanguages.isEmpty ? "Select" : selectedLanguages.joined(separator: ", "))
                                .foregroundColor(selectedLanguages.isEmpty ? .gray : .primary)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.4)))
                    }
                    
                    // MARK: Role
//                    Text("Choose your role")
//                        .font(.caption)
//
//                    HStack {
//                        Image(systemName: "circle.inset.filled")
//                            .foregroundColor(.blue)
//                        Text("Astrologer")
//                    }
//
//                    Text("Choose this if your expertise lies in Astrology, Tarot Reading, Numerology, Palmistry, or other spiritual guidance fields")
//                        .font(.footnote)
//                        .foregroundColor(.gray)
//                        .padding(.top, -10)
                }
                .padding()
            }
            
        }
        .navigationTitle("Flute Registration")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

