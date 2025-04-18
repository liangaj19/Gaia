//
//  EditProfileView.swift
//  Gaia
//
//  Created by student on 12/2/22.
//

import SwiftUI
import Combine

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var allergyChecklist = [Allergy(name: "Milk", isChecked: false),  Allergy(name: "Eggs", isChecked: false),  Allergy(name: "Tree nuts", isChecked: false), Allergy(name: "Peanuts", isChecked: false), Allergy(name: "Shellfish", isChecked: false), Allergy(name: "Wheat", isChecked: false), Allergy(name: "Soy", isChecked: false), Allergy(name: "Fish", isChecked: false), Allergy(name: "Corn", isChecked: false), Allergy(name: "Alcohol", isChecked: false)]
    @State private var customAllergyInput: String = ""
    @State private var userAllergyList: [String] = []
    @State private var customAllergyList: [String] = []
    @State private var showingAlert = false
    @StateObject var avm = CoreDataAllergenViewModel()
    @State var userAllergyStringArray:[String] = []
    
    //@State var userDefaults = UserDefaults.standard
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                Text("Select your allergens")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    .padding(.leading, 40)
                    .padding(.trailing, 40)
                    .frame(maxWidth: .infinity, alignment:.center)
                    .background(Color("pearlyPurple"))
                    .foregroundColor(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                    .multilineTextAlignment(.center)
                //.ignoresSafeArea()
                
                
                List() {
                    ForEach($allergyChecklist) {$allergy in
                        HStack {
                            Text(allergy.name)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            allergy.isChecked.toggle()
                        }
                        .listRowBackground(allergy.isChecked ? Color("palePurple") : Color.clear)
                        .padding(5)
                        .font(.system(size: 20))
                    }
                }
                .listStyle(PlainListStyle())
                
                Group {
                    Rectangle()
                        .frame(height: 1.5)
                        .foregroundColor(Color("pearlyPurple"))
                    
                    Spacer()
                        .frame(height: 15)
                    
                    Text("Enter custom allergens here")
                        .font(.system(size: 20))
                        .padding(5)
                    
                    Text("Example: Bananas, Apples")
                        .font(.system(size: 15))
                    
                    TextField("Other", text: $customAllergyInput)
                        .autocapitalization(.none)
                        .padding(.all, 10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.black, lineWidth: 1.5)
                        )
                        .frame(width: 350, height: 30, alignment: .center)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Button {
                        addAllergiesToAllergyList()
                        showingAlert = true
                    } label: {
                        Text("Finish")
                    }
                    .padding(.all)
                    .foregroundColor(Color.white)
                    .frame(width: 170)
                    .background(Color("pearlyPurple"))
                    .cornerRadius(40)
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Your allergen preferences have been updated"), dismissButton: .default(Text("OK"), action: {dismiss()}))
                    }
                    Spacer()
                        .frame(height: 10)
                    Spacer()
                }
                //Spacer()
                
                
            }
            .adaptsToKeyboard()
            
            
        } // ZStack
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
        
        
    }
    
    
    func addAllergiesToAllergyList() {
        for allergy in avm.savedAllergens {
            userAllergyStringArray.append(allergy.allergenName ?? "")
        }
        for allergy in allergyChecklist {
            if allergy.isChecked && !userAllergyStringArray.contains(allergy.name){
                avm.addAllergen(allergenName: allergy.name)
            }
        }
        
        if customAllergyInput != "" {
            let customAllergyArray: [String] = customAllergyInput.components(separatedBy: ", ")
            
            for allergy in customAllergyArray {
                avm.addAllergen(allergenName: allergy)
            }
        }
    }
}

//import SwiftUI


struct AdaptsToKeyboard: ViewModifier {
    @State var currentHeight: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            //EditProfileView()
            content
                .padding(.bottom, self.currentHeight)
                .onAppear(perform: {
                    NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillShowNotification)
                        .merge(with: NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillChangeFrameNotification))
                        .compactMap { notification in
                            withAnimation(.easeOut(duration: 0.16)) {
                                notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
                            }
                        }
                        .map { rect in
                            rect.height - geometry.safeAreaInsets.bottom
                        }
                        .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                    
                    NotificationCenter.Publisher(center: NotificationCenter.default, name: UIResponder.keyboardWillHideNotification)
                        .compactMap { notification in
                            CGFloat.zero
                        }
                        .subscribe(Subscribers.Assign(object: self, keyPath: \.currentHeight))
                })
        }
    }
}

extension View {
    func adaptsToKeyboard() -> some View {
        return modifier(AdaptsToKeyboard())
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
