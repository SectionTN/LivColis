function verifCin(ch) {
  if (!ch || ch.length !== 8 || (ch.charAt(0) !== "0" && ch.charAt(0) !== "1")) {
    return false;
  }
  for (let i = 0; i < ch.length; i++) {
    if (!("0" <= ch.charAt(i) && ch.charAt(i) <= "9")) {
      return false;
    }
  }
  return true;
}


function verifAlpha(ch) {
  if (!ch || ch.length < 10 || ch.length > 100) {
    return false;
  }
  ch = ch.toLowerCase()
  for (let i = 0; i < ch.length; i++) {
    if (!("a" <= ch.charAt(i) && ch.charAt(i) <= "z" || ch.charAt(i) === " ")) {
      return false;
    }
  }
  return true;
}


function verifPostal(ch) {
  return ch !== "" && ch.length === 4 && !isNaN(ch)
}


function verifTransporteur(selection) {
  return selection.selectedIndex !== 0
}


function verif() {
  const cin = document.getElementById("expediteur").value;
  const nom = document.getElementById("nomdist").value;
  const addresse = document.getElementById("adressdist").value;
  const codep = document.getElementById("codepostal").value;

  const transporteur = document.getElementById("transporteur");

  const Foui = document.getElementById("fnon").checked;
  const Fnon = document.getElementById("foui").checked;


  if (!verifCin(cin)) {
    alert("cin incorrecte");
    return false;
  } else if (!verifAlpha(nom)) {
    alert("probleme de nom");
    return false;
  } else if (!verifAlpha(addresse)) {
    alert("probleme de adresse");
    return false;
  } else if (!verifPostal(codep)) {
    alert("code postal incorrect")
    return false;
  } else if (!Foui && !Fnon) {
    alert("selectionner si le produit fragile ou non");
    return false;
  } else if (!verifTransporteur(transporteur)) {
    alert("choix de transporteur est obligatoire")
    return false;
  }
  return true;
}

function verif2() {
  const non_livree = document.getElementById("nl").checked;
  const livree = document.getElementById("l").checked;

  if (!non_livree && !livree) {
    alert("Au moins une des cases est cochée")
    return false;
  }
  return true;
}
