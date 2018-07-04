
import UIKit

class GameViewController: UIViewController {

    //labels that for x and y coordinates
    @IBOutlet weak var xCoordinate: UILabel!
    @IBOutlet weak var yCoordinate: UILabel!
    @IBOutlet weak var eventLogUpdate: UILabel!
    @IBOutlet weak var eventSupriseLabel: UILabel!
    
    //button labels to enable and disable
    @IBOutlet weak var northControlButton: UIButton!
    
    @IBOutlet weak var eastControlButton: UIButton!
    
    @IBOutlet weak var southControlButton: UIButton!
    
    @IBOutlet weak var westControlButton: UIButton!
    
    let gameModel = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventLogUpdate.isEnabled = false
//        gameModel.move(direction: .east)
//        gameModel.move(direction: .east)
//        print(gameModel.currentLocation.x)
//        gameModel.restart()
//        print(gameModel.currentLocation)
        
    }
    
    
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
        
    }
    
    
    
}

