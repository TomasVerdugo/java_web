
package root.model;

public class CalcularInteres {
    public double calcularInteresSimple(double principal, double tasaInteres, int tiempo){
        double interes = (principal * tasaInteres * tiempo) / 100;
        return interes;
    }
}
