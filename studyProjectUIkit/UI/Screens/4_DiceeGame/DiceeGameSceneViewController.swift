import UIKit

class DiceeGameSceneViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let diceesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let leftDiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceTwo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightDiceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceFive")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.4588235294, blue: 0.8901960784, alpha: 1)
        button.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.setTitle("Roll", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func setupActions() {
        rollButton.addTarget(self, action: #selector(rollDice), for: .touchUpInside)
    }
    
    @objc private func rollDice() {
        let diceArray = [UIImage(named: "DiceOne"), UIImage(named: "DiceTwo"), UIImage(named: "DiceThree"), UIImage(named: "DiceFour"), UIImage(named: "DiceFive"), UIImage(named: "DiceSix")]
        leftDiceImageView.image = diceArray[Int.random(in: 0...5)]
        rightDiceImageView.image = diceArray[Int.random(in: 0...5)]
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "§4 Dicee game"
        
        view.addSubview(contentView)
        contentView.addSubview(backgroundImageView)
        
        contentView.addSubview(logoImageView)
        
        contentView.addSubview(diceesView)
        diceesView.addSubview(leftDiceImageView)
        diceesView.addSubview(rightDiceImageView)
        contentView.addSubview(rollButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Констрейнты для contentView
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            // Констрейнты для backgroundImageView
            backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            // Констрейнты для Лого
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            // Констрейнты для костей
            diceesView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            diceesView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            diceesView.widthAnchor.constraint(equalToConstant: 260),
            diceesView.heightAnchor.constraint(equalToConstant: 100),
            
            leftDiceImageView.topAnchor.constraint(equalTo: diceesView.topAnchor),
            leftDiceImageView.leadingAnchor.constraint(equalTo: diceesView.leadingAnchor),
            
            rightDiceImageView.topAnchor.constraint(equalTo: diceesView.topAnchor),
            rightDiceImageView.trailingAnchor.constraint(equalTo: diceesView.trailingAnchor),
            
            rollButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            rollButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            rollButton.widthAnchor.constraint(equalToConstant: 150),
            rollButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
} 
