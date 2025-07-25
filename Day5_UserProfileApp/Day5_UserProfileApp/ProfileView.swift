//
//  ProfileView.swift
//  Day5_UserProfileApp
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var isActive: Bool = true
    @State private var age: String = ""
    @State private var designation: String = ""
    @State private var department: String = ""
    @State private var location: String = ""
    @State private var navigateToSummary: Bool = false

    @State private var selectedImage: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil

    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""

    var body: some View {
        VStack(spacing: 15) {
           
            PhotosPicker(selection: $selectedImage, matching: .images) {
                if let data = imageData,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                }
            }
            .onChange(of: selectedImage) { newItem in
                Task {
                    if let item = newItem,
                       let data = try? await item.loadTransferable(type: Data.self) {
                        imageData = data
                    }
                }
            }

            
            Group {
                TextField("Enter name", text: $name)
                TextField("Enter email", text: $email)
                TextField("Enter age", text: $age)
                    .keyboardType(.numberPad)
                TextField("Enter designation", text: $designation)
                TextField("Enter location", text: $location)
            }
            .textFieldStyle(.roundedBorder)

            Toggle("Active Status", isOn: $isActive)

            
            NavigationLink(
                destination: SummaryView(
                    user: User(
                        name: name,
                        email: email,
                        isActive: isActive,
                        age: age,
                        designation: designation,
                        department: department,
                        location: location
                    ),
                    imageData: imageData
                ),
                isActive: $navigateToSummary
            ) {
                EmptyView()
            }

           
            Button("Save & View Summary") {
                if validateForm() {
                    navigateToSummary = true
                } else {
                    showAlert = true
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)

            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
        .alert("Validation Error", isPresented: $showAlert, actions: {
            Button("OK", role: .cancel) { }
        }, message: {
            Text(alertMessage)
        })
    }

    
    private func validateForm() -> Bool {
        if name.isEmpty || email.isEmpty || age.isEmpty || designation.isEmpty ||  location.isEmpty {
            alertMessage = "All fields are required."
            return false
        }

        if !isValidEmail(email) {
            alertMessage = "Please enter a valid email address."
            return false
        }

        return true
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "(?:[a-zA-Z0-9._%+-]+)@(?:[a-zA-Z0-9-]+)\\.(?:[a-zA-Z]{2,})"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return predicate.evaluate(with: email)
    }
}

#Preview {
    ProfileView()
}
