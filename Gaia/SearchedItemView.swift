import SwiftUI

struct SearchedItemView: View {
    //@Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    @StateObject var sivm = CoreDataSavedItemViewModel()
    @StateObject var avm = CoreDataAllergenViewModel()
    
    //@State var userDefaults = UserDefaults.standard
    @State private var showingAlert = false
    @Binding var productAllergenWarningArray: [String]
    @Binding var ingredientsList: String
    @Binding var productName: String
    @Binding var upcNumber: String
    @Binding var imageURL: String
    @State private var itemHasBeenSavedBefore = false
    @State private var savedItemNameStringArray: [String] = []
    
    var body: some View {
        ScrollView {
            VStack {
                    
                Text(productName)
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .fontWeight(.bold)
                    .padding(.top, 100)
                    .padding(.bottom, 40)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .frame(maxWidth: .infinity, alignment:.center)
                    .background(Color("pearlyPurple"))
                    .foregroundColor(Color.white)
                    .mask(RoundedRectangle(cornerRadius: 30))
                AsyncImage(url: URL(string: imageURL))
                    .scaledToFit()
                if productAllergenWarningArray.isEmpty {
                    Text("This product does not contain any allergens")
                        .font(.system(size: 30))
                        //.fontWeight(.light)
                        .frame(width: 300)
                }
                else {
                    Text("This product contains: ")
                        .padding(30)
                        .foregroundColor(Color.black)
                        .font(.system(size: 30))
                        //.fontWeight(.light)
                        .frame(maxWidth: .infinity, alignment: .center)
                    ForEach(productAllergenWarningArray, id: \.self) {string in
                        Text(string)
                            //.padding(.bottom, 10)
                            .foregroundColor(Color.black)
                            .font(.system(size: 45, weight: .semibold, design: .default))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
                Spacer()
                NavigationLink(destination: SearchedItemIngredientView(productName: $productName, ingredientsList: $ingredientsList)) {
                    Text("See all ingredients")
                        .padding(5)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                }
                .buttonStyle(DefaultButtonStyle())
                
                Spacer()
                    .frame(height: 20)
                Button {
                    addItemToSavedItemsList()
                    showingAlert = true
                } label: {
                    Text("Save Item")
                        .fontWeight(.semibold)
                        .font(.system(size: 20, weight: .semibold, design: .default))
                } // label: button
                .alert(isPresented: $showingAlert) {
                    //Alert(title: Text("Your allergen preferences have been updated"), dismissButton: .default(Text("OK"), action: dismiss()))
                    
                    //allergy.isChecked ? Color(UIColor.lightGray) : Color.clear
                    
                    Alert(title: itemHasBeenSavedBefore ? Text("This item has already been saved") : Text("This item has been saved"),
                          dismissButton: Alert.Button.default(Text("OK")))
                } //.alert
                Spacer()
                    .frame(height: 30)
            } // VStack
        }
        .ignoresSafeArea()
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            avm.fetchAllergen()
        }
        
        
        
    }
    
    func addItemToSavedItemsList() {
        for savedItem in sivm.savedItems {
            savedItemNameStringArray.append(savedItem.productName ?? "")
        }
        
        if !savedItemNameStringArray.contains(productName){
            sivm.addItem(productName: productName, ingredients: ingredientsList)
        }
        else {
            itemHasBeenSavedBefore.toggle()
        }
        
    }
}
