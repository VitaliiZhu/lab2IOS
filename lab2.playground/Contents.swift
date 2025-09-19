import UIKit

enum ApartmentType: String {
    case studio = "studio"
    case oneBedroom = "One Bedroom"
    case twoBedroom = "Two Bedroom"
}

struct Apartment {
    var rooms:Int = 1
    var floor:Int? = nil
    var balcony:Bool? = nil
    var ap_type:ApartmentType
    
    func Describe() -> String {
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
    var apartment:Apartment? = nil
    func Describe() -> String {
        var info = "Name : \(name) , "
        if let unwrappedApartment = apartment {
             info = info + String(" Apartment : \(unwrappedApartment.Describe())")
        } else {
             info = info + " Apartment : no info"
        }
        return info
    }
}

func describeApartment(apartment:Apartment) -> String {
    var result = "Type : \(apartment.ap_type) , Rooms : \(apartment.rooms) ,"
    if let apartrmentFlor = apartment.floor {
        result = result + " Floor : \(apartrmentFlor) ,"
    } else {
        result = result + " Floor : Unknown , "
    }
    if let apartmentBalcony = apartment.balcony {
        result = result + " Balcony : \(apartmentBalcony) "
    } else  {
        result = result + " Balcony : Unknown "
    }
    return result
}

var apartments: [Apartment] = [Apartment(rooms: 1, floor: 1, balcony: true, ap_type: .studio)]
let newApartment = Apartment(rooms: 2, floor: 1, balcony: false, ap_type: .twoBedroom)
apartments.append(newApartment)
let newApartment1 = Apartment(rooms: 1, balcony: false, ap_type: .oneBedroom)
apartments.append(newApartment1)
let newApartment2 = Apartment(rooms: 2, floor: 1, ap_type: .twoBedroom)
apartments.append(newApartment2)
let newApartment3 = Apartment(rooms: 1, ap_type: .studio)
apartments.append(newApartment3)
for apartment in apartments {
    print(apartment.Describe())
}
print(describeApartment(apartment: newApartment))
let mykola = Owner(name: "Mykola", apartment: apartments[1])
print(mykola.Describe())
let dimon = Owner(name: "Dmytro")
print(dimon.Describe())
