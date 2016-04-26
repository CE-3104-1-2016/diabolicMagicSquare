package Diabolic;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Class to confirm the message
 */
public class Check {
    private JButton cancelButton;
    private JPanel Panel;
    private JPanel panel1;
    private JButton confirmButton1;
    private JPanel panel;private static JFrame frame;
    private int values[];
    public static void  main(int pValues[]){

        frame = new JFrame("Confirm your Square");
        frame.setContentPane(new Check(pValues).panel1);
        frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        frame.pack();
        frame.setVisible(true);
    }
    public Check(int pValues[]) {
        values = pValues;
        confirmButton1.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                JOptionPane.showMessageDialog(null,GUI.checkMagic(values));
            }
        });
        cancelButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                frame.dispose();
            }
        });
    }

    private void createUIComponents() {

        panel = new JPanel(new GridLayout(1,1,20,20));
            JPanel matrix= new JPanel(new GridLayout(4,4,2,2));
            for (int item = 0; item < values.length; item++) {
                JLabel label= new JLabel("|"+ values[item]+"|");
                label.setHorizontalTextPosition(JLabel.LEFT);
                label.setFont(new Font("Serif", Font.BOLD, 16));
                matrix.add(label);

            }
            panel.add(matrix);


    }
}
