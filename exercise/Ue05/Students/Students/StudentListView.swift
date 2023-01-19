import CoreData

import SwiftUI

struct StudentListView: View {
    
    @State private var searchText: String = ""
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.lastname, ascending: true)],
        animation: .default)
    private var studentData: FetchedResults<Student>
    var query: Binding<String> {
        Binding {
            searchText
        } set: { newValue in
            searchText = newValue
            studentData.nsPredicate = searchText.isEmpty
                ? nil
                : NSPredicate(format: "lastname CONTAINS %@ OR firstname CONTAINS %@", newValue, newValue)
        }
    }
    
    var body: some View {
        List(studentData) { student in
            NavigationLink("\(student.lastname!) \(student.firstname!)") {
                StudentDetailView(student: student)
            }
        }
        .searchable(text: query)
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
    }
}
