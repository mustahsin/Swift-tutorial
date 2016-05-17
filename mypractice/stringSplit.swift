var email = "mustahsin64@gmail.com"

print("\(email)")

var email_base = String()
var domain = String()

var flag = 0

for characters in email.characters {
    if characters != "@" && flag == 0 {
        email_base += String(characters)
    }
    else if characters == "@"{
        flag = 1
    }
    else if characters != "@" && flag == 1 {
        domain += String(characters)
    }
}

print("\(email_base)")
print ("\(domain)")
