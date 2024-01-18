//
//  DetailViewController.swift
//  PetshionShow
//
//  Created by 이시형 on 1/18/24.
//

import UIKit

class DetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "상세정보"
        
    }
    
    override func buildInterface() {
        super.buildInterface()
        
        let detailImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "petshion1")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        let labelName: UILabel = {
            let label = UILabel()
            label.text = "  치즈 스카프"
            // label.backgroundColor = .systemGray5
            label.textAlignment = .left
            label.font = .boldSystemFont(ofSize: 30)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let labelPrice: UILabel = {
            let label = UILabel()
            label.text = "   9000원"
            // label.backgroundColor = .systemGray5
            label.textAlignment = .left
            label.font = .boldSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let purchaseStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        let purchaseButton: UIButton = {
            let button = UIButton()
            button.setTitle("구매하기", for: .normal)
            button.backgroundColor = .systemYellow
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let wishListButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(systemName: "bag"), for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
      
        purchaseStackView.addArrangedSubview(wishListButton)
        purchaseStackView.addArrangedSubview(purchaseButton)
        
        view.addSubview(detailImageView)
        view.addSubview(labelName)
        view.addSubview(labelPrice)
        view.addSubview(purchaseStackView)
        
        NSLayoutConstraint.activate([
            detailImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            detailImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            detailImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: view.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            labelName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            labelName.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 4),
            labelName.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            labelName.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            labelPrice.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            labelPrice.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 4),
            labelPrice.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            labelPrice.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            purchaseStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            purchaseStackView.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 30),
            purchaseStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            purchaseStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            wishListButton.widthAnchor.constraint(equalToConstant: 100),
            wishListButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
}
