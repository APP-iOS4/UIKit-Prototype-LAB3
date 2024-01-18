//
//  WishListViewController.swift
//  PetshionShow
//
//  Created by 최주리 on 2024/01/17.
//

import UIKit

class WishListViewController: BaseViewController {

    // 스크롤 뷰
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1000)
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 이미지 뷰
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        //            imageView.image = UIImage(named: "wishList")
        imageView.image = UIImage(named: "wishList")!.resized(to: CGSize(width: view.frame.width, height: 500))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var productButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width:view.frame.width, height: 500)
        button.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "장바구니"
    }
    
    override func buildInterface() {
        super.buildInterface()
        
        buildAddView()
        buildAutoLayout()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 700)
                
    }
    
    func buildAddView() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(productButton)
        
    }
    
    func buildAutoLayout() {
 
       
        // 스크롤 뷰 레이아웃
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        // 버튼 뷰
       
        
    }
    
    @objc func pressProduct() {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
