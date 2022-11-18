//
//  AllergyListViewModel.swift
//  Gaia
//
//  Created by Geovanni Tinoco on 10/24/22.
//

import Foundation
// 1
import Combine

// 2
class AllergyListViewModel: ObservableObject {
  // 3
  @Published var foodAllergyRepository = FoodAllergyRepository()

  // 4
  func add(_ allergy: Food) {
      foodAllergyRepository.add(allergy)
  }
}

