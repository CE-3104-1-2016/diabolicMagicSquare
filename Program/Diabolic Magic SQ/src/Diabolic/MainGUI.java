package Diabolic;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;


/**
 * GUI form class
 */
public class MainGUI {
    private JPanel panel1;
    private JButton validateButton;
    private JButton generateButton;
    private JComboBox comboBox1;
    private JTextField T11;
    private JTextField T13;
    private JTextField T12;
    private JTextField T14;
    private JTextField T21;
    private JTextField T22;
    private JTextField T23;
    private JTextField T24;
    private JTextField T31;
    private JTextField T32;
    private JTextField T33;
    private JTextField T34;
    private JTextField T41;
    private JTextField T42;
    private JTextField T43;
    private JTextField T44;
    private int squareCount;
    private int squareValues[];

    /**
     * Runs the MainGUI window
     */
    public static void start() {
        JFrame frame = new JFrame("MainScreen");
        MainGUI window = new MainGUI();
        JPanel panel = window.panel1;
        frame.setContentPane(panel);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }

    /**
     * Constructor of the MainGUI class
     */
    public MainGUI(){
        if(comboBox1.getSelectedIndex()+2!=11){
            squareCount = comboBox1.getSelectedIndex()+2;
        }
        else{
            squareCount = 364;
        }
        validateButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent actionEvent) {
                squareValues = new int[16];
                boolean check =true;
                JTextField[] values = {T11, T12, T13, T14, T21, T22, T23, T24, T31, T32, T33, T34, T41, T42, T43, T44};
                for (int i = 0; i < values.length; i++) {
                    int value = validValue(values[i]);
                    if (value == -1) {
                        check = false;
                        JOptionPane.showMessageDialog(null, "ERROR: Invalid input, retry!");
                        break;
                    }
                    squareValues[i] = value;
                }
                if(check){Check.main(squareValues);}
            }
        });
        generateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                System.out.println(squareCount);
                if (squareCount != 364) {
                    Result.main(GUI.create(squareCount));
                } else {
                    Result.main(GUI.showAll());
                }

            }
        });
        comboBox1.addItemListener(new ItemListener() {
            @Override
            public void itemStateChanged(ItemEvent itemEvent) {
                if (comboBox1.getSelectedIndex() + 2 != 11) {
                    squareCount = comboBox1.getSelectedIndex() + 2;
                } else {
                    squareCount = 364;
                }
            }
        });
    }

    /**
     * Method that verify if a value is valid
     * @param inputText the text of the user entry
     * @return a code with the result of the operation -1 if is not valid
     */
    private int validValue(JTextField inputText){
        int value=0;
        try
        {
            String inputString = inputText.getText();
            if(inputString.equals("")){
                return -1;
            }
            value=Integer.parseInt(inputString);
            if(value > 0 && value <17)
                return value;
            else{
                return -1;
            }
        }
        catch(NumberFormatException e)
        {
            JOptionPane.showMessageDialog(null, "ERROR: Invalid input, retry!");
            return -1;
        }

    }

}
