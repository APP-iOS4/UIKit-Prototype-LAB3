//
//  RecommendViewController.swift
//  PetshionShow
//
//  Created by 최정인 on 1/17/24.
//

import UIKit

class RecommendViewController: BaseViewController {
    
    let contentWidth: Int = 1025
    let contentHeight: Int = 170
    
    // 스크롤 뷰
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // 전체 스택 뷰
    let wholeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    // 메인 이미지 뷰
    lazy var recommandMain: UIImageView = {
        
        let image = UIImage(named: "petshion1")
        let resizedImage = image?.resized(to: CGSize(width: view.frame.width, height: view.frame.width))
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = resizedImage
        return imageView
    }()
    
    // 특가 label
    let specialLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = " 오늘의 특가           08:28:00"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        return label
    }()
    
    // 요즘같이 추운 날 label
    let winterLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = " 요즘같이 추운 날"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .left
        return label
    }()
    
    // 고양이 집사 주목 label
    let catLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = " 고양이 집사 주목!"
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .left
        return label
    }()
    
    
    
    
    // 컬렉션뷰1
    let collectionView1: UICollectionView = {
        // 컬렉션 뷰의 레이아웃을 담당하는 객체(필수)
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        //cv.backgroundColor = .blue
        return cv
    }()
    
    // 컬렉션뷰2
    let collectionView2: UICollectionView = {
        // 컬렉션 뷰의 레이아웃을 담당하는 객체(필수)
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        //cv.backgroundColor = .blue
        return cv
    }()
    
    // 컬렉션뷰3
    let collectionView3: UICollectionView = {
        // 컬렉션 뷰의 레이아웃을 담당하는 객체(필수)
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        //cv.backgroundColor = .blue
        return cv
    }()
    
    func setCollectionView() {
        collectionView1.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView1.dataSource = self
        collectionView1.delegate = self
        
        collectionView2.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView2.dataSource = self
        collectionView2.delegate = self
        
        collectionView3.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCollectionViewCell")
        collectionView3.dataSource = self
        collectionView3.delegate = self
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "추천"
        buildInterface()
        
        buildAddView()
        setCollectionView()
        buildAutoLayout()
        
        
    }
    
    func buildAddView() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(wholeStackView)
        wholeStackView.addArrangedSubview(recommandMain)
        
        wholeStackView.addArrangedSubview(specialLabel)
        wholeStackView.addArrangedSubview(collectionView1)
        
        wholeStackView.addArrangedSubview(winterLabel)
        wholeStackView.addArrangedSubview(collectionView2)
        
        wholeStackView.addArrangedSubview(catLabel)
        wholeStackView.addArrangedSubview(collectionView3)
        
        
    }
    
    func buildAutoLayout() {
        // 스크롤 뷰 레이아웃
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            wholeStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
            wholeStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            wholeStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
            wholeStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
        ])
        
        // 이미지 뷰 레이아웃
        //        NSLayoutConstraint.activate([
        //            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0),
        //            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
        //            imageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0),
        //            imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
        //        ])
        
        // 컬렉션 뷰 레이아웃
        NSLayoutConstraint.activate([
            collectionView1.heightAnchor.constraint(equalToConstant: 170),
            collectionView2.heightAnchor.constraint(equalToConstant: 380),
            collectionView3.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    override func buildInterface() {
        
        let mainButton = UIButton()
        mainButton.backgroundColor = .clear
        
        //        button.alpha = 0.35
        mainButton.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        mainButton.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        wholeStackView.addSubview(mainButton)
        
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        //        let button = UIButton()
        //        button.backgroundColor = .clear
        //        //        button.alpha = 0.35
        //        button.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        //        button.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        
        
        
    }
    
    @objc func pressProduct() {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}

extension RecommendViewController: UICollectionViewDelegateFlowLayout {
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
        return UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
    }
    
    // 셀이 눌렸을 때
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension RecommendViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        cell.productImage.image = products[indexPath.row].image
        
        cell.nameLabel.text = "  \(products[indexPath.row].name)"
        cell.priceLabel.text = "  \(products[indexPath.row].price)원"
        
        //cell.backgroundColor = .red
        
        return cell
    }
}


extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
