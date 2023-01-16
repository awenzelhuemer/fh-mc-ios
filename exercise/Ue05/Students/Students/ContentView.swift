//
//  ContentView.swift
//  Students
//
//  Created by Andreas Wenzelhuemer on 12.01.23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isSheetPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            StudentListView()
                .navigationTitle("Students")
                        .navigationBarItems(trailing: Button("Add")  {
                                    isSheetPresented = true
                                })
                        .sheet(isPresented: $isSheetPresented) {
                            AddStudentView()
                        }
        }
            }}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
