package Model;

public class Aluno extends Pessoa {
    //Atributos
    private String matricula;
    private double nota;

    //Métodos
    //Constutor 
    public Aluno(String nome, String cpf, String matricula) {
        super(nome, cpf);
        this.matricula = matricula;
    }

    //Getter and Setters
    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }


    //Sobreescrita exibirinformacoes
    @Override
    public void exibirinformacoes(){
        super.exibirinformacoes();
        System.out.println("Matrícula: "+matricula);
        System.out.println("Nota: "+nota);
    }
}
