class Despesa {
    constructor(ano, mes, dia, tipo, descricao, valor) {
        this.ano = ano;
        this.mes = mes;
        this.dia = dia;
        this.tipo = tipo;
        this.descricao = descricao;
        this.valor = valor;
    }

    validarDados() {
        // Percorre cada um dos atributos do objeto
        for (let i in this) {
            if (this[i] == undefined || this[i] == '' || this[i] == null) {
                return false;
            }
        }
        return true;
    }
}

class BD {
    constructor() {
        let id = localStorage.getItem('id');
        if (id == null) {
            localStorage.setItem('id', 0);
        }
    }

    // Converte o objeto literal dado para a notação JSON
    gravar(d) {
        let id = this.getProximoId();
        localStorage.setItem(id, JSON.stringify(d)); // Parâmetros: identificação do objeto, dado a ser armazenado
        localStorage.setItem('id', id);
    }

    getProximoId() {
        let proximoId = localStorage.getItem('id');
        return parseInt(proximoId) + 1;
    }

    recuperarTodosRegistros() {
        // Array de despesas
        let despesas = [];

        let id = localStorage.getItem('id');

        // Recupera todas as despesas cadastradas em localStorage
        for (let i = 1; i <= id; i++) {
            // Converte o dado na notação JSON para objeto literal
            let despesa = JSON.parse(localStorage.getItem(i));

            // Não passa para o array despesas que foram excluídas
            if (despesa === null) {
                continue;
            }

            despesa.id = i;
            despesas.push(despesa);
        }

        return despesas;
    }

    pesquisar(despesa) {
        let despesasFiltradas = [];
        despesasFiltradas = this.recuperarTodosRegistros();

        // Ano
        if (despesa.ano != '') {
            despesasFiltradas = despesasFiltradas.filter(d => d.ano == despesa.ano);
        }

        // Mês
        if (despesa.mes != '') {
            despesasFiltradas = despesasFiltradas.filter(d => d.mes == despesa.mes);
        }

        // Dia
        if (despesa.dia != '') {
            despesasFiltradas = despesasFiltradas.filter(d => d.dia == despesa.dia);
        }

        // Tipo
        if (despesa.tipo != '') {
            despesasFiltradas = despesasFiltradas.filter(d => d.tipo == despesa.tipo);
        }

        // Descrição
        if (despesa.descricao != '') {
            despesasFiltradas = despesasFiltradas.filter(d => d.descricao == despesa.descricao);
        }

        // Valor
        if (despesa.valor != '') {
            despesasFiltradas = despesasFiltradas.filter(d => d.valor == despesa.valor);
        }

        return despesasFiltradas;
    }

    remover(id) {
        localStorage.removeItem(id);
    }
}

let bd = new BD();

function cadastrarDespesa() {
    let ano = document.getElementById('ano');
    let mes = document.getElementById('mes');
    let dia = document.getElementById('dia');
    let tipo = document.getElementById('tipo');
    let descricao = document.getElementById('descricao');
    let valor = document.getElementById('valor');

    let despesa = new Despesa(ano.value, mes.value, dia.value, tipo.value, descricao.value, valor.value);
    if (despesa.validarDados()) {
        console.log('Dados válidos');

        bd.gravar(despesa);

        document.getElementById('modal_titulo').innerHTML = 'Registro inserido com sucesso';
        document.getElementById('modal_titulo_div').className = 'modal-header text-success';
        document.getElementById('modal_conteudo').innerHTML = 'Despesa foi cadastrada com sucesso!'
        document.getElementById('modal_btn').innerHTML = 'Voltar';
        document.getElementById('modal_btn').className = 'btn btn-success';
        $('#modalRegistraDespesa').modal('show'); // Seletor de elementos do Jquery

        // Apaga os campos de preenchimento
        ano.value = '';
        mes.value = '';
        dia.value = '';
        tipo.value = '';
        descricao.value = '';
        valor.value = '';
    } else {
        console.log('Dados inválidos');

        document.getElementById('modal_titulo').innerHTML = 'Erro na inclusão do registro';
        document.getElementById('modal_titulo_div').className = 'modal-header text-danger';
        document.getElementById('modal_conteudo').innerHTML = 'Existem campos obrigatórios que não foram preenchidos.';
        document.getElementById('modal_btn').innerHTML = 'Voltar e corrigir';
        document.getElementById('modal_btn').className = 'btn btn-danger';
        $('#modalRegistraDespesa').modal('show'); // Seletor de elementos do Jquery
    }
}

function carregaListaDespesas(despesas = [], filtro = false) {
    if (despesas.length == 0 && filtro == false) {
        despesas = bd.recuperarTodosRegistros();
    }

    let listaDespesas = document.getElementById('listaDespesas');
    listaDespesas.innerHTML = '';

    // Criação dos elementos HTML de cada linha da tabela
    despesas.forEach(function(d) {
        // Cria as linhas da tabela (tr)
        let linha = listaDespesas.insertRow();

        // Cria as colunas da tabela (td)
        linha.insertCell(0).innerHTML = `${d.dia}/${d.mes}/${d.ano}`;
        
        switch (d.tipo) {
            case '1':
                d.tipo = 'Alimentação';
                break;
            case '2':
                d.tipo = 'Educação';
                break;
            case '3':
                d.tipo = 'Lazer';
                break;
            case '4':
                d.tipo = 'Saúde';
                break;
            case '5':
                d.tipo = 'Transporte';
        }

        linha.insertCell(1).innerHTML = d.tipo;
        linha.insertCell(2).innerHTML = d.descricao;
        linha.insertCell(3).innerHTML = d.valor;

        // Botão para exclusão de elementos
        let btn = document.createElement("button");
        btn.className = 'btn btn-danger';
        btn.innerHTML = '<i class="fas fa-times"></i>';
        btn.id = `id_despesa_${d.id}`;
        btn.onclick = function() {
            let id = this.id.replace('id_despesa_', '');
            bd.remover(id);
            window.location.reload();
        };
        linha.insertCell(4).append(btn);
    });
}

function pesquisarDespesa() {
    let ano = document.getElementById('ano').value;
    let mes = document.getElementById('mes').value;
    let dia = document.getElementById('dia').value;
    let tipo = document.getElementById('tipo').value;
    let descricao = document.getElementById('descricao').value;
    let valor = document.getElementById('valor').value;

    let despesa = new Despesa(ano, mes, dia, tipo, descricao, valor);
    let despesas = bd.pesquisar(despesa);

    carregaListaDespesas(despesas, true);
}