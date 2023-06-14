const modifiers = document.querySelectorAll('.dicethrow');
const abilities = document.querySelectorAll('.skill')
let xhr;
let raceList;
let classList;


window.onload = () => {
    let strength = parseInt(document.getElementById('strength').getAttribute('placeholder'))
    let dexterity = parseInt(document.getElementById('dexterity').getAttribute('placeholder'))
    let constitution = parseInt(document.getElementById('constitution').getAttribute('placeholder'))
    let wisdom = parseInt(document.getElementById('wisdom').getAttribute('placeholder'))
    let intelligence = parseInt(document.getElementById('intelligence').getAttribute('placeholder'))
    let charisma = parseInt(document.getElementById('charisma').getAttribute('placeholder'))
    let level = parseInt(document.getElementById('level').getAttribute('placeholder'))
    let race = document.getElementById('race').getAttribute('placeholder')
    let characterClass = document.getElementById('characterclass').getAttribute('placeholder')
    let featuresTraits = document.getElementById('features')

    //MODIFICADORES DE ATRIBUTOS
    strengthmod = document.getElementById('Strengthmod');
    strengthmod.setAttribute("placeholder", attributeConverter(strength));
    dexteritymod = document.getElementById('Dexteritymod');
    dexteritymod.setAttribute("placeholder", attributeConverter(dexterity));
    constitutionmod = document.getElementById('Constitutionmod');
    constitutionmod.setAttribute("placeholder", attributeConverter(constitution));
    wisdommod = document.getElementById('Wisdommod');
    wisdommod.setAttribute("placeholder", attributeConverter(wisdom));
    intelligencemod = document.getElementById('Intelligencemod');
    intelligencemod.setAttribute("placeholder", attributeConverter(intelligence));
    charismamod = document.getElementById('Charismamod');
    charismamod.setAttribute("placeholder", attributeConverter(charisma));

    //MODIFICADORES DE SALVACIÓN
    strengthmod = document.getElementById('Strength-save');
    strengthmod.setAttribute("placeholder", attributeConverter(strength));
    dexteritymod = document.getElementById('Dexterity-save');
    dexteritymod.setAttribute("placeholder", attributeConverter(dexterity));
    constitutionmod = document.getElementById('Constitution-save');
    constitutionmod.setAttribute("placeholder", attributeConverter(constitution));
    wisdommod = document.getElementById('Wisdom-save');
    wisdommod.setAttribute("placeholder", attributeConverter(wisdom));
    intelligencemod = document.getElementById('Intelligence-save');
    intelligencemod.setAttribute("placeholder", attributeConverter(intelligence));
    charismamod = document.getElementById('Charisma-save');
    charismamod.setAttribute("placeholder", attributeConverter(charisma));

    //MODIFICADORES DE HABILIDAD
    acrobatics = document.getElementById("Acrobatics");
    acrobatics.setAttribute("placeholder", attributeConverter(dexterity));
    animalHandling = document.getElementById("Animal Handling");
    animalHandling.setAttribute("placeholder", attributeConverter(wisdom));
    arcana = document.getElementById("Arcana");
    arcana.setAttribute("placeholder", attributeConverter(intelligence));
    athletics = document.getElementById("Athletics");
    athletics.setAttribute("placeholder", attributeConverter(strength));
    deception = document.getElementById("Deception");
    deception.setAttribute("placeholder", attributeConverter(charisma));
    historyability = document.getElementById("History");
    historyability.setAttribute("placeholder", attributeConverter(intelligence));
    insight = document.getElementById("Insight");
    insight.setAttribute("placeholder", attributeConverter(wisdom));
    intimidation = document.getElementById("Intimidation");
    intimidation.setAttribute("placeholder", attributeConverter(charisma));
    investigation = document.getElementById("Investigation");
    investigation.setAttribute("placeholder", attributeConverter(intelligence));
    medicine = document.getElementById("Medicine");
    medicine.setAttribute("placeholder", attributeConverter(wisdom));
    nature = document.getElementById("Nature");
    nature.setAttribute("placeholder", attributeConverter(intelligence));
    perception = document.getElementById("Perception");
    perception.setAttribute("placeholder", attributeConverter(wisdom));
    performance = document.getElementById("Performance");
    performance.setAttribute("placeholder", attributeConverter(charisma));
    persuasion = document.getElementById("Persuasion");
    persuasion.setAttribute("placeholder", attributeConverter(charisma));
    religion = document.getElementById("Religion");
    religion.setAttribute("placeholder", attributeConverter(intelligence));
    sleightOfHand = document.getElementById("Sleight of Hand");
    sleightOfHand.setAttribute("placeholder", attributeConverter(dexterity));
    stealth = document.getElementById("Stealth");
    stealth.setAttribute("placeholder", attributeConverter(dexterity));
    survival = document.getElementById("Survival");
    survival.setAttribute("placeholder", attributeConverter(wisdom));

    //OTROS MODIFICADORES
    proficiencyBonusMod = document.getElementById("proficiencybonus")
    proficiencyBonusMod.setAttribute("placeholder", setProficiencyBonus(level))

    armorclass = document.getElementById("ac")
    armorclass.setAttribute("placeholder", (10 + parseInt(attributeConverter(dexterity))))

    initiative = document.getElementById("initiative")
    initiative.setAttribute("placeholder", attributeConverter(dexterity))

    abilities.forEach(dicethrow => {
        dicethrow.addEventListener('click', function (e) {
            if (dicethrow.textContent == "Acrobatics") {
                alert("The result is " + dicethrowresult(dexterity))
            } else if (dicethrow.textContent == "Animal Handling") {
                alert("The result is " + dicethrowresult(wisdom))
            } else if (dicethrow.textContent == "Arcana") {
                alert("The result is " + dicethrowresult(intelligence))
            } else if (dicethrow.textContent == "Athletics") {
                alert("The result is " + dicethrowresult(strength))
            } else if (dicethrow.textContent == "Deception") {
                alert("The result is " + dicethrowresult(charisma))
            } else if (dicethrow.textContent == "History") {
                alert("The result is " + dicethrowresult(intelligence))
            } else if (dicethrow.textContent == "Insight") {
                alert("The result is " + dicethrowresult(wisdom))
            } else if (dicethrow.textContent == "Intimidation") {
                alert("The result is " + dicethrowresult(charisma))
            } else if (dicethrow.textContent == "Investigation") {
                alert("The result is " + dicethrowresult(intelligence))
            } else if (dicethrow.textContent == "Medicine") {
                alert("The result is " + dicethrowresult(wisdom))
            } else if (dicethrow.textContent == "Nature") {
                alert("The result is " + dicethrowresult(intelligence))
            } else if (dicethrow.textContent == "Perception") {
                alert("The result is " + dicethrowresult(wisdom))
            } else if (dicethrow.textContent == "Performance") {
                alert("The result is " + dicethrowresult(charisma))
            } else if (dicethrow.textContent == "Persuasion") {
                alert("The result is " + dicethrowresult(charisma))
            } else if (dicethrow.textContent == "Religion") {
                alert("The result is " + dicethrowresult(intelligence))
            } else if (dicethrow.textContent == "Sleight of Hand") {
                alert("The result is " + dicethrowresult(dexterity))
            } else if (dicethrow.textContent == "Stealth") {
                alert("The result is " + dicethrowresult(dexterity))
            } else if (dicethrow.textContent == "Survival") {
                alert("The result is " + dicethrowresult(wisdom))
            }

        });
    });

    //TIRADAS DE SALVACIÓN
    modifiers.forEach(dicethrow => {
        dicethrow.addEventListener('click', function (e) {
            if (dicethrow.textContent == "Strength") {
                alert("The result is " + dicethrowresult(strength))
            } else if (dicethrow.textContent == "Dexterity") {
                alert("The result is " + dicethrowresult(dexterity))
            } else if (dicethrow.textContent == "Constitution") {
                alert("The result is " + dicethrowresult(constitution))
            } else if (dicethrow.textContent == "Wisdom") {
                alert("The result is " + dicethrowresult(wisdom))
            } else if (dicethrow.textContent == "Intelligence") {
                alert("The result is " + dicethrowresult(intelligence))
            } else if (dicethrow.textContent == "Charisma") {
                alert("The result is " + dicethrowresult(charisma))
            }
        })
    });


    fetch("https://api.open5e.com/races/", {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify()
    })
        .then(response => response.json())
        .then(races => proccessRace(races, race));



   fetch("https://api.open5e.com/classes/", {
        method: "GET",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify()
    })
        .then(response => response.json())
        .then(classes => proccessClas(classes, characterClass));


}

