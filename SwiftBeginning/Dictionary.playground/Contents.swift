let toDoDic = [1:"A",11:"B",21:"C"]
var toDoDic2 : Dictionary<String,String> = ["A":"Study","B":"Main","C":"Einglish"]

toDoDic[11]
toDoDic[2]
toDoDic2["C"]
toDoDic2["B"] = "Japaness"
toDoDic2["A"] = ""
print(toDoDic2)

toDoDic2.removeValue(forKey: "A")
print(toDoDic2)

toDoDic2["B"] = nil
print(toDoDic2)

toDoDic2.removeAll()
print(toDoDic2)

for (k,v) in toDoDic {
    print("k:"+String(k),"v:"+String(v))
}

for key in toDoDic.keys {
    print(key)
}

for value in toDoDic.values {
    print(value)
}




