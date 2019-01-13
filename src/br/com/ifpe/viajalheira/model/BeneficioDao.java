package br.com.ifpe.viajalheira.model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/*@author Maria Beatriz Germano 
 * 
 *Classe responsável pelas ações referentes ao CRUD de Beneficios 
 */
public class BeneficioDao {

	private static final String PERSISTENCE_UNIT = "viajalheira";

	public void salvar(Beneficio beneficio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(beneficio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
	}

	public List<Beneficio> listar() {

		return listar(null);
	}

	public List<Beneficio> listar(Beneficio beneficio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		Query query = null;
		String descricao = beneficio != null ? beneficio.getDescricao(): "";
		if (descricao != null && !descricao.equals("")) {
			query = manager.createQuery("FROM Beneficio WHERE descricao LIKE :paramDescricao ORDER BY id");
			query.setParameter("paramDescricao", descricao);
		} else {
			query = manager.createQuery("FROM Beneficio ORDER BY id");
		}
		
		List<Beneficio> lista = query.getResultList();
		manager.close();
		factory.close();
		return lista;
	}

	public Beneficio buscarPorId(int id) {
		Beneficio obj = null;
		EntityManagerFactory factory =
		Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		obj = manager.find(Beneficio.class, id);
		manager.close();
		factory.close();
		return obj;
		}
	
	public void alterar(Beneficio beneficio) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT);
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.merge(beneficio);
		manager.getTransaction().commit();
		manager.close();
		factory.close();
		}
	
	
}
