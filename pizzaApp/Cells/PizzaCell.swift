import UIKit

class PizzaCell: UICollectionViewCell {
    let imagePizza: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let namePizza: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let secondText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let customButton: UIButton = {
        let button = UIButton()
        button.setTitle("от 345 р", for: .normal)
        button.setTitleColor(.systemPink, for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemPink.cgColor
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super .init(frame: frame)
        setSubviews()
        makeConstraints()
    }
    func setSubviews() {
        contentView.addSubview(imagePizza)
        contentView.addSubview(namePizza)
        contentView.addSubview(secondText)
        contentView.addSubview(customButton)
    }
    func makeConstraints() {
        NSLayoutConstraint.activate([
            imagePizza.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imagePizza.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imagePizza.heightAnchor.constraint(equalToConstant: 134),
            imagePizza.widthAnchor.constraint(equalToConstant: 134)
        ])
        NSLayoutConstraint.activate([
            namePizza.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            namePizza.leadingAnchor.constraint(equalTo: imagePizza.trailingAnchor, constant: 32)
        ])
        NSLayoutConstraint.activate([
            secondText.topAnchor.constraint(equalTo: namePizza.bottomAnchor, constant: 10),
            secondText.leadingAnchor.constraint(equalTo: namePizza.leadingAnchor)
        ])
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: secondText.bottomAnchor, constant: 8),
            customButton.leadingAnchor.constraint(equalTo: secondText.leadingAnchor, constant: 90),
            customButton.heightAnchor.constraint(equalToConstant: 40),
            customButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
