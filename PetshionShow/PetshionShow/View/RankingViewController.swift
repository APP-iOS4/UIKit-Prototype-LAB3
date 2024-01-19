//
//  RankingViewController.swift
//  PetshionShow
//
//  Created by Kang on 1/17/24.
//

import UIKit

class RankingViewController: BaseViewController {
    
    var imageOt = UIImage(named: "otContents")
    var imageAc = UIImage(named: "acContents")
    var imageYongpum = UIImage(named: "yongpumContents")
    
    var myProducts: [Product] = products
    
    // 세그먼트
    let segment: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "옷", at: 0, animated: true)
        segment.insertSegment(withTitle: "액세서리", at: 1, animated: true)
        segment.insertSegment(withTitle: "그 외", at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment
    }()
    
    // 스크롤 뷰
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 이미지 뷰
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemGray5
        imageView.image = UIImage(named: "otContents")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "랭킹"
        
    }
    
    override func buildInterface() {
        buildAddView()
        buildAutoLayout()
        setCollectionView()
    }
    
    
    func buildAddView() {
        view.addSubview(segment)
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        view.addSubview(collectionView)
    }
    
    func buildAutoLayout() {
        // 세그먼트 레이아웃
        NSLayoutConstraint.activate([
            segment.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            segment.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            segment.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        
            segment.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // 스크롤 뷰 레이아웃
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 4),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            scrollView.heightAnchor.constraint(equalToConstant: 68.5)
        ])
        
        // 이미지 뷰 레이아웃
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
        ])
        
        // 컬렉션 뷰 레이아웃
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    func setCollectionView() {
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    @objc func segmentChanged(_ segemnt: UISegmentedControl) {
        switch segemnt.selectedSegmentIndex {
        case 0:
            myProducts = products
            collectionView.reloadData()
            
            imageView.image = UIImage(named: "otContents")
        case 1:
            for index in 0...products.count - 1 {
                myProducts[index] = products.randomElement()!
            }
            collectionView.reloadData()
            
            imageView.image = UIImage(named: "acContents")
        case 2:
            for index in 0...products.count - 1 {
                myProducts[index] = products.randomElement()!
            }
            collectionView.reloadData()
            
            imageView.image = UIImage(named: "yongpumContents")
        default:
            break
        }
    }
}

extension RankingViewController: UICollectionViewDelegateFlowLayout {
    // 셀의 크기 정하기
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 원하는 아이템 크기를 CGSize 형태로 반환
        // EdgeInset * 2를 빼고 원하는 줄 갯수만큼 나눈다
        // (collectionView.frame.width - (EdgeInset * 2) - ((줄 개수 - 1) * 원하는 간격)) / 원하는 줄 개수
        let cellWidth = (collectionView.frame.width - 20 - 20) / 3
        let cellHeight = cellWidth + 50
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    // 셀 사이의 간격
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
    // 셀과 뷰의 간격
    func collectionView( _ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    // 셀이 눌렸을 때
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension RankingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        // cell.productImage.image = products[indexPath.row].image
        cell.productImage.image = myProducts[indexPath.row].image
        cell.nameLabel.text = "  \(products[indexPath.row].name)"
        cell.priceLabel.text = "  \(products[indexPath.row].price)원"
        
        return cell
    }
}
