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
    
    
    // 컬렉션뷰
    let collectionView: UICollectionView = {
        // 컬렉션 뷰의 레이아웃을 담당하는 객체(필수)
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setCollectionView() {
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    // 이미지 뷰
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
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
        setCollectionView()
    }
    
    override func buildInterface() {
        super.buildInterface()
        
        buildAddView()
        buildAutoLayout()
        scrollView.contentSize = CGSize(width: view.frame.width, height: 700)
                
    }
    
    func buildAddView() {
        view.addSubview(collectionView)
    }
    
    func buildAutoLayout() {
 
       
        // 컬렉션 뷰 레이아웃
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
        
        
       
        
    }
    
    @objc func pressProduct() {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    
}


extension WishListViewController: UICollectionViewDelegateFlowLayout {
    // 셀의 크기 정하기
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 원하는 아이템 크기를 CGSize 형태로 반환
        // EdgeInset * 2를 빼고 원하는 줄 갯수만큼 나눈다
        // (collectionView.frame.width - EdgeInset * 2) / 원하는 줄 개수
        let cellWidth = collectionView.frame.width / 3
        let cellHeight = cellWidth + 50
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // 셀 사이의 간격
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    // 셀과 뷰의 간격
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    // 셀이 눌렸을 때
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension WishListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.backgroundColor = .brown
        
        cell.productImage.image = products[indexPath.row].image
        cell.nameLabel.text = products[indexPath.row].name
        cell.priceLabel.text = "\(products[indexPath.row].price)"
        
        
        return cell
    }
    
}