//PROCESADO DE DATOS
function proccessRace(raceList, characterRace) {
    let speed = document.getElementById("speed");
    let featureTraits = document.getElementById("features");
    editedRaceList = filtrarCamposRaces(raceList);
    editedRaceList.forEach((race) => {
        if (race.name == characterRace) {
            speed.setAttribute("placeholder", race.speed);
            featureTraits.setAttribute("placeholder", race.traits);
        }
    })
}

function proccessClas(classList, characterClassName) {
    let maxhp = document.getElementById("maxhp");
    let level = parseInt(document.getElementById('level').getAttribute('placeholder'))
    let dice;
    editedClassList = filtrarCamposClasses(classList);
    editedClassList.forEach((characterClass) => {
        if (characterClass.name == characterClassName) {
            dice = characterClass.hit_dice.substr(2, 2)
            totalhp = level * parseInt(dice)
            maxhp.setAttribute("placeholder", totalhp)
        }
        })
}





//FILTRADO CAMPOS
function filtrarCamposRaces(raceList) {
    raceListFiltered = [];
    raceList['results'].forEach((race) => {

        let raceJson = {
            name: race.name,
            speed: race.speed.walk,
            traits: race.traits
        };
        raceListFiltered.push(raceJson);

    });
    console.log(raceListFiltered);
    return raceListFiltered;
}



