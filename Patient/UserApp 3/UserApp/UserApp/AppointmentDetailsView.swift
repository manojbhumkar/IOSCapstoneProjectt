//
//  AppointmentDetailsView.swift
//  UserApp
//
//  Created by admin on 17/02/25.
//

import SwiftUI

struct AppointmentDetailsView: View {
    var appointmentDetails: AppointmentDetails

    var body: some View {
        VStack(spacing: 20) {
            Text("Appointment Details")
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Doctor Name
            Text("Doctor: \(appointmentDetails.doctorName)")
                .font(.title2)
            
            // Specialization
            Text("Specialization: \(appointmentDetails.specialization)")
                .font(.title3)
            
            // Slot
            Text("Slot: \(appointmentDetails.slot)")
                .font(.title3)
            
            // Appointment Date
            Text("Date: \(appointmentDetails.appointmentDate, formatter: dateFormatter)")
                .font(.title3)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Confirmed Appointment")
    }
}

struct AppointmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentDetailsView(appointmentDetails: AppointmentDetails(
            doctorName: "Dr. Smith",
            specialization: "Cardiologist",
            slot: "Morning",
            appointmentDate: Date()
        ))
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
