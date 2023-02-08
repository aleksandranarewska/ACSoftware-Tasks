import SwiftUI

struct ContentView: View {
    @State private var location : CGPoint = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
    @GestureState private var startLocation : CGPoint? = nil
    var body: some View {
        let center = CGPoint(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        let dragGesture = DragGesture()
            .onChanged{ value in
                var newLocation = startLocation ?? location
                newLocation.x += value.translation.width
                newLocation.y += value.translation.height
                if getDistance(from: newLocation, to: center ) > 125{
                    return
                }
                self.location = newLocation
            }.updating($startLocation){
                (value, startLocation,transaction) in
                startLocation = startLocation ?? location
            }
        ZStack {
            Circle().strokeBorder(.black, lineWidth: 5).frame(width: 300, height: 300).position(center)
            Circle().strokeBorder(.black, lineWidth: 5).background(Circle().fill(.white)).frame(width: 50, height: 50).position(location).gesture(dragGesture)
        }
    }
    func getDistance(from:CGPoint,to:CGPoint)->Double{
        return sqrt((from.x-to.x)*(from.x-to.x)+(from.y-to.y)*(from.y-to.y))
    }
}
