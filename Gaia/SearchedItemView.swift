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
    var body: some View {
        Text(productName)
            .font(.system(size: 40))
            .frame(maxWidth: .infinity, alignment: .leading)
        if productAllergenWarningArray.isEmpty {
            Text("This product does not contain any allergens")
        }
        else {
            Text("This product contains: ")
                .padding(3)
                .foregroundColor(Color.black)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(productAllergenWarningArray, id: \.self) {string in
                Text(string)
                    .padding(3)
                    .foregroundColor(Color.black)
                    .font(.system(size: 30, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        NavigationLink(destination: SearchedItemIngredientsView(productName: $productName, ingredientsList: $ingredientsList)) {
            Text("see all ingredients")
        }
        .buttonStyle(DefaultButtonStyle())
        Button {
            addItemToSavedItemsList()
            showingAlert = true
        } label: {
            Text("Save Item")
        }
        .alert(isPresented: $showingAlert) {
            //Alert(title: Text("Your allergen preferences have been updated"), dismissButton: .default(Text("OK"), action: dismiss()))
            Alert(title: Text("This item has been saved"),
                  dismissButton: Alert.Button.default(Text("OK")
                  //action: {
                    //dismiss()
                  //}
                  //)
            ))
        }

        
    }
    
    func addItemToSavedItemsList() {
        sivm.addItem(productName: productName, ingredients: ingredientsList)
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
