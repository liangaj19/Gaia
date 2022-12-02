//
//  FoodAllergyRepository.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

// 1
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

// 2
class FoodAllergyRepository: ObservableObject {
  // 3
  private let path: String = "allergy"
  // 4
  private let store = Firestore.firestore()

  // 5
  func add(_ allergy: OldFood) {
    do {
      // 6
      _ = try store.collection(path).addDocument(from: allergy)
    } catch {
      fatalError("Unable to add card: \(error.localizedDescription).")
    }
  }
}
