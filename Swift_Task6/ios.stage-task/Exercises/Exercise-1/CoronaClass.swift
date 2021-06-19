import Foundation

class CoronaClass {

     var seats = [Int]()
     var nSeat: Int

     init(n: Int) {
       nSeat = n
     }

     func seat() -> Int {
        var place = 0
        var buffer = 0
        var placeIndex = 0

        if seats.isEmpty{
            seats.append(0)
        }

        else if !seats.contains(0){
            seats.insert(0, at: 0)
            return place
        }
        else if (seats[0] == 0 && seats.count == 1) || seats.last != nSeat - 1{
            place = nSeat - 1
            seats.append(place)
        }

        else{
            for i in 1..<seats.count{
                if (seats[i] - seats[i - 1] )/2 > buffer{
                    buffer = (seats[i] - seats[i - 1])/2
                    placeIndex = i
                    place = seats[i - 1] + buffer
                }
            }
            seats.insert(place, at: placeIndex)
        }
        return place
     }

     func leave(_ p: Int) {

        if seats.contains(p){
            seats.remove(at: seats.firstIndex(of: p)!)
        }
     }
}


