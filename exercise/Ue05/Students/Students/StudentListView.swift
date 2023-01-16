import CoreData

import SwiftUI

struct StudentListView: View {
    
    @State private var searchText: String = ""
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Student.lastname, ascending: true)],
        // predicate: NSPredicate(format: "lastname CONTAINS[%@] OR firstname CONTAINS[%@]", searchText as NSString)
        animation: .default)
    private var studentData: FetchedResults<Student>
    
    var body: some View {
        List(studentData) { student in
            NavigationLink("\(student.lastname!) \(student.firstname!)") {
                StudentDetailView(student: student)
            }
        }
        .searchable(text: $searchText)
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        StudentListView()
    }
}
