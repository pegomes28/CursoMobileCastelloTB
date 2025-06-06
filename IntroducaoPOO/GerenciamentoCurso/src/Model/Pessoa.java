package Model;

public abstract class Pessoa {
    //Atributos(encapsulamento)
    private String nome;
    private String cpf;    

    //Métodos
    //Construtor 
    public Pessoa(String nome, String cpf){
        this.nome=nome;
        this.cpf=cpf;
    }

    // Getters and Setters
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    //Exibir Informações 
    public void exibirinformacoes(){
        System.out.println("Nome: "+nome);
        System.out.println("CPF: "+cpf);
    }
}
