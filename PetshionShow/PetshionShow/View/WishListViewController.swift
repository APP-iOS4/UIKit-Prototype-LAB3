//
//  WishListViewController.swift
//  PetshionShow
//
//  Created by 최주리 on 2024/01/17.
//

import UIKit

class WishListViewController: BaseViewController {
    
    // 메인레이블
    let labelMain: UILabel = {
        let label = UILabel()
        label.text = "장바구니"
        // label.backgroundColor = .systemGray5
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func buildInterface() {
        super.buildInterface()
        
        buildAddView()
        buildAutoLayout()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 700)
                
    }
    
    func buildAddView() {
        view.addSubview(labelMain)
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    func buildAutoLayout() {
        // 메인 레이블 레이아웃
        NSLayoutConstraint.activate([
            labelMain.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            labelMain.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            labelMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelMain.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // 스크롤 뷰 레이아웃
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: labelMain.bottomAnchor, constant: 4),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
    }
    
}
