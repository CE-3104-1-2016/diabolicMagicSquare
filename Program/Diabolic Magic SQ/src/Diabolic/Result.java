package Diabolic;


import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Class to show the result
 */
public class Result {
    private JButton exitButton;
    private JPanel Panel1;
    private JPanel panel;
    private JScrollPane scroll;
    private int resultSquares[][];
    private static JFrame frame;
    public Result(int result [][]) {
        resultSquares =result;
        exitButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent actionEvent) {
                frame.dispose();
            }
        }); // Closes the frame if the return button is pressed
    }

    public static void main(int result [][]) {

        frame = new JFrame("Result");
        frame.setContentPane(new Result(result).Panel1);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }


    private void createUIComponents() {
        int numRows=(int) Math.ceil(resultSquares.length/9.0);
        int numColumns= resultSquares.length/numRows;
        if (numRows*numColumns >= resultSquares.length){
            numColumns ++;
        }
        panel = new JPanel(new GridLayout(numRows,numColumns,20,20));
        for (int numMatrixes = 0; numMatrixes < resultSquares.length; numMatrixes++) {

            JPanel matrix= new JPanel(new GridLayout(4,4,2,2));
            for (int item = 0; item < resultSquares[numMatrixes].length; item++) {
                JLabel label= new JLabel("|"+ resultSquares[numMatrixes][item]+"|");
                label.setHorizontalTextPosition(JLabel.LEFT);
                label.setFont(new Font("Serif", Font.BOLD, 16));
                matrix.add(label);



            }
            panel.add(matrix);
        }


    }
}
