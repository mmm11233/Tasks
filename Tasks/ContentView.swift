//
//  ContentView.swift
//  Tasks
//
//  Created by Mariam Joglidze on 08.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var allTasksCompleted = false
    
    @State private var tasks = [
        Task(name: "Mobile App Research", imageName: "Date", date: "4 Oct", isCompleted: true),
        Task(name: "Prepare Wireframe for Main Flow", imageName: "Date", date: "4 Oct", isCompleted: true),
        Task(name: "Prepare Screens", imageName: "Date", date: "4 Oct", isCompleted: true),
        Task(name: "Website Research", imageName: "Date", date: "5 Oct", isCompleted: false),
        Task(name: "Prepare Wireframe for Main Flow", imageName: "Date", date: "5 Oct", isCompleted: false),
        Task(name: "Prepare Screens", imageName: "Date", date: "5 Oct", isCompleted: false)
    ]
    
    var body: some View {
        VStack {
            VStack {
                
                HStack {
                    Text("You have 3 tasks to complete")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing, 10)
                }
                .padding(.horizontal)
                
                Button(action: {
                    tasks.indices.forEach { index in
                        tasks[index].isCompleted = true
                    }
                    
                    allTasksCompleted = true
                }) {
                    HStack {
                        Text("Complete All")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding(.top, 20)
                .disabled(allTasksCompleted)
            }
            .cornerRadius(10)
            .padding()
            
            Text("Progress")
                .padding(.trailing, 250)
                .font(.title3)
            
            VStack {
                Text("Daily Task")
                    .foregroundColor(.black)
                    .padding(.trailing, 250)
                    .font(.callout)
                
                Text("3/6 Task Completed")
                    .foregroundColor(.black)
                    .padding(.trailing, 200)
                    .font(.footnote)
                
                Text("Keep working")
                    .foregroundColor(.black)
                    .padding(.trailing, 250)
                    .font(.caption2)
            }
            .padding(.top, 5)
            .padding(.horizontal)
            
            ProgressView(value: 0.5)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            
        }
        .background(Color.white)
        .cornerRadius(15)
        .padding()
        
        Text("Completed Tasks")
            .font(.title3)
            .padding(.trailing, 180)
            .padding(.top, 2)
        
        Spacer()
        
        CompletedTaskUIView(tasks: tasks)
    }
}


struct Task: Identifiable {
    let id = UUID()
    let name: String
    var imageName: String
    let date: String
    var isCompleted: Bool
    
    var mark: String {
        return isCompleted ? "mark" : "Unmarked"
    }
}


struct CompletedTaskUIView: View {
    
    @State var tasks = [
        Task(name: "Mobile App Research", imageName: "Date", date: "4 Oct", isCompleted: true),
        Task(name: "Prepare Wireframe for Main Flow", imageName: "Date", date: "4 Oct", isCompleted: true),
        Task(name: "Prepare Screens", imageName: "Date", date: "4 Oct", isCompleted: true),
        Task(name: "Website Research", imageName: "Date", date: "5 Oct", isCompleted: false),
        Task(name: "Prepare Wireframe for Main Flow", imageName: "Date", date: "5 Oct", isCompleted: false),
        Task(name: "Prepare Screens", imageName: "Date", date: "5 Oct", isCompleted: false)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List(tasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.name)
                            .font(.headline)
                        
                        HStack {
                            Button(action: {
                                if let index = tasks.firstIndex(where: { $0.id == task.id }) {
                                    tasks[index].isCompleted.toggle()
                                }
                            }) {
                                Image(task.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                    .clipShape(Circle())
                                    .background(Color.gray)
                            }
                            
                            Text(task.date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        HStack {
                            Spacer()
                            Image(task.mark)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                        }
                    }
                    .padding(2)
                }
            }
        }
    }
}




#Preview {
    ContentView()
}
