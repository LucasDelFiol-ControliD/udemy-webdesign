export const saudacao = () => {
    let data = new Date().toLocaleDateString();
    return `Olá, seja muito bem-vindo, hoje é ${data}`;
}