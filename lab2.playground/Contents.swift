import UIKit

enum ApartmentType: String {
    case studio = "studio"
    case oneBedroom = "One Bedroom"
    case twoBedroom = "Two Bedroom"
}

struct Apartment {
    var rooms: Int = 1
    var floor: Int? = nil
    var balcony: Bool? = nil
    var area: Int
    var ap_type: ApartmentType
    
    func describe() -> String {
        var result = "Type : \(ap_type) , Rooms : \(rooms) ,"
        
        if let apartrmentFlor = floor {
            result = result + " Floor : \(apartrmentFlor) ,"
        } else {
            result = result + " Floor : Unknown , "
        }
        if let apartmentBalcony = balcony {
            result = result + " Balcony : \(apartmentBalcony) "
        } else  {
            result = result + " Balcony : Unknown "
        }
        
        return result
    }
}

struct Owner {
    var name: String
    var apartment: Apartment? = nil
    func describe() -> String {
        var info = "Name : \(name) , "
        if let unwrappedApartment = apartment {
             info = info + String(" Apartment : \(unwrappedApartment.describe())")
        } else {
             info = info + " Apartment : no info"
        }
        return info
    }
}

func describeApartment(apartment:Apartment) -> String {
    return apartment.describe()
}
func calculateArea(apartments: [Apartment], type: ApartmentType) -> Int {
    var area = 0
   
    for ap in apartments {
        if type == ap.ap_type{
            area = area + ap.area
        }
    }
    return area
}
var apartments: [Apartment] = [Apartment(rooms: 1, floor: 1, balcony: true, area: 10, ap_type: .studio)]

let newApartment = Apartment(rooms: 2, floor: 1, balcony: false, area: 10, ap_type: .twoBedroom)
apartments.append(newApartment)
let newApartment1 = Apartment(rooms: 1, balcony: false, area: 10, ap_type: .oneBedroom)
apartments.append(newApartment1)
let newApartment2 = Apartment(rooms: 2, floor: 1, area: 10, ap_type: .twoBedroom)
apartments.append(newApartment2)
let newApartment3 = Apartment(rooms: 1, area: 10, ap_type: .studio)
apartments.append(newApartment3)
for apartment in apartments {
    print(apartment.describe())
}

print(String("Area of twoBedrooms = \(calculateArea(apartments: apartments, type: .twoBedroom))"))
print(describeApartment(apartment: newApartment))
let mykola = Owner(name: "Mykola", apartment: apartments[1])
print(mykola.describe())
let dimon = Owner(name: "Dmytro")
print(dimon.describe())
