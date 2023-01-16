//
//  AddStudentView.swift
//  Students
//
//  Created by Andreas Wenzelhuemer on 12.01.23.
//

import SwiftUI

struct AddStudentView: View {
    
    @State var firstname: String = ""
    @State var lastname: String = ""
    @State var age: Int16 = 0
    @Environment(\.dismiss) private var dismiss
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Firstname", text: $firstname)
                TextField("Lastname", text: $lastname)
                TextField("Age", value: $age, format: .number)
            }.navigationTitle("Add student")
                .navigationBarItems(
                    leading: Button(action: {
                        dismiss()
                    }) {
                        Text("Cancel").bold()
                    },
                    trailing: Button(action: {
                        let student = Student(context: moc)
                        student.firstname = firstname
                        student.lastname = lastname
                        student.age = age
                        student.id = UUID()
                        
                        do {
                            try moc.save()
                            dismiss()
                            print("Saved!")
                        } catch {
                            moc.rollback()
                            print("Failed to save student : \(error)")
                        }
                        print("save...")
                    }) {
                        Text("Save").bold()
                    })
        }
    }
}

struct AddStudentView_Previews: PreviewProvider {
    static var previews: some View {
        AddStudentView()
    }
}
