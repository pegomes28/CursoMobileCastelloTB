package Controller;

import java.util.ArrayList;
import java.util.List;

import Model.Aluno;
import Model.Professor;

public class CursoController {
    //Atributos
    private String nomeCurso;
    private Professor professor;
    private List<Aluno> alunosList;

    //Métodos
    //Constutor
        public CursoController(String nomeCurso, Professor professor) {
        this.nomeCurso = nomeCurso;
        this.professor = professor;
        this.alunosList = new ArrayList<>();
    }

    //Métodos Próprios
    //Adicionar Alunos (Crud - Create, Read, esqueci o resto veyr)
    public void adicionarAluno(Aluno Aluno){
        alunosList.add(Aluno);
    }

    //Exibir Informações do Curso (read)
    public void exibirInformacoesCurso(){
        System.out.println("Nome do Curso: "+nomeCurso);
        System.out.println("Professor: "+professor.getNome());
        System.out.println("==================================");
        int contador = 0;
        for (Aluno aluno : alunosList) {
            contador++;
            System.out.println(contador+". "+aluno.getNome());
        }
        System.out.println("==================================");
    }
    // Lançar Nota
}