function filtrarCamposClasses(classList) {
    classListFiltered = [];
    classList['results'].forEach((characterClass) => {

        let classJson = {
            name: characterClass.name,
            hit_dice: characterClass.hit_dice,
            traits: characterClass.desc
        };
        classListFiltered.push(classJson);

    });
    console.log(classListFiltered);
    return classListFiltered;
}

//CALCULADOR DE PROFICIENCY BONUS
function setProficiencyBonus(level) {
    switch (level) {
        case 1:
        case 2:
        case 3:
        case 4:
            return "+2"
        case 5:
        case 6:
        case 7:
        case 8:
            return "+3"
        case 9:
        case 10:
        case 11:
        case 12:
            return "+4"
        case 13:
        case 14:
        case 15:
        case 16:
            return "+5"
        case 17:
        case 18:
        case 19:
        case 20:
            return "+6"
    }
}

//CALCULADOR DE MODIFICADOR DE ATRIBUTOS
function attributeConverter(characteristic) {
    let modifier;
    switch (characteristic) {
        case 1:
            modifier = "-5"
            return modifier;
        case 2:
        case 3:
            modifier = "-4"
            return modifier;
        case 4:
        case 5:
            modifier = "-3"
            return modifier;
        case 6:
        case 7:
            modifier = "-2"
            return modifier;
        case 8:
        case 9:
            modifier = "-1"
            return modifier;
        case 10:
        case 11:
            modifier = "+0"
            return modifier;
        case 12:
        case 13:
            modifier = "+1"
            return modifier;
        case 14:
        case 15:
            modifier = "+2"
            return modifier;
        case 16:
        case 17:
            modifier = "+3"
            return modifier;
        case 18:
        case 19:
            modifier = "+4"
            return modifier;
        case 20:
            modifier = "+5"
            return modifier;
    }
}

//TIRADAS DE DADOS
function dicethrowresult(attribute) {
    attributeInt = parseInt(attributeConverter(attribute))
    result = (Math.floor(Math.random() * 20) + 1) + attributeInt
    return result
}

