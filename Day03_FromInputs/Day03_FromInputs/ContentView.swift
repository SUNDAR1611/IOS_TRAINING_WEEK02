//
//  ContentView.swift
//  Day03_FromInputs
//
//  Created by cs_ios on 25/07/25.
//



import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var showAlert: Bool = false
    @State private var alertTitle: String = "Submitted Info"
    @State private var alertMessage: String = ""

    var body: some View {
        VStack(spacing: 20) {
        
                Text("User Form")
                    .font(.title)
                    .fontWeight(.semibold)
    

            TextField("Enter name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            TextField("Enter email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .padding(.horizontal)

            Button("Submit") {
                validateInputs()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .alert(alertTitle, isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

    func validateInputs() {
        if name.isEmpty || email.isEmpty {
            alertTitle = "Missing Fields"
            alertMessage = "Please fill in both your name and email."
            showAlert = true
        } else if !isValidEmail(email) {
            alertTitle = "Invalid Email"
            alertMessage = "Please enter a valid email address."
            showAlert = true
        } else {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .short

            alertTitle = "Submitted Info"
            alertMessage = """
            Name: \(name)
            Email: \(email)
            Submitted on: \(formatter.string(from: date))
            """
            showAlert = true
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: email)
    }
}



#Preview {
    ContentView()
}
