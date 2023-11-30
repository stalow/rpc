import java.rmi.Remote;
import java.rmi.RemoteException;

// Créer l'interface de l'objet distant
public interface Mult extends Remote {
   void multiplication(int a, int b) throws RemoteException;
}