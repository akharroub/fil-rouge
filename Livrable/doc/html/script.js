function VisibleHistorique() {
    document.getElementsByClassName('text_historique')[0].style.visibility = "visible";
    document.getElementsByClassName('text_partenaires')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_actions')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_salles')[0].style.visibility = "hidden";
 //  document.getElementById('descriptif_historique').innerHTML = "Notre historique";
}

function VisiblePartenaires() {
    document.getElementsByClassName('text_partenaires')[0].style.visibility = "visible";
    document.getElementsByClassName('text_historique')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_actions')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_salles')[0].style.visibility = "hidden";
  // document.getElementById('descriptif_partenaires').innerHTML = "Nos partenaires";
}
 
function VisibleActions() {
    document.getElementsByClassName('text_actions')[0].style.visibility = "visible";
    document.getElementsByClassName('text_partenaires')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_historique')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_salles')[0].style.visibility = "hidden";
 //  document.getElementById('descriptif_actions').innerHTML = "Nos actions";
}
 
function VisibleSalles() {
    document.getElementsByClassName('text_salles')[0].style.visibility = "visible";
    document.getElementsByClassName('text_partenaires')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_actions')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_historique')[0].style.visibility = "hidden";
 //  document.getElementById('descriptif_salles').innerHTML = "Nos salles";
}
  
function VisibleConnection() {
    document.getElementById('sincrire').style.visibility = "visible";
    document.getElementsByClassName('text_partenaires')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_actions')[0].style.visibility = "hidden";
  document.getElementsByClassName('text_historique')[0].style.visibility = "hidden";
 //  document.getElementById('descriptif_salles').innerHTML = "Nos salles";
}

document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("lien_historique").addEventListener("click", VisibleHistorique);
    document.getElementById("lien_partenaires").addEventListener("click", VisiblePartenaires);
    document.getElementById("lien_actions").addEventListener("click", VisibleActions);
    document.getElementById("lien_salles").addEventListener("click", VisibleSalles);
   // document.getElementById("lien_sincrire").addEventListener("click", VisibleConnection);
  
});