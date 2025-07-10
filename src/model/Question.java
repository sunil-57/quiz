package model;

public class Question {
    private String title;
    private int[] options = new int[4];
    private int correctIndex;

    public Question(String title, int option_1, int option_2, int option_3, int option_4, int correctIndex)
    {
        this.title = title;
        this.options[0] = option_1;
        this.options[1] = option_2;
        this.options[2] = option_3;
        this.options[3]= option_4;
        this.correctIndex = correctIndex;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int[] getOptions() {
        return options;
    }

    public void setOptions(int[] options) {
        this.options = options;
    }

    public int getCorrectIndex() {
        return correctIndex;
    }

    public void setCorrect_index(int correct_index) {
        this.correctIndex = correctIndex;
    }

    public void showOptions(){
        for(int i = 0; i < this.options.length; i++){
            System.out.println(i+1 + ". "+ options[i]);
        }
    }


    public boolean checkAnswer(int answer){
        if((answer) == this.correctIndex){
            return true;
        }
        return false;
    }
}
