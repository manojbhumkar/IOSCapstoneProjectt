//
//  RegisterView.swift
//  UserApp
//
//  Created by admin on 30/01/25.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var username = ""
    @State private var password = ""
    @State private var id = ""
    @State private var gender = ""
    @State private var email = ""
    @State private var age = ""
    @State private var registrationSuccess = false

    var body: some View {
        VStack {
            Text(" Patient Registration ")
                .font(.largeTitle)
                .padding()

            TextField("Enter Full Name ", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
          
            TextField("Enter Your Email Id ", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
           
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Register") {
                registerUser()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            if registrationSuccess {
                Text(" Patient Registration successful!")
                    .foregroundColor(.green)
            }
        }
        .padding()
    }

    private func registerUser() {
        let newUser = User(context: viewContext)
        newUser.username = username
        newUser.password = password

        do {
            try viewContext.save()
            registrationSuccess = true
        } catch {
            print("Failed to register user: \(error)")
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

