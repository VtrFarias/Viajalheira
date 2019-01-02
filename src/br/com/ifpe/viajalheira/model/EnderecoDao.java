package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;


public class EnderecoDao {


	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(Endereco endereco) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(endereco);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<Endereco> listar() {

		return listar(null);
	}

	public List<Endereco> listar(Endereco endereco) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String rua = endereco != null ? endereco.getRua() : "";
		if (rua != null && !rua.equals("")) {
			query = manager.createQuery("FROM Endereco WHERE rua LIKE :paramRua ORDER BY rua");
			query.setParameter("paramRua", "%" + rua + "%");
		} else {
			query = manager.createQuery("FROM Endereco ORDER BY id");
		}
		List<Endereco> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public Endereco buscarPorId(int id) {
		Endereco obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Endereco.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Endereco endereco) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(endereco);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
}
