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
    @State private var itemHasBeenSavedBefore = false
    @State private var savedItemNameStringArray: [String] = []
    var body: some View {
        ZStack {
              VStack{
                Text(productName)
                  .font(.system(size:50))
                  .fontWeight(.bold)
                  .frame(maxWidth: .infinity, alignment: .center)
                if productAllergenWarningArray.isEmpty {
                  Text("This product does not contain any allergens")
                    .font(.system(size: 30))
                    .fontWeight(.light)
                    .frame(width: 300)
                }
                else {
                  Text("This product contains: ")
                    .padding(30)
                    .foregroundColor(Color.black)
                    .font(.system(size: 30))
                    .fontWeight(.light)
                    .frame(maxWidth: .infinity, alignment: .center)
                  ForEach(productAllergenWarningArray, id: \.self) {string in
                    Text(string)
                      .padding(30)
                      .foregroundColor(Color.black)
                      .font(.system(size: 35, weight: .semibold, design: .default))
                      .fontWeight(.bold)
                      .frame(maxWidth: .infinity, alignment: .leading)
                  }
                }
                NavigationLink(destination: SearchedItemIngredientsView(productName: $productName, ingredientsList: $ingredientsList)) {
                  Text("see all ingredients")
                    .padding(5)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                }
                .buttonStyle(DefaultButtonStyle())
                Button {
                  addItemToSavedItemsList()
                  showingAlert = true
                } label: {
                  Text("Save Item")
                    .fontWeight(.semibold)
                    .font(.system(size: 20, weight: .semibold, design: .default))
                }
                .alert(isPresented: $showingAlert) {
                  //Alert(title: Text("Your allergen preferences have been updated"), dismissButton: .default(Text("OK"), action: dismiss()))
                  //allergy.isChecked ? Color(UIColor.lightGray) : Color.clear
                  Alert(title: itemHasBeenSavedBefore ? Text("This item has already been saved") : Text("This item has been saved"),
                     dismissButton: Alert.Button.default(Text("OK")
                                       //action: {
                                       //dismiss()
                                       //}
                                       //)
                                       ))
                }
              }
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

struct SearchedItemIngredientsView: View {
    @Binding var productName: String
    @Binding var ingredientsList: String
    var body: some View {
        Text(productName)
        Text(ingredientsList)
    }
}
