package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class VagaBeneficioDao {


	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(VagaBeneficio vagaBeneficio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(vagaBeneficio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<VagaBeneficio> listar() {

		return listar(null);
	}

	public List<VagaBeneficio> listar(VagaBeneficio vagaBeneficio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
	    int vaga = vagaBeneficio != null ? vagaBeneficio.getVaga().getId(): 0;
		if (vaga > 0) {
			query = manager.createQuery("FROM VagaBeneficio WHERE vaga.id LIKE :paramVaga ORDER BY id");
			query.setParameter("paramVaga", vaga);
		} else {
			query = manager.createQuery("FROM VagaBeneficio ORDER BY id");
		}
		
		List<VagaBeneficio> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public VagaBeneficio buscarPorId(int id) {
		VagaBeneficio obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(VagaBeneficio.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(VagaBeneficio vagaBeneficio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(vagaBeneficio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
}
