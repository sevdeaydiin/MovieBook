//
//  LoginView.swift
//  MovieBook
//
//  Created by Sevde Aydın on 8.05.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Login") {
                login()
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("Incorrect email or password"), dismissButton: .default(Text("OK")))
        }
    }
    
    func login() {
        guard let url = URL(string: "http://localhost:3030/api/login") else {
            return
        }
        
        let body: [String: String] = [
            "email": email,
            "password": password
        ]
        
        guard let bodyData = try? JSONSerialization.data(withJSONObject: body) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = bodyData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle response
            if let data = data {
                // Handle response data
                if let responseString = String(data: data, encoding: .utf8), responseString == "success" {
                    // Successful login
                    // Navigate to MovieListView
                    print("Successful login")
                } else {
                    // Unsuccessful login
                    // Show alert
                    showAlert = true
                    print("Incorrect email or password")
                }
            }
        }.resume()
    }
}


#Preview {
    LoginView()
}
