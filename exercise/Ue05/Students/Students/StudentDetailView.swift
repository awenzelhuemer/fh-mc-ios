//
//  StudentDetailView.swift
//  Students
//
//  Created by Andreas Wenzelhuemer on 13.01.23.
//

import SwiftUI

struct StudentDetailView: View {
    
    let student: Student
    
    var body: some View {
        NavigationStack {
            List {
                Text("Lastname: \(student.lastname!)")
                Text("Firstname: \(student.firstname!)")
                Text("Age: \(student.age)")
            }.navigationTitle("Details")
        }}
}

struct StudentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StudentDetailView(student: Student())
    }
}
