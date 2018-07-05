
import UIKit

class GameViewController: UIViewController {
    
    //labels that for x and y coordinates
    @IBOutlet weak var xCoordinate: UILabel!
    @IBOutlet weak var yCoordinate: UILabel!
    @IBOutlet weak var eventLogUpdate: UILabel!
    @IBOutlet weak var eventSupriseLabel: UILabel!
    
    @IBOutlet weak var mapLocationImageView: UIImageView!
    
    //button labels to enable and disable
    @IBOutlet weak var northControlButton: UIButton!
    
    @IBOutlet weak var eastControlButton: UIButton!
    
    @IBOutlet weak var southControlButton: UIButton!
    
    @IBOutlet weak var westControlButton: UIButton!
    
    let gameModel = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventLogUpdate.isEnabled = false
        mapLocationImageView.frame = CGRect(x: 170, y: 390
            , width: 40 , height: 35)
        
    }
    // global variables for dot movement !
    var yPosLabel = 390
    var xPosLabel = 170
    var newPos = CGRect(x: 170, y: 390
        , width: 40 , height: 35)
    
    let imageTypes = ["mapDot","mapDotAlert"]
    
    @IBAction func northButton(_ sender: UIButton) {
        gameModel.move(direction: .north)
        yCoordinate.text = String(gameModel.currentLocation.y)
        eventLogUpdate.isEnabled = true
        eventLogUpdate.text = "Moved North"
        eventSupriseLabel.text = gameModel.currentLocation.event
        if(gameModel.currentLocation.y == 2){
            northControlButton.isEnabled = false
        }
        else if (gameModel.currentLocation.y != -2){
            southControlButton.isEnabled = true
        }
        //        UIView.animate(withDuration: 1.5, animations: ({self.eventLogUpdate.frame = newPos }), completion: nil)
        yPosLabel -= 20 //move down on y axis
        newPos = CGRect(x: xPosLabel, y: yPosLabel
            , width: 40 , height: 35)
        self.mapLocationImageView.frame = newPos
//        self.mapLocationImageView.image = UIImage(named: imageTypes[1])
        checkSecretEvent()
    }
    
    @IBAction func eastButton(_ sender: UIButton) {
        gameModel.move(direction: .east)
        xCoordinate.text = String(gameModel.currentLocation.x)
        eventLogUpdate.isEnabled = true
        eventLogUpdate.text = "Moved East"
        eventSupriseLabel.text = gameModel.currentLocation.event
        if(gameModel.currentLocation.x == 2){
            eastControlButton.isEnabled = false
        }
        else if (gameModel.currentLocation.x != -2){
            westControlButton.isEnabled = true
        }
        xPosLabel += 20 //move down on y axis
        newPos = CGRect(x: xPosLabel, y: yPosLabel
            , width: 40 , height: 35)
        self.mapLocationImageView.frame = newPos
        checkSecretEvent()
    }
    
    @IBAction func southButton(_ sender: UIButton) {
        
        gameModel.move(direction: .south)
        yCoordinate.text = String(gameModel.currentLocation.y)
        eventLogUpdate.isEnabled = true
        eventLogUpdate.text = "Moved South"
        eventSupriseLabel.text = gameModel.currentLocation.event
        if (gameModel.currentLocation.y == -2){
            southControlButton.isEnabled = false
        }
        else if (gameModel.currentLocation.y != 2){
            northControlButton.isEnabled = true
        }
        yPosLabel += 20 //move down on y axis
        newPos = CGRect(x: xPosLabel, y: yPosLabel
            , width: 40 , height: 35)
        self.mapLocationImageView.frame = newPos
        checkSecretEvent()
    }
    
    @IBAction func westButton(_ sender: UIButton) {
        gameModel.move(direction: .west)
        xCoordinate.text = String(gameModel.currentLocation.x)
        eventLogUpdate.isEnabled = true
        eventLogUpdate.text = "Moved West"
        eventSupriseLabel.text = gameModel.currentLocation.event
        if(gameModel.currentLocation.x == -2){
            westControlButton.isEnabled = false
        }
        else if (gameModel.currentLocation.x != 2){
            eastControlButton.isEnabled = true
        }
        xPosLabel -= 20 //move down on y axis
        newPos = CGRect(x: xPosLabel, y: yPosLabel
            , width: 40 , height: 35)
        self.mapLocationImageView.frame = newPos
        checkSecretEvent()
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        gameModel.restart()
        xCoordinate.text = String(gameModel.currentLocation.x)
        yCoordinate.text = String(gameModel.currentLocation.y)
        
        
        //reset the buttons enable
        northControlButton.isEnabled = true
        southControlButton.isEnabled = true
        eastControlButton.isEnabled = true
        westControlButton.isEnabled = true
        
        eventLogUpdate.text = ""
        eventSupriseLabel.text = ""
        self.mapLocationImageView.frame = CGRect(x: 170, y: 390
            , width: 40 , height: 35)
        self.mapLocationImageView.image = UIImage(named: imageTypes[0])
        
    }
    // helper fuction to check for secre messages and change image
    func checkSecretEvent (){
        if yPosLabel == 370 && xPosLabel == 150 {
            self.mapLocationImageView.image = UIImage(named: imageTypes[1])
        }
        else{
            self.mapLocationImageView.image = UIImage(named: imageTypes[0])
        }
    }
    
    
    
}

