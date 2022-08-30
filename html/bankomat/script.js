window.addEventListener('message', function(event) {
    var item = event.data;
    document.getElementById('ime').innerHTML = item.Ime
    document.getElementById('kes').innerHTML = '$'+item.Novac
    if (item.showUI == true){
        start()
    }
    if (item.showUI == false){
        exit()
    }
    if (item.type == "transakcija"){
      if (item.transakcija == 'prebacio')
      {
        document.getElementById('prebaci').style.display = 'none'
        trans = document.getElementById('transakcijelista')
        KOD = item.kod
        $('#transakcijelista').prepend(KOD);
      }
      if (item.transakcija == 'podigao')
      {
        document.getElementById('podigni').style.display = 'none'
        trans = document.getElementById('transakcijelista')
        KOD = item.kod
        $('#transakcijelista').prepend(KOD);
      }
      }
      if (item.transakcija == 'poslao')
      {
        document.getElementById('posalji').style.display = 'none'
        trans = document.getElementById('transakcijelista')
        KOD = item.kod
        $('#transakcijelista').prepend(KOD);
      }
      if (item.transakcija == 'primio')
      {
        document.getElementById('posalji').style.display = 'none'
        trans = document.getElementById('transakcijelista')
        KOD = item.kod
        $('#transakcijelista').prepend(KOD);
      }
});

$(document).keyup(function (e) {
    if (e.keyCode == 27) {
        $.post('http://revolucija_bankomat/izlaz', JSON.stringify({}));
    }
})

function prebacidugme(){
  kolicina = document.getElementById('prebaci-amount')
  if (kolicina.value.includes("+") == true || kolicina.value.includes("-") == true){
    $.post('http://revolucija_bankomat/Greska', JSON.stringify({}));
    kolicina.value = ""
    return
  }
  $.post('http://revolucija_bankomat/PrebaciNovac', JSON.stringify({"Novac":parseInt(kolicina.value)}));
  kolicina.value = ""
}

function podignidugme(){
  kolicina = document.getElementById('podigni-amount')
  if (kolicina.value.includes("+") == true || kolicina.value.includes("-") == true){
    $.post('http://revolucija_bankomat/Greska', JSON.stringify({}));
    kolicina.value = ""
    return
  }
  $.post('http://revolucija_bankomat/PodigniNovac', JSON.stringify({"Novac":parseInt(kolicina.value)}));
  kolicina.value = ""
}

function posaljidugme(){
  kolicina = document.getElementById('posalji-amount')
  igrac = document.getElementById('posalji-id')
  if (kolicina.value.includes("+") == true || kolicina.value.includes("-") == true){
    $.post('http://revolucija_bankomat/Greska', JSON.stringify({}));
    kolicina.value = ""
    return
  }
  if (igrac.value.includes("+") == true || igrac.value.includes("-") == true){
    $.post('http://revolucija_bankomat/Greska', JSON.stringify({}));
    igrac.value = ""
    return
  }
  $.post('http://revolucija_bankomat/PosaljiNovac', JSON.stringify({"Novac":parseInt(kolicina.value),"Igrac":parseInt(igrac.value)}));
  kolicina.value = ""
  igrac.value = ""
}


// -- Kad pritisne na "Prebaci", "Podigni" ili "Posalji" dugme, aktivira se ovo:
function otvorijs(otvr){
  prebaci = document.getElementById(otvr);
  prebaci.style="animation-duration: 0.1s;animation-name: otvori;"
  setTimeout(function(){
    prebaci.style="display:0";
  }, 50);
}

// -- Kad pritisne na "Izlaz", iz prebaci, podigni ili posalji polja, aktivira se ovo:
function izlazjs(izlz){
  prebaci = document.getElementById(izlz);
  inp = document.getElementById(izlz+'-amount');
  prebaci.style="animation-duration: 0.1s;animation-name: zatvori;"
  setTimeout(function(){
    prebaci.style="display:none";
    inp.value=""
  }, 50);
}

// -- WLCM screen, ovdje se aktivira sve kad se pritisne na id="wlcmdugme":
function wlcm_dugme(){
  wlcmdugme = document.getElementById("wlcmdugme");
  wlcm_full = document.getElementById("wlcm");
  wlcmdugme.style="animation-duration: 0.7s;animation-name: wlcm;"
  setTimeout(function(){ 
    wlcm_full.style="animation-duration: 0.1s;animation-name: zatvori;"
    setTimeout(function(){
      wlcm_full.style="display:none"
    }, 100);
  }, 600);

}

function start(){
  document.getElementById("wlcm").style = null
  document.getElementById('body').style = null
  document.getElementById("wlcmdugme").style= null
}

function exit(){
  document.getElementById('body').style.display= 'none'
  document.getElementById('wlcm').style.display= null
}


/* discord.gg/revolucija */