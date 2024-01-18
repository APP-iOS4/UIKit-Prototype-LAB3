//
//  Product.swift
//  PetshionShow
//
//  Created by 최정인 on 1/17/24.
//

import Foundation
import UIKit

enum ProductType: String {
    case clothes = "옷"
    case accessories = "엑세서리"
    case etc = "기타"
}

enum ClothesType: String {
    case raincoat = "레인코트"
}

struct Product {
    var name: String = "강아지스카프"                                         // 상품명
    var price: Int = 19000                                                  // 가격
    var image: UIImage                                                      // 상품 이미지
    var url: String = "https://www.musinsa.com/app/goods/1728585"            // 구매 링크
    var productType: ProductType = .clothes
}


let products: [Product] = [
    Product(image: UIImage(named: "petshion1")!),
    Product(image: UIImage(named: "petshion2")!),
    Product(image: UIImage(named: "petshion3")!),
    Product(image: UIImage(named: "petshion4")!),
    Product(image: UIImage(named: "petshion5")!),
    Product(image: UIImage(named: "petshion6")!),
]
