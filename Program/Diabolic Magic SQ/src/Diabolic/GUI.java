package Diabolic;

import org.jpl7.*;
/**
 * Class to Handle the GUI of the Diabolic Magic Square Project
 */
public class GUI {
    /**
     * Method that connects the Prolog backend to the Java GUI
     */
    public static void prologInit(){
        Query.hasSolution("use_module(library(jpl))");
        Term swi = Query.oneSolution("current_prolog_flag(version_data,Swi)").get("Swi");
        String consult = "consult('diabolicMagicSquare-backend.pl')";
        System.out.println(consult + " " + (Query.hasSolution(consult) ? "succeeded" : "failed"));
    }

    /**
     * Query method to check if the square is Pandiagonal
     * @param square A list with the square values
     */
    public static boolean checkMagic(int square[]) {
        Term term0 = Util.intArrayToList(square);
        Query q = new Query("diabolic", term0);
        System.out.println(q.hasSolution());
        return q.hasSolution();
    }

    /**
     * Query method to show all the squares.
     */
    public static int[][]showAll() {
        Query query0 = new Query("showall(X)");
        Term[] solutions = query0.oneSolution().get("X").toTermArray();
        int[][] results = new int[solutions.length][solutions[0].toTermArray().length];
        for (int i = 0; i < solutions.length; i++) {
            Term[] matrix = solutions[i].toTermArray();
            for (int j = 0; j < matrix.length; j++) {
                results[i][j] = matrix[j].intValue();
            }
        }
        return results;
    }

    /**
     * Creates the number of squares requested.
     * @param number the number of squares requested.
     */
    public static int[][]create(int number) {
        String queryString = "diabolic(";
        switch (number) {
            case 1:  queryString += "A)";
                break;
            case 2:  queryString += "A,B)";
                break;
            case 3:  queryString += "A,B,C)";
                break;
            case 4:  queryString += "A,B,C,D)";
                break;
            case 5:  queryString += "A,B,C,D,E)";
                break;
            case 6:  queryString += "A,B,C,D,E,F)";
                break;
            case 7:  queryString += "A,B,C,D,E,F,G)";
                break;
            case 8:  queryString += "A,B,C,D,E,F,G,H)";
                break;
            case 9:  queryString += "A,B,C,D,E,F,G,H,I)";
                break;
            case 10: queryString += "A,B,C,D,E,F,G,H,I,J)";
                break;
            default: queryString += "A,B)";
                break;
        }
        int[][] results = new int[number][16];
        Query query = new Query(queryString);
        String [] opciones = {"A","B","C","D","E","F","G","H","I","J"};
        for (int i = 0; i < number; i++) {
            Term[] matrix = query.oneSolution().get(opciones[i]).toTermArray();
            for (int j = 0; j < matrix.length; j++) {
                results[i][j] = matrix[j].intValue();
            }
        }
        return results;

    }

}
