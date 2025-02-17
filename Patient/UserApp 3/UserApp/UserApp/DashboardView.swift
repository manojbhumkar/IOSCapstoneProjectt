import SwiftUI

struct DashboardView: View {
    // State variables to hold patient profile data
    @State private var patientName: String = ""
    @State private var patientAge: String = ""
    @State private var patientContact: String = ""
    
    // State variable for success message
    @State private var showSuccessMessage: Bool = false

    var body: some View {
        VStack {
            // Welcome Text
            Text("Welcome to the Dashboard!")
                .font(.largeTitle)
                .padding()
            
            // Form for entering patient profile details
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
            
            // Save Button
            Button(action: savePatientProfile) {
                Text("Save Profile")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            
            // Show success message if profile is saved
            if showSuccessMessage {
                Text("Profile Saved Successfully!")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()
                    .transition(.opacity)
                padding()
            }
        
    
   
    // Save the patient profile
    private func savePatientProfile() {
        // Ensure all fields are filled
        guard !patientName.isEmpty, !patientAge.isEmpty, !patientContact.isEmpty else {
            // Optionally show an alert or handle the case where data is incomplete
            print("Please fill all fields.")
            return
        }

        // Handle saving the patient profile (you can replace this with actual save logic)
        print("Patient Profile Saved:")
        print("Name: \(patientName), Age: \(patientAge), Contact: \(patientContact)")

        // Show success message
        showSuccessMessage = true

        // Optionally reset fields after saving
        patientName = ""
        patientAge = ""
        patientContact = ""

        // Hide the success message after a few seconds (optional)
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
