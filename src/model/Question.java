package model;

public class Question {
    private String title;
    private int[] options = new int[4];
    private int correct_index;

    public Question(String title, int option_1, int option_2, int option_3, int option_4, int correct_index)
    {
        this.title = title;
        this.options[0] = option_1;
        this.options[1] = option_2;
        this.options[2] = option_3;
        this.options[3]= option_4;
        this.correct_index = correct_index;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    public int getCorrect_index() {
        return correct_index;
    }

    public void setCorrect_index(int correct_index) {
        this.correct_index = correct_index;
    }

    public void showOptions(){
        for(int i = 0; i < this.options.length; i++){
            System.out.println(i+1 + " . "+ options[i]);
        }
    }


    public boolean checkAnswer(int answer){
        if((answer) == this.correct_index){
            return true;
        }
        return false;
    }
}
