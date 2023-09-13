import UIKit

class ScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        readSavedData()
        updateOutlets()
    }
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var fruitsControl: UISegmentedControl!
    @IBOutlet weak var vegetablesControl: UISegmentedControl!
    @IBOutlet weak var wholeGrainsControl: UISegmentedControl!
    @IBOutlet weak var leanProteinControl: UISegmentedControl!
    @IBOutlet weak var nutsSeedsControl: UISegmentedControl!
    @IBOutlet weak var dairyControl: UISegmentedControl!
    @IBOutlet weak var refinedGrainsControl: UISegmentedControl!
    @IBOutlet weak var fattyProteinsControl: UISegmentedControl!
    @IBOutlet weak var sweetsControl: UISegmentedControl!
    @IBOutlet weak var friedFoodsControl: UISegmentedControl!
    @IBOutlet weak var resetButton: UIButton!
    
    var fruitsValue: Int? {
        let fruitsScores = [0, 2, 4, 6, 7, 7, 7]
        return fruitsScores[fruitsControl.selectedSegmentIndex]
    }
    
    var vegetablesValue: Int? {
        let vegetablesScores = [0, 2, 4, 6, 7, 7, 7]
        return vegetablesScores[vegetablesControl.selectedSegmentIndex]
    }
    
    var leanProteinValue: Int? {
        let leanProteinScores = [0, 2, 4, 5, 5, 5, 4]
        return leanProteinScores[leanProteinControl.selectedSegmentIndex]
    }
    
    var wholeGrainsValue: Int? {
        let wholeGrainsScores = [0, 2, 4, 5, 5, 5, 4]
        return wholeGrainsScores[wholeGrainsControl.selectedSegmentIndex]
    }
    
    var nutsSeedsValue: Int? {
        let nutsSeedsScores = [0, 2, 4, 5, 5, 5, 4]
        return nutsSeedsScores[nutsSeedsControl.selectedSegmentIndex]
    }

    var dairyValue: Int? {
        let dairyScores = [0, 1, 2, 3, 3, 2, 0]
        return dairyScores[dairyControl.selectedSegmentIndex]
    }

    var refinedGrainsValue: Int? {
        let refinedGrainsScores = [0, -1, -2, -4, -6, -8, -10]
        return refinedGrainsScores[refinedGrainsControl.selectedSegmentIndex]
    }

    var fattyProteinsValue: Int? {
        let fattyProteinsScores = [0, -1, -2, -4, -6, -8, -10]
        return fattyProteinsScores[fattyProteinsControl.selectedSegmentIndex]
    }
    
    var sweetsValue: Int? {
        let sweetsScores = [0, -2, -4, -6, -8, -10, -12]
        return sweetsScores[sweetsControl.selectedSegmentIndex]
    }
    
    var friedFoodsValue: Int? {
        let friedFoodsScores = [0, -2, -4, -6, -8, -10, -12]
        return friedFoodsScores[friedFoodsControl.selectedSegmentIndex]
    }
    

    private func updateOutlets() {
        pointsLabel.text = "\(totalPoints())"
    }
    
    private func resetSegmentControls() {
        fruitsControl.selectedSegmentIndex = 0
        vegetablesControl.selectedSegmentIndex = 0
        leanProteinControl.selectedSegmentIndex = 0
        wholeGrainsControl.selectedSegmentIndex = 0
        nutsSeedsControl.selectedSegmentIndex = 0
        dairyControl.selectedSegmentIndex = 0
        refinedGrainsControl.selectedSegmentIndex = 0
        fattyProteinsControl.selectedSegmentIndex = 0
        sweetsControl.selectedSegmentIndex = 0
        friedFoodsControl.selectedSegmentIndex = 0
    }
    
    private func totalPoints() -> Int {
        let totalPoints = fruitsValue! + vegetablesValue! + leanProteinValue! + wholeGrainsValue! + nutsSeedsValue! + dairyValue! + refinedGrainsValue! + fattyProteinsValue! + sweetsValue! + friedFoodsValue!
        return totalPoints
    }
    
    private func saveData() {
        let saver = UserDefaults.standard
        saver.set(fruitsControl.selectedSegmentIndex, forKey: "Fruits")
        saver.set(vegetablesControl.selectedSegmentIndex, forKey: "Vegetables")
        saver.set(leanProteinControl.selectedSegmentIndex, forKey: "Lean Protein")
        saver.set(wholeGrainsControl.selectedSegmentIndex, forKey: "Whole Grains")
        saver.set(nutsSeedsControl.selectedSegmentIndex, forKey: "Nuts & Seeds")
        saver.set(dairyControl.selectedSegmentIndex, forKey: "Dairy")
        saver.set(refinedGrainsControl.selectedSegmentIndex, forKey: "Refined Grains")
        saver.set(fattyProteinsControl.selectedSegmentIndex, forKey: "Fatty Proteins")
        saver.set(sweetsControl.selectedSegmentIndex, forKey: "Sweets")
        saver.set(friedFoodsControl.selectedSegmentIndex, forKey: "Fried Foods")
    }
    
    private func readSavedData() {
        let reader = UserDefaults.standard
        fruitsControl.selectedSegmentIndex = reader.integer(forKey: "Fruits")
        vegetablesControl.selectedSegmentIndex = reader.integer(forKey: "Vegetables")
        leanProteinControl.selectedSegmentIndex = reader.integer(forKey: "Lean Protein")
        wholeGrainsControl.selectedSegmentIndex = reader.integer(forKey: "Whole Grains")
        nutsSeedsControl.selectedSegmentIndex = reader.integer(forKey: "Nuts & Seeds")
        dairyControl.selectedSegmentIndex = reader.integer(forKey: "Dairy")
        refinedGrainsControl.selectedSegmentIndex = reader.integer(forKey: "Refined Grains")
        fattyProteinsControl.selectedSegmentIndex = reader.integer(forKey: "Fatty Proteins")
        sweetsControl.selectedSegmentIndex = reader.integer(forKey: "Sweets")
        friedFoodsControl.selectedSegmentIndex = reader.integer(forKey: "Fried Foods")
    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        updateOutlets()
        saveData()
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        resetSegmentControls()
        updateOutlets()
        saveData()
    }
    
    
}
