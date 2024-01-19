//
//  DetailViewController.swift
//  PetshionShow
//
//  Created by 이시형 on 1/18/24.
//

import UIKit
import SafariServices

class DetailViewController: BaseViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1400)
        return scrollView
    }()
    
    let wholeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "petshion1")?.resized(to: CGSize(width: view.frame.width, height: view.frame.width))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "detail")
        imageView.contentMode = .scaleAspectFit
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
    
    lazy var purchaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("구매하기", for: .normal)
        button.backgroundColor = .systemYellow
        button.addTarget(self, action: #selector(pressPurchase), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var wishListButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bag"), for: .normal)
        button.addTarget(self, action: #selector(pressBag), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "상세정보"
        
    }
    
    override func buildInterface() {
        super.buildInterface()
        
        purchaseStackView.addArrangedSubview(wishListButton)
        purchaseStackView.addArrangedSubview(purchaseButton)
        
        wholeStackView.addArrangedSubview(productImageView)
        wholeStackView.addArrangedSubview(labelName)
        wholeStackView.addArrangedSubview(labelPrice)
        wholeStackView.addArrangedSubview(detailImageView)
        
        view.addSubview(scrollView)
        scrollView.addSubview(wholeStackView)
        
        view.addSubview(purchaseStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: purchaseStackView.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            purchaseStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            purchaseStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 4),
            purchaseStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            purchaseStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            wishListButton.widthAnchor.constraint(equalToConstant: 100),
            wishListButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
    }
    
    @objc func pressPurchase() {
        guard let url = URL(string: "https://www.musinsa.com/app/goods/1728585") else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    @objc func pressBag() {
        if wishListButton.currentImage == UIImage(systemName: "bag") {
            wishListButton.setImage(UIImage(systemName: "bag.fill"), for: .normal)
        }
        else if wishListButton.currentImage == UIImage(systemName: "bag.fill") {
            wishListButton.setImage(UIImage(systemName: "bag"), for: .normal)
        }
        
    }
}
