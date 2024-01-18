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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "추천"
        buildInterface()
    }
    
    override func buildInterface() {
        
        // MARK: - ScrollView
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1400)
        
        
        // MARK: - 전체 Stack View
        let wholeStackView = UIStackView()
        wholeStackView.axis = .vertical
        wholeStackView.spacing = 10
        
        wholeStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(wholeStackView)
        
        
        // MARK: - 추천 상품
        let image = UIImage(named: "petshion1")
        let resizedImage = image?.resized(to: CGSize(width: view.frame.width, height: view.frame.width))
        
        let recommandMain: UIImageView = UIImageView(image: resizedImage)
        recommandMain.contentMode = .scaleAspectFit
        wholeStackView.addArrangedSubview(recommandMain)
        
        let mainButton = UIButton()
        mainButton.backgroundColor = .clear
        
//        button.alpha = 0.35
        mainButton.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        mainButton.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        wholeStackView.addSubview(mainButton)
        
        // MARK: - 오늘의 특가
        let specialLabel: UILabel = {
            let label: UILabel = UILabel()
            label.text = " 오늘의 특가           08:28:00"
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            label.textAlignment = .center
            return label
        }()
        wholeStackView.addArrangedSubview(specialLabel)
        
        let miniScrollView = UIScrollView()
        miniScrollView.backgroundColor = .clear
        miniScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        miniScrollView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.width), height: contentHeight)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "specialImage")
        imageView.frame = CGRect(x: 0, y: 0, width:contentWidth, height: contentHeight)
        miniScrollView.addSubview(imageView)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let button = UIButton()
        button.backgroundColor = .clear
//        button.alpha = 0.35
        button.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight)
        button.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        miniScrollView.addSubview(button)
        
        miniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            miniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            miniScrollView.heightAnchor.constraint(equalToConstant: CGFloat(contentHeight))
        ])
        
        wholeStackView.addArrangedSubview(miniScrollView)
        
        
        // MARK: - 요즘같이 추운 날
        let winterLabel: UILabel = {
            let label: UILabel = UILabel()
            label.text = " 요즘같이 추운 날"
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            label.textAlignment = .left
            return label
        }()
        wholeStackView.addArrangedSubview(winterLabel)
        
        let winterMiniScrollView = UIScrollView()
        winterMiniScrollView.backgroundColor = .clear
        winterMiniScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight * 2)
        winterMiniScrollView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.width), height: contentHeight * 2)
        
        let winterImageView = UIImageView()
        winterImageView.image = UIImage(named: "forWinter")
        winterImageView.frame = CGRect(x: 0, y: 0, width:contentWidth, height: contentHeight * 2)
        winterMiniScrollView.addSubview(winterImageView)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let winterButton = UIButton()
        winterButton.backgroundColor = .clear
//        button.alpha = 0.35
        winterButton.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight * 2)
        winterButton.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        winterMiniScrollView.addSubview(winterButton)
        
        winterMiniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            winterMiniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            winterMiniScrollView.heightAnchor.constraint(equalToConstant: CGFloat(contentHeight * 2))
        ])
        
        wholeStackView.addArrangedSubview(winterMiniScrollView)
        
        
        // MARK: - 고양이 집사 주목
        let catLabel: UILabel = {
            let label: UILabel = UILabel()
            label.text = " 고양이 집사 주목!"
            label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
            label.textAlignment = .left
            return label
        }()
        wholeStackView.addArrangedSubview(catLabel)
        
        let catMiniScrollView = UIScrollView()
        catMiniScrollView.backgroundColor = .clear
        catMiniScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight * 2)
        catMiniScrollView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.width), height: contentHeight * 2)
        
        let catImageView = UIImageView()
        catImageView.image = UIImage(named: "catImage")
        catImageView.frame = CGRect(x: 0, y: 0, width:contentWidth, height: contentHeight * 2)
        catMiniScrollView.addSubview(catImageView)
        
        // 이미지 위에 덧씌워질 가상의 투명한 버튼
        let catButton = UIButton()
        catButton.backgroundColor = .clear
//        button.alpha = 0.35
        catButton.frame = CGRect(x: 0, y: 0, width: contentWidth, height: contentHeight * 2)
        catButton.addTarget(self, action: #selector(pressProduct), for: .touchUpInside)
        catMiniScrollView.addSubview(catButton)
        
        catMiniScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            catMiniScrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            catMiniScrollView.heightAnchor.constraint(equalToConstant: CGFloat(contentHeight * 2))
        ])
        
        wholeStackView.addArrangedSubview(catMiniScrollView)
        
    }
    
    @objc func pressProduct() {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }

}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
