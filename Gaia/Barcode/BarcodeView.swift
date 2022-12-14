import SwiftUI
import VisionKit

struct BarcodeView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @EnvironmentObject var vm: AppViewModel
    @StateObject var avm = CoreDataAllergenViewModel()
    @State var upcNumber: String = ""
    @State var userAllergyStringArray: [String] = []
    @State var productAllergenWarningArray: [String] = []
    
    var body: some View {
        switch vm.dataScannerAccessStatus {
        case .scannerAvailable:
            mainView
        case .cameraNotAvailable:
            Text("Device Does Not Have A Camera")
        case .scannerNotAvailable:
            Text("Device Is Not Supported For Scanning Barcode With This App")
        case .cameraAccessNotGranted:
            Text("Camera Access Previously Denied, Please Vist Camera Setting To Provide Access")
        case .notDetermined:
            Text("Requesting Camera Access")
        }
    }
    
    private var mainView: some View {
        NavigationStack {
            DataScannerView(
                recognizedItems: $vm.recognizedItems,
                recognizedDataType: vm.recognizedDataType,
                recognizesMultipleItems: vm.recognizesMultipleItems)
            .background { Color.gray.opacity(0.3) } // darkness background to give contrast when barcode is available
            .ignoresSafeArea()
            .id(vm.dataScannerViewId)
            //.sheet(isPresented: .constant(true)) { // dark space under to show information
                bottomContainerView
                    .background(.ultraThinMaterial)
                    .presentationDetents([.medium, .fraction(0.25)])
                    .presentationDragIndicator(.visible)
                    .interactiveDismissDisabled()
                    .onAppear {
                        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                              let controller = windowScene.windows.first?.rootViewController?.presentedViewController else {
                            return
                        }
                        controller.view.backgroundColor = .clear
                    }
            //}
            //.onChange(of: vm.scanType) { _ in vm.recognizedItems = [] }
            //.onChange(of: vm.textContentType) { _ in vm.recognizedItems = [] }
        .onChange(of: vm.recognizesMultipleItems) { _ in vm.recognizedItems = []}
        }
    }
    
    private var headerView: some View {
        VStack {
            /*HStack {
                Picker("Scan Type", selection: $vm.scanType) {
                    Text("Barcode").tag(ScanType.barcode)
                }.pickerStyle(.segmented)
                
                Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
            }.padding(.top)*/
            
            Text(vm.headerText).padding(.top)
        }.padding(.horizontal)
    }
    
    private var bottomContainerView: some View {
        NavigationStack {
            VStack {
                headerView
                ScrollView {
                    LazyVStack(alignment: .center, spacing: 16) {
                        ForEach(vm.recognizedItems) { item in
                            switch item {
                            case .barcode(let barcode):
                                NavigationLink(destination: SearchedItemView(productAllergenWarningArray: $productAllergenWarningArray, ingredientsList: $networkManager.foodProduct.ingredients_text, productName: $networkManager.foodProduct.product_name, upcNumber: $networkManager.foodProduct.code, imageURL: $networkManager.foodProduct.image_url)) {
                                    Text("Search Item")
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .font(.system(size: 30))
                                }
                                .onAppear {
                                    networkManager.fetchData(upcNumber: barcode.payloadStringValue ?? "")
                                }
                                .buttonStyle(DefaultButtonStyle())
                                .padding(.all)
                                .foregroundColor(Color.white)
                                .frame(width: 300)
                                .background(Color("pearlyPurple"))
                                .cornerRadius(40)
                                
                                //if let barcodeInput = barcode.payloadStringValue {
                                    //upcNumber = barcodeInput
                                //}
                                
                            case .text(let text):
                                Text(text.transcript)
                                
                            @unknown default:
                                Text("Unknown")
                            }
                        }
                    }
                    .padding()
                }
            }
            .onReceive(networkManager.$foodProduct) { foodProduct in
                checkIngredients(ingredientsList: foodProduct.ingredients_text, ingredientsAllergensList: foodProduct.allergens_from_ingredients)
            }
        }
        
        // no function
        .onAppear {
            avm.fetchAllergen()
        }
    }
    
    func checkIngredients(ingredientsList: String, ingredientsAllergensList: String) {
        
        userAllergyStringArray = []
        productAllergenWarningArray = []
        
        for allergy in avm.savedAllergens {
            
            userAllergyStringArray.append(allergy.allergenName ?? "")
        }

        // check default allergies
        for allergy in userAllergyStringArray {
            if (ingredientsList.lowercased().contains(allergy.lowercased()) || ingredientsAllergensList.lowercased().contains(allergy.lowercased())) && !productAllergenWarningArray.contains(allergy)  {
                productAllergenWarningArray.append(allergy)
            }
        }
        // check custom allergies
    }
}




 /*struct FoodAllergyView_Previews: PreviewProvider {
     static var previews: some View {
         BarcodeView()
     }
 }
 */
