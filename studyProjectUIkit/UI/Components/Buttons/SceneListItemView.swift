import UIKit

protocol SceneListItemViewDelegate: AnyObject {
    func sceneListItemDidTap(_ view: SceneListItemView)
}

class SceneListItemView: UIView {
    
    // MARK: - Public Properties
    
    weak var delegate: SceneListItemViewDelegate?
    var sceneIndex: Int = 0
    
    // MARK: - Private Properties
    
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isUserInteractionEnabled = false
        return stackView
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemBlue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with title: String, icon: UIImage? = nil) {
        titleLabel.text = title
        iconImageView.image = icon ?? UIImage(systemName: "circle.fill")
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        addSubview(button)
        button.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(titleLabel)
        contentStackView.addArrangedSubview(chevronImageView)
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Констрейнты для кнопки
            button.topAnchor.constraint(equalTo: topAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            // Констрейнты для contentStackView
            contentStackView.topAnchor.constraint(equalTo: button.topAnchor, constant: 12),
            contentStackView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: -12),
            
            // Констрейнты для иконки
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            // Констрейнты для шеврона
            chevronImageView.widthAnchor.constraint(equalToConstant: 24),
            chevronImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped() {
        delegate?.sceneListItemDidTap(self)
    }
} 
