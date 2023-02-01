//
//  ContentView.swift
//  GuessNumber
//
//  Created by Pavla Beránková on 01.02.2023.
//


import SwiftUI

struct Menu: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.orange)
                Text("MAIN MENU")
                    .font(.largeTitle)
                    .foregroundColor(.black).bold()
            }
            .ignoresSafeArea()
        }
        .navigationTitle("Main menu")
        
    }
}

struct ContentView: View {
    @State private var isSheetVisible = false
    @State private var userNumber: Int = 0
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
                .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
                           center: .top, startRadius: 200, endRadius: 600)
            .ignoresSafeArea()
            VStack {
                Button("Show sheet") {
                    isSheetVisible.toggle()
                }
                .sheet(isPresented: $isSheetVisible, onDismiss: didDismiss) {
                    
                    ZStack {
                        RadialGradient(stops: [
                            .init(color: Color(red: 0.2, green: 0.0, blue: 0.2), location: 0.3),
                            .init(color: Color(red: 0.3, green: 0.0, blue: 0.3), location: 0.3)],
                                       center: .top, startRadius: 200, endRadius: 600)
                        .ignoresSafeArea()
                        VStack {
                            VStack {
                                // MARK: User input
                                TextField("1~100",value: $userNumber, format: .number)
                                    .frame(width: 80, height: 40)
                                    .padding()
                                    .background(.regularMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .font(.title)
                                //                                    .focused($isInputActive)
                                    .shadow(radius: 5)
                                    .toolbar {
                                        ToolbarItemGroup(placement: .keyboard) {
                                            Spacer()
                                            
                                            
                                        }
                                    }
                            }
                            .keyboardType(.decimalPad)
                            Button("Show alert") {
                                showAlert = true
                            }
                            .alert("This is alert", isPresented: $showAlert) {
                                Button("Continue", role: .none) { }
                            } message: {
                                Text("Try again!")
                            }
                            
                            
                            Button("Dismiss",
                                   action: { isSheetVisible.toggle() })
                            .padding(10)
                            .presentationDetents([.large])
                        }
                        Spacer()
                    }
                    .ignoresSafeArea()
                }
                
                .padding()
                .ignoresSafeArea()
            }
            
        }
      
    }
    
}

func didDismiss() {
    
}




//struct showMenu: View {
//    var body: some View {
//        VStack {
//            Button("Play again", action: { $isSheetVisible.toggle() })
//            Button("Exit") { }
//        }
//    }
//
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
