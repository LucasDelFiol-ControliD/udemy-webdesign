var altura = 0;
var largura = 0;
var vidas = 1;
var tempo = 10;
ajustaTamanhoPalcoJogo();

// Recupera a dificuldade do jogo, informada na index.html
var nivel = window.location.search.replace('?', '');
var criaMosquitoTempo = 1500;
if (nivel === 'normal') {
    criaMosquitoTempo = 1500;
} else if (nivel === 'dificil') {
    criaMosquitoTempo = 1000;
} else if (nivel === 'impossivel') {
    criaMosquitoTempo = 750;
}

// Pega o tamanho do navegador
function ajustaTamanhoPalcoJogo() {
    altura = window.innerHeight;
    largura = window.innerWidth;
}

var cronometro = setInterval(function() {
    tempo--;
    if (tempo < 0) {
        clearInterval(cronometro); // Para o cronômetro
        clearInterval(criaMosquito); // Para de spawnar mosquitos
        window.location.href = 'vitoria.html'; // Ganha
    } else {
        document.getElementById('cronometro').innerHTML = tempo;
    }
}, 1000);

// Define a posição do mosquito
function posicaoAleatoria() {
    var existeMosquito = document.getElementById('mosquito');
    if (existeMosquito) {
        // Remove o mosquito anterior (caso exista)
        existeMosquito.remove();
        
        // Decrementa a quantidade de vidas
        if (vidas > 3) {
            window.location.href = 'fim_de_jogo.html'; // Perde
        } else {
            document.getElementById('v' + vidas).src = "Imagens/coracao_vazio.png";
            vidas++;
        }
    }

    var posicaoX = Math.floor(Math.random()*largura) - 90;
    var posicaoY = Math.floor(Math.random()*altura) - 90;

    posicaoX = posicaoX < 0 ? 0 : posicaoX;
    posicaoY = posicaoY < 0 ? 0 : posicaoY;

    // Cria o elemento HTML
    var mosquito = document.createElement('img');
    mosquito.src = 'Imagens/mosca.png';
    mosquito.className = tamanhoAleatorio() + ' ' + ladoAleatorio();
    mosquito.style.left = posicaoX + 'px';
    mosquito.style.top = posicaoY + 'px';
    mosquito.style.position = 'absolute';
    mosquito.id = 'mosquito';

    mosquito.onclick = function() {
        this.remove();
    }

    document.body.appendChild(mosquito);

    console.log('Mosquito na posição: ' + posicaoX + ', ' + posicaoY);
}

// Define o tamanho do mosquito
function tamanhoAleatorio() {
    var classe = Math.floor(Math.random()*3);

    switch (classe) {
        case 0:
            console.log('Tamanho do mosquito: 1');
            return 'mosquito1';
        case 1:
            console.log('Tamanho do mosquito: 2');
            return 'mosquito2';
        case 2:
            console.log('Tamanho do mosquito: 3');
            return 'mosquito3';
    }
}

// Define o lado do mosquito
function ladoAleatorio() {
    var classe = Math.floor(Math.random()*2);

    switch (classe) {
        case 0:
            console.log('Lado do mosquito: A');
            return 'ladoA';
        case 1:
            console.log('Lado do mosquito: B');
            return 'ladoB';
    }
}