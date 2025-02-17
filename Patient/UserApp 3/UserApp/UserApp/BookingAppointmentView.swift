//
//  BookingAppointmentView.swift
//  UserApp
//
//  Created by admin on 17/02/25.
//

import SwiftUI

struct BookingAppointmentView: View {
    @State private var doctorName: String = "Dr. Smith"
    @State private var specialization: String = "Cardiologist"
    @State private var selectedSlot: String = "Morning"
    @State private var appointmentDate: Date = Date()
    @State private var showToast: Bool = false
    @State private var appointmentDetails: AppointmentDetails? = nil

    var body: some View {
        VStack(spacing: 20) {
            // Confirm Booking Button at the top
            Button(action: {
                // Simulate booking confirmation
                self.appointmentDetails = AppointmentDetails(
                    doctorName: doctorName,
                    specialization: specialization,
                    slot: selectedSlot,
                    appointmentDate: appointmentDate
                )
                self.showToast.toggle()
            }) {
                Text("Confirm Booking")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top)
            .alert(isPresented: $showToast) {
                Alert(
                    title: Text("Success"),
                    message: Text("Your appointment has been successfully booked."),
                    dismissButton: .default(Text("OK"))
                )
            }

            
            // Doctor Name
            Text("Doctor: \(doctorName)")
                .font(.title2)
                .padding(.top)
            
            // Specialization
            Text("Specialization: \(specialization)")
                .font(.title3)
                .padding(.top)
            
            // Slot (Morning or Evening)
            Picker("Select Slot", selection: $selectedSlot) {
                Text("Morning").tag("Morning")
                Text("Evening").tag("Evening")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.top)
            
            // Appointment Date
            DatePicker("Select Date", selection: $appointmentDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding(.top)

            // View Bookings Button (Always shown after booking confirmation)
            if let details = appointmentDetails {
                NavigationLink(
                    destination: AppointmentDetailsView(appointmentDetails: details),
                    label: {
                        Text("View Bookings")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                )
                .padding(.top)
            }
        }
        .padding()
        .navigationTitle("Book Appointment")
    }
}

struct BookingAppointmentView_Previews: PreviewProvider {
    static var previews: some View {
        BookingAppointmentView()
    }
}
