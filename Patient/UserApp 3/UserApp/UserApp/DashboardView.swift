import SwiftUI

struct DashboardView: View {
    @State private var patientName: String = ""
    @State private var patientAge: String = ""
    @State private var patientContact: String = ""
    @State private var showSuccessMessage: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                // Welcome Text
                Text("Welcome to the Dashboard!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                    .padding()

                // Patient Profile Form
                Form {
                    Section(header: Text("Patient Profile")) {
                        TextField("Enter Patient Name", text: $patientName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Enter Patient Age", text: $patientAge)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextField("Enter Patient Contact", text: $patientContact)
                            .keyboardType(.phonePad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }

                // Save Profile Button
                Button(action: savePatientProfile) {
                    Text("Save Profile")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                // Success Message
                if showSuccessMessage {
                    Text("Profile Saved Successfully!")
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding()
                        .transition(.opacity)
                }

                // Navigate to BookingAppointmentView
                NavigationLink(destination: BookingAppointmentView()) {
                    Text("Book Appointment")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

            }
            .padding()
            .navigationTitle("Dashboard")  // Set title for Navigation Bar
        }
    }

    private func savePatientProfile() {
        guard !patientName.isEmpty, !patientAge.isEmpty, !patientContact.isEmpty else {
            print("Please fill all fields.")
            return
        }

        print("Patient Profile Saved:")
        print("Name: \(patientName), Age: \(patientAge), Contact: \(patientContact)")

        showSuccessMessage = true
        patientName = ""
        patientAge = ""
        patientContact = ""

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            showSuccessMessage = false
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
